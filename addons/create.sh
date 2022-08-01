#!/bin/bash

pwd_start=$PWD

_curl_github () {
  if [[ -n $GITHUB_TOKEN ]]; then
    curl -s -u $GITHUB_USERNAME:$GITHUB_TOKEN $1 ${@:2}
  else
    curl -s $1 ${@:2}
  fi
}

_process_directory () {
  # fix ur stuff autoexecconfig xd
  if ls $temp_dir/*.sp 1> /dev/null 2>&1; then
    mv $temp_dir/*.sp "./csgo/addons/sourcemod/scripting"
  fi

  if ls $temp_dir/*.inc 1> /dev/null 2>&1; then
    mv $temp_dir/*.inc "./csgo/addons/sourcemod/scripting/include"
  fi

  # unpack package
  if [[ -d "$1/package" ]]; then
    mv $1/package/* "$1"
  fi

  # directories
  if [[ -d "$1/maps" || -d "$1/addons" || -d "$1/cfg" ]]; then
    cp -r $1/* "./csgo"
  elif [[ -d "$1/sourcemod" || -d "$1/metamod" || -d "$1/stripper" ]]; then
    cp -r $1/* "./csgo/addons"
  elif [[ -d "$1/gamedata" || -d "$1/plugins" || -d "$1/scripting" || -d "$1/translations" ]];  then
    cp -r $1/* "./csgo/addons/sourcemod"
  fi
  
  # other files
  if ls $temp_dir/*.smx 1> /dev/null 2>&1; then
    mv $1/*.smx "./csgo/addons/sourcemod/plugins"
  fi

  if ls $temp_dir/*.games.txt 1> /dev/null 2>&1; then
    mv $1/*.games.txt "./csgo/addons/sourcemod/gamedata"
  fi

  if ls $temp_dir/*.phrases.txt 1> /dev/null 2>&1; then
    mv $1/*.phrases.txt "./csgo/addons/sourcemod/gamedata"
  fi
}

_extract_direct () {
  asset_link=$1

  if [ -z ${2+x} ]; then
    asset_name=${asset_link##*/}
  else
    asset_name=$2
  fi

  temp_dir=$(mktemp -d)

  echo "downloading $asset_link to $temp_dir/$asset_name"
  curl -sL $asset_link --output "$temp_dir/$asset_name"

  # perform post processing in the form of moving/extracting.
  case $asset_name in
    *.tar | *.tar.gz | *.tar.bz2 | *.tar.xz | *.tbz2 | *.tgz) tar xf "$temp_dir/$asset_name" -C "$temp_dir" && rm "$temp_dir/$asset_name" ;;
    *.rar) unrar x "$temp_dir/$asset_name" "$temp_dir" -idq && rm "$temp_dir/$asset_name" ;;
    *.zip) unzip -q "$temp_dir/$asset_name" -d "$temp_dir" && rm "$temp_dir/$asset_name" ;;
    *.7z) 7z x -y "$temp_dir/$asset_name" "-o$temp_dir" > /dev/null && rm "$temp_dir/$asset_name" ;;
  esac

  _process_directory $temp_dir

  rm -rf "$temp_dir"
}

# extract github release assets into a new folder. this could be both archived
# and single files. will always be the latest release.
_extract_gh_asset () {
  data=$(_curl_github https://api.github.com/repos/$1/$2/releases)

  if [ -z ${3+x} ]; then
    for asset in $(echo $data | jq -c -r '.[0].assets[]'); do
      asset_name=$(echo $asset | jq -r '.name')
      asset_link=$(echo $asset | jq -r '.browser_download_url')

      # first download the asset to a new folder.
      _extract_direct $asset_link $asset_name
    done
  else
    asset_name=$(echo $data | jq -c -r .[0].assets[$3].name)
    asset_link=$(echo $data | jq -c -r .[0].assets[$3].browser_download_url)

    _extract_direct $asset_link $asset_name
  fi
}

_extract_gh_source () {
  temp_dir=$(mktemp -d)

  if [ -z ${3+x} ]; then
    echo "downloading https://github.com/$1/$2 to $temp_dir"
    git clone --quiet https://github.com/$1/$2 $temp_dir --depth 1
  else
    echo "downloading https://github.com/$1/$2 ($3 branch) to $temp_dir"
    git clone --quiet https://github.com/$1/$2 $temp_dir --depth 1 --branch $3
  fi

  _process_directory $temp_dir

  rm -rf "$temp_dir"
}

_build_sm_plugin () {
  # sudo apt install libc6-dev lib32stdc++6
  cd ./csgo/addons/sourcemod/scripting

  chmod +x compile.sh
  chmod +x spcomp

  ./compile.sh $1
  mv ./compiled/* ../plugins

  cd $pwd_start
}

_clean_up () {
  echo "cleaning up..."

  cd ./csgo

  find . -name LICENSE\* -type f -delete
  find . -name CONTRIBUTING\* -type f -delete
  find . -name GPL\*.txt -type f -delete
  find . -name README\* -type f -delete
  find . -name CHANGELOG\* -type f -delete

  cd $pwd_start
}

mkdir -p ./csgo
