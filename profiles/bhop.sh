# sourcemod/metamod base
_extract_direct https://sm.alliedmods.net/smdrop/1.10/$(curl -sL https://sm.alliedmods.net/smdrop/1.10/sourcemod-latest-linux)
_extract_direct https://mms.alliedmods.net/mmsdrop/1.10/$(curl -sL https://mms.alliedmods.net/mmsdrop/1.10/mmsource-latest-linux)

_extract_direct http://www.bailopan.net/stripper/files/stripper-1.2.2-linux.tar.gz

# bhoptimer base
_extract_gh_asset "blankbhop" "jhud"
_extract_gh_asset "GAMMACASE" "HeadBugFix"
_extract_gh_asset "GAMMACASE" "PushFixDE"
_extract_gh_asset "GAMMACASE" "ShowPlayerClips"
_extract_gh_asset "hermansimensen" "eventqueue-fix"
_extract_gh_asset "jason-e" "rngfix"
_extract_gh_asset "KyleSanderson" "SteamWorks" "0"
_extract_gh_asset "Nairdaa" "bhoptimer-firstjumptick"
_extract_gh_asset "Nairdaa" "shavit-ssj"
_extract_gh_asset "rtldg" "sm_closestpos" "1"
_extract_gh_asset "shavitush" "bhoptimer"
_extract_gh_asset "t5mat" "crouchboostfix"

_extract_gh_source "shavitush" "bhoptimer"
_extract_gh_source "hermansimensen" "NoViewPunch"
_extract_gh_source "Vauff" "DynamicChannels"

# alliedmodders stuff
# cs:go movement unlocker [https://forums.alliedmods.net/showthread.php?t=255298]
_extract_direct "https://www.sourcemod.net/vbcompiler.php?file_id=141520" "csgo_movement_unlocker.smx"
_extract_direct "https://forums.alliedmods.net/attachment.php?attachmentid=141521" "csgo_movement_unlocker.games.txt"

# showtriggers [https://forums.alliedmods.net/showthread.php?t=290356]
_extract_direct "https://www.sourcemod.net/vbcompiler.php?file_id=158717" "showtriggers.smx"

# only download later to ensure that we have the dynamic detours versi of dhooks
_extract_gh_asset "peace-maker" "DHooks2" "0"

_extract_gh_source "GAMMACASE" "MomSurfFix"
_build_sm_plugin "momsurffix2.sp"

_extract_gh_source "rtldg" "mpbhops_but_working"
_build_sm_plugin "mpbhops_but_working.sp"

_extract_gh_asset "accelerator74" "Cleaner" "0"
