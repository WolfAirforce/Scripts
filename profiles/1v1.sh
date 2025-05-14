# sourcemod/metamod base
_extract_direct https://sm.alliedmods.net/smdrop/1.12/$(curl -sL https://sm.alliedmods.net/smdrop/1.12/sourcemod-latest-linux)
_extract_direct https://mms.alliedmods.net/mmsdrop/1.12/$(curl -sL https://mms.alliedmods.net/mmsdrop/1.12/mmsource-latest-linux)

_extract_direct "http://www.bailopan.net/stripper/files/stripper-1.2.2-linux.tar.gz"

_extract_gh_asset "KyleSanderson" "SteamWorks" "0"
_extract_direct "https://forums.alliedmods.net/attachment.php?attachmentid=183438&d=1598611003" "updater.zip"

# 1v1 base
_extract_gh_asset "splewis" "csgo-multi-1v1"

# ws
_extract_direct "https://ptah.zizt.ru/files/PTaH-V1.1.3-build20-linux.zip"

_extract_gh_asset "kgns" "weapons"
_extract_gh_asset "kgns" "gloves"

# gloves/menus.sp(328) : error 047: array sizes do not match, or destination array is too small
# _build_sm_plugin "gloves.sp"

# token mgr
_extract_direct "https://csgo-token.com/download/csgo.zip"

# rankme
_extract_gh_source "rogeraabbccdd" "Kento-Rankme"

# afk mgr
_extract_direct "https://www.sourcemod.net/vbcompiler.php?file_id=170330" "afk_manager4.smx"
_extract_direct "https://forums.alliedmods.net/attachment.php?attachmentid=166646" "afk_manager.phrases.txt"
_extract_direct "https://forums.alliedmods.net/attachment.php?attachmentid=168028" "afk_manager.inc"
