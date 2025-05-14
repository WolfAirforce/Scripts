SOURCEMOD_VERSION=${SOURCEMOD_VERSION:-1.12}

# sourcemod/metamod base
_extract_direct https://sm.alliedmods.net/smdrop/$SOURCEMOD_VERSION/$(curl -sL https://sm.alliedmods.net/smdrop/$SOURCEMOD_VERSION/sourcemod-latest-linux)
_extract_direct https://mms.alliedmods.net/mmsdrop/$SOURCEMOD_VERSION/$(curl -sL https://mms.alliedmods.net/mmsdrop/$SOURCEMOD_VERSION/mmsource-latest-linux)

_extract_direct http://www.bailopan.net/stripper/files/stripper-1.2.2-linux.tar.gz

_extract_gh_source "PaxPlay" "bhop-strafe-trainer"
_build_sm_plugin "strafe_trainer.sp"

_extract_gh_asset "blankbhop" "jhud"
_extract_gh_asset "GAMMACASE" "HeadBugFix" # Currently there's a support for CSGO and CSS...
_extract_gh_asset "GAMMACASE" "ShowPlayerClips"
_extract_gh_asset "hermansimensen" "eventqueue-fix" 
_extract_gh_asset "jason-e" "rngfix" # CSS and CS:GO are currently supported.
_extract_gh_asset "KyleSanderson" "SteamWorks" "0"
_extract_gh_asset "Nairdaa" "bhoptimer-firstjumptick" 
_extract_direct "https://raw.githubusercontent.com/blankbhop/bhoptimer-firstjumptick/refs/heads/master/translations/shavit-firstjumptick.phrases.txt"
_extract_gh_asset "Nairdaa" "shavit-ssj"
_extract_gh_asset "rtldg" "sm_closestpos" "1"
_extract_gh_asset "t5mat" "crouchboostfix"

_extract_gh_asset "GAMMACASE" "MomSurfFix" # Momentum mod surf/ramp fix ported to CSGO and CSS.

_extract_gh_source "rtldg" "mpbhops_but_working"
_build_sm_plugin "mpbhops_but_working.sp"

_extract_gh_asset "accelerator74" "Cleaner" "0"

# TODO: Throwing errors with old code style.
#_extract_gh_source "shavitush" "Oryx-AC"

#_build_sm_plugin "oryx.sp"
#_build_sm_plugin "oryx-configcheck.sp"
#_build_sm_plugin "oryx-sanity.sp"
#_build_sm_plugin "oryx-scroll.sp"
#_build_sm_plugin "oryx-strafe.sp"

_extract_gh_asset "ErikMinekus" "sm-ripext" "0"
_extract_gh_source "clugg" "sm-json"
# TODO: Loose folders "docs", "dependencies".

_extract_gh_asset "peace-maker" "DHooks2" "0" # We need to manually import this to build stuff.

_extract_gh_source "shavitush" "bhoptimer"
# TODO: Loose file "smbuild".

_build_sm_plugin "shavit-chat.sp"
_build_sm_plugin "shavit-checkpoints.sp"
_build_sm_plugin "shavit-core.sp"
_build_sm_plugin "shavit-hud.sp"
_build_sm_plugin "shavit-mapchooser.sp"
_build_sm_plugin "shavit-misc.sp"
_build_sm_plugin "shavit-rankings.sp"
_build_sm_plugin "shavit-replay-playback.sp"
_build_sm_plugin "shavit-replay-recorder.sp"
_build_sm_plugin "shavit-sounds.sp"
_build_sm_plugin "shavit-stats.sp"
_build_sm_plugin "shavit-tas.sp"
_build_sm_plugin "shavit-timelimit.sp"
_build_sm_plugin "shavit-wr.sp"
_build_sm_plugin "shavit-zones-json.sp"
_build_sm_plugin "shavit-zones.sp"

_extract_gh_source "Vauff" "DynamicChannels" # This plugin should theoretically work for any Source game with a 6 channel game_text entity. However, it has only been tested on CS:GO.

_extract_gh_asset "sbpp" "sourcebans-pp"

# showtriggers [https://forums.alliedmods.net/showthread.php?t=290356]
_extract_direct "https://www.sourcemod.net/vbcompiler.php?file_id=158717" "showtriggers.smx"
