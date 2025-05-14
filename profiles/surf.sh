# sourcemod/metamod base
_extract_direct https://sm.alliedmods.net/smdrop/1.12/$(curl -sL https://sm.alliedmods.net/smdrop/1.12/sourcemod-latest-linux)
_extract_direct https://mms.alliedmods.net/mmsdrop/1.12/$(curl -sL https://mms.alliedmods.net/mmsdrop/1.12/mmsource-latest-linux)

_extract_direct http://www.bailopan.net/stripper/files/stripper-1.2.2-linux.tar.gz

# surftimer base
_extract_gh_asset "surftimer" "SurfTimer"
_extract_gh_source "surftimer" "SurfTimer"

_extract_gh_asset "c0rp3n" "colorlib-sm"

_extract_gh_source "bcserv" "smlib" "transitional_syntax"
_extract_gh_source "Impact123" "AutoExecConfig" "development"

# surftimer recommended
_extract_gh_asset "surftimer" "SurfTimer-Mapchooser"

_extract_gh_asset "jason-e" "rngfix"
_extract_gh_asset "GAMMACASE" "HeadBugFix"
_extract_gh_asset "GAMMACASE" "PushFixDE"
_extract_gh_asset "t5mat" "crouchboostfix"
_extract_gh_asset "surftimer" "SurfTimer-discord"

_extract_gh_source "sneak-it" "Normalized-Run-Speed"

# alliedmodders stuff
# cs:go movement unlocker [https://forums.alliedmods.net/showthread.php?t=255298]
_extract_direct "https://www.sourcemod.net/vbcompiler.php?file_id=141520" "csgo_movement_unlocker.smx"
_extract_direct "https://forums.alliedmods.net/attachment.php?attachmentid=141521" "csgo_movement_unlocker.games.txt"

# only download later to ensure that we have the dynamic detours versi of dhooks
_extract_gh_asset "peace-maker" "DHooks2" "0"

# have to build ourselves cuz release isn't updated
_extract_gh_source "GAMMACASE" "MomSurfFix"
_build_sm_plugin "momsurffix2.sp"

_extract_gh_asset "accelerator74" "Cleaner" "0"
