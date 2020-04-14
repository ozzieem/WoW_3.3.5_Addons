--[[
HoloFriends addon created by Holo, continued by Zappster, followed by Andymon

Get the latest version at wow.curse.com

See HoloFriends_change.log for more informations  
]]

--[[

This file defines the default english localisation data

]]

HOLOFRIENDS_DIALOGDATEFORMAT = "Tooltip date format:\n(%%Y=year, %%m=month, %%d=day of month, %%H=hour {max. 24}, %%I=hour {max. 12}, %%M=minute, %%p=am or pm, %%A=weekday)";

HOLOFRIENDS_DIALOGFACTIONASKMERGEFRIENDGROUPS = "For all friends included in the friends list of |cffffd200%s|r:\nDo you want to overwrite the group assignment at the faction wide friends list with this one?";
HOLOFRIENDS_DIALOGFACTIONASKMERGEIGNOREGROUPS = "For all ignores included in the ignore list of |cffffd200%s|r:\nDo you want to overwrite the group assignment at the faction wide ignore list with this one?";
HOLOFRIENDS_DIALOGFACTIONMERGEFRIENDWARNING = "You are about to merge all friends of\n|cffffd200%s|r\nto the faction wide friends list.\n\n|cffffd200WARNING|r\nThe individual friends list is deleted!\nThis step is not recoverable!\nDepending on the options, this could let to data loss!\nThe friends list data are only saved localy at your harddrive.\n\n|cffffd200SUGGESTION|r\nMake a backup copy (i.e. to your USB-stik) of your HoloFriends friends list file:\n{WoW dir}/WTF/Account/{Your ACC}/SavedVariables/HoloFriends.lua\n\n|cffffd200Do you have a backup?|r";
HOLOFRIENDS_DIALOGFACTIONMERGEIGNOREWARNING = "You are about to merge all ignores of\n|cffffd200%s|r\nto the faction wide ignore list.\n\n|cffffd200WARNING|r\nThe individual ignore list is deleted!\nThis step is not recoverable!\nDepending on the options, this could let to data loss!\nThe ignore list data are only saved localy at your harddrive.\n\n|cffffd200SUGGESTION|r\nMake a backup copy (i.e. to your USB-stik) of your HoloFriends friends list file:\n{WoW dir}/WTF/Account/{Your ACC}/SavedVariables/HoloFriends.lua\n\n|cffffd200Do you have a backup?|r";
HOLOFRIENDS_DIALOGFACTIONPRIORITYFRIENDWARNING = "|cffffd200WARNING|r\nUsing the faction wide friends list give it priority over the in-game friends list.\n\nAdding or removing friends with other addons to or from the friends list of your characters, which using the faction wide friends list, will be revoked by HoloFriends.\nAdding or removing friends without HoloFriends loaded will be revoked if HoloFriends starts the next time.";
HOLOFRIENDS_DIALOGFACTIONPRIORITYIGNOREWARNING = "|cffffd200WARNING|r\nUsing the faction wide ignore list give it priority over the in-game ignore list.\n\nAdding or removing ignores with other addons to or from the ignore list of your characters, which using the faction wide ignore list, will be revoked by HoloFriends.\nAdding or removing ignores without HoloFriends loaded will be revoked if HoloFriends starts the next time.";

HOLOFRIENDS_FAQ00TITLE = "HoloFriends FAQ";
HOLOFRIENDS_FAQ011QUESTION = "Does this mod show when your friends were last logged on? I find that a very useful thing.";
HOLOFRIENDS_FAQ012ANSWER = "HoloFriends show you for your friends the date of last seen. As I know, its only possible to get the date of last login for guild members.";
HOLOFRIENDS_FAQ21QUESTION = "Anybody know what checking the little boxes does?";
HOLOFRIENDS_FAQ22ANSWER = "There are little check-boxes in front of the player names (have a look at the screenshot \"Display all friends\"). If this box is checked, then the friend is included in the in-game friends list of WoW, else the friend is only included in the friends list of HoloFriends.\nFriends in the in-game friends list of WoW are online updated by the game and you see the current status. But the in-game friends list has a limit of max. 100 friends.\nFriends without the checked box (only included in the friends list of HoloFriends) are not monitored by the game. HoloFriends has to check the status of this friends using the \"/who\" command of WoW. But this check is slow, because the game force a time break between the execution of two \"/who\" commands.";
HOLOFRIENDS_FAQ31QUESTION = "It says \"update the status of friends (>100), not monitored online by WoW, with one button click\" but that doesnt make it very clear.";
HOLOFRIENDS_FAQ32ANSWER = "Because of the slow scan with /who for the friends, not included in the in-game friends list of WoW (check-box at the friend not checked), a status update for this friends is not done automatically. You have to start the \"/who Scan\" manually by one click at the red button \"/who Scan\" in the upper right corner of the friends list window.\nKeep in Mind: If the \"/who Scan\" is running, the /who command will not work.";
HOLOFRIENDS_FAQ41QUESTION = "Why is \"set focus\" disabled in some pull down menus?";
HOLOFRIENDS_FAQ42ANSWER = "I had to disable it, because you would get an error message \"function blocked by blizzard\".\nI included an option in the HoloFriends options panel to disable all menu-modifications of HoloFriends, to enable the \"set focus\" pull down menu entry.\nThe setup of the focus seem to be an overall protected function in the game. I have no understanding, why focus is not only a combat protected function, like the raid-window.\nIt is a feature of the game, that protected functions don't work, if there is any unsigned modification of its appearing window, in this case the pull down menu.";
HOLOFRIENDS_FAQ51QUESTION = "Why is in a raid in combat the raidmember window empty, if HoloFriends is loaded?";
HOLOFRIENDS_FAQ52ANSWER = "It is a feature of the game, that protected windows don't work in combat, if there is any unsigned modification of its appearing window.\nThe raid-window is part of the friends-window, where also the friends list window is a part of it. And the friends list window is modified by HoloFriends. And HoloFriends is not signed by Blizz.";
HOLOFRIENDS_FAQ61QUESTION = "Is there a way to keep the groups and membership in those groups in sync across your alts?";
HOLOFRIENDS_FAQ62ANSWER = "Yes.\nYou can use a faction wide friends list for some or all your alts, where all this chars using the same friends list in HoloFriends. Also the online friends list at the server is synchronized.\nOr you can manually sync single groups of your alts.\n\nThe addition to the faction wide friends list and also the sync of single groups is accomplished at the share frame of HoloFriends. You find it over the lowermost middle button at the friends list window or by navigating to \"Main menu -> Interface -> Addon's -> HoloFriends -> Share friends\".\n\nTo add a char to the faction wide friends list, select it from the pull down button in the upper part of the window, and click at the add button in the lower part of the window, in the faction wide friends list section. Do not mark any entry in the lists.\n\nTo share/update a group with other chars of you, select the origin char from the pull down button on top of the lists. Mark the groups to share at the check button of the group in the left list. Mark your destination chars at the right list, and click at the \"add\"/\"update\"-button below the lists. \"add\" only add not existing friends to the groups of the destination chars and \"update\" synchronice the data of all friends of the selected groups with your selected destination chars.\nThere is an option at the HoloFriends options panel, which allow to mark removed friends at the origin group in the group of the destination chars. Friends are moved to other selected groups automatically, but not removed from the groups. You have to remove it manually. ";
HOLOFRIENDS_FAQ71QUESTION = "Thanks for the intro. Will this also keep the groups and members in sync or will i have to follow this proceduce each time i add a member to a group and or create new groups? It would be great if there was an option to keep these in sync without the \"update\" process you described.";
HOLOFRIENDS_FAQ72ANSWER = "The faction wide friends list feature of HoloFriends is what you are looking for. For its use, see the third paragraph of the description above.\n\nThe faction wide friends list is one single friends list for some or all your alts of one faction of the realm. There is no sharing anymore. All changes to the friends list are done for all chars, and the online friends lists at the WoW-server of your alts are synchronized at login.\nBut, there is a limit with this faction wide friends list feature: HoloFriends need priority over the friends lists of WoW. This means, that no other friends list addon will work together with HoloFriends for the chars of you, which are using the faction wide friends list feature.";
HOLOFRIENDS_FAQ81QUESTION = "I wonder if it's possible to remove a friend from one character and then sync that remove to the other characters. Ie if I remove friend X from my char and then select the other chars will it remove the friend from their lists too?";
HOLOFRIENDS_FAQ82ANSWER = "If you are using the faction wide friends list, the online friends lists of your alts at the server are updated to the state of the HoloFriends friends list after you login to the alt with HoloFriends loaded. Thats, if you remove a friend from the faction wide HoloFriends friends list, it is removed automaticly from the servers friends list at login to your alt.\n\nIf you are using the normal mode with single friends lists for all your alts, you have to share the group in the share panel of HoloFriends to your alts. If one friend in the shared group was removed, it is optional only marked (strike through) at the friends lists of your alts, but not removed. You have to remove it manually after login to your alt. (Thats, to allow the support of other addons.)";
HOLOFRIENDS_FAQ091QUESTION = "Is there a way to automatically sync your friends lists or a way to select all the names in the manual sync? Unless I am missing something, I've only been able to sync by clicking on each individual name one at a time.";
HOLOFRIENDS_FAQ092ANSWER = "You can also share whole groups by checking the group. After checking, the group is collapsed, but has still the check-box checked.";
HOLOFRIENDS_FAQ101QUESTION = "My other friend list addon don't work like expected if I'm using HoloFriends too. Is HoloFriends not compatible?";
HOLOFRIENDS_FAQ102ANSWER = "Yes / No\nHoloFriends should be compatible to other addons, if you are using single friends lists for every char of you.\n\nThe faction wide friends list feature of HoloFriends is not compatible with some other friend list addons. Mainly adding or removing friends by other addons is ignored by the faction wide friends list of HoloFriends, because the faction wide friends list need priority over the in-game friends list. Thats, if you make changes to the in-game friends list without HoloFriends loaded, the faction wide friends list of HoloFriends will undo it, the next time HoloFriends is loaded. So, if you play at different computers or don't use HoloFriends all time, you should not use the faction wide friends list feature of Holofriends.";
HOLOFRIENDS_FAQ111QUESTION = "Some time ago I used HoloFriends with a faction wide friends list, but played without it for some time now. If I'm now load HoloFriends again, will it undo all my changes to the friends list I've done in the meantime?";
HOLOFRIENDS_FAQ112ANSWER = "If a faction wide friends list was not used for a time of more then 30 days, HoloFriends will ask you at login, if you want to load it and undo all other changes or start with your actual single in-game friends list. The faction wide friends list still exist, and you can access it over the sharing window.";

HOLOFRIENDS_HOMEPAGEACTUAL = "After a long time, the next big update to HoloFriends is there. Beside some new functions, it now feature an ignore list similar to the friends list. Now you get the ability to share ignores, use a faction wide ignore list, set an unlimited number of offline ignores, and much more.\n\nBecause of the many changes to HoloFriends to integrate the ignore list handling and the complete rewrite of the ignore list code, this new version is released as an beta version. I tested it extensive by myself, and hope there are no bugs, but who knows.";
HOLOFRIENDS_HOMEPAGEADDRESS = "The project home is:\nhttp://wow.curseforge.com/projects/holo-friends-continued/\nThere you will find a ticket system for feature requests and bug reports:\nhttp://wow.curseforge.com/projects/holo-friends-continued/tickets/";
HOLOFRIENDS_HOMEPAGEAIM = "This addon modify the friends window of WoW to offer you a better management of your friends and ignores.";
HOLOFRIENDS_HOMEPAGELOCALIZATION = "Localization by\nAndymon - German (deDE)\nzwlong9069 - Simplified Chinese (zhCN)\nAladdinn, zwlong9069 - Traditional Chinese (zhTW)\nmarturo77 - Latin American Spanish (esMX)\noXid_FoX - French (frFR)";
HOLOFRIENDS_HOMEPAGEREMARKSTITLE = "Remarks";
HOLOFRIENDS_HOMEPAGESEARCH = "You would like to have HoloFriends at your language?\nI'm looking for translators to HoloFriends and the WEB page content.\nSend me a note at curse, if you want to join the team as translator. The translations are easily managed with a WEB interface.\nPublic translations at curse are closed.";
HOLOFRIENDS_HOMEPAGETITLE = "HoloFriends (continued) v0.440";

HOLOFRIENDS_INITADDONLOADED = "HoloFriends AddOn v%.3f loaded";
HOLOFRIENDS_INITINVALIDLISTVERSION = "Your HoloFriends data was written by a newer version of HoloFriends (%s) - to prevent any corruption of your data, nothing will be saved or loaded";
HOLOFRIENDS_INITLOADFACTIONSFRIENDSLIST = "|cffffd200WARNING:|r The faction wide friends list of this character was not loaded for a long time.\nMaybe you played without HoloFriends loaded and for now want to load the in-game friends list for this character.\nContinue loading this faction wide friends list for this character will undo all changes to the in-game friends list you done without HoloFriends loaded.\nLoad the faction wide friends list?";
HOLOFRIENDS_INITLOADFACTIONSIGNORELIST = "|cffffd200WARNING:|r The faction wide ignore list of this character was not loaded for a long time.\nMaybe you played without HoloFriends loaded and for now want to load the in-game ignore list for this character.\nContinue loading this faction wide ignore list for this character will undo all changes to the in-game ignore list you done without HoloFriends loaded.\nLoad the faction wide ignore list?";
HOLOFRIENDS_INITSHOWONLINEATLOGIN = "List of your online friends:";

HOLOFRIENDS_LISTFEATURES0TITLE = "Features";

HOLOFRIENDS_LISTFEATURES11 = "handle a single faction wide friends and ignore list for some or all your chars";
HOLOFRIENDS_LISTFEATURES12 = "order your friends and ignore list in groups";
HOLOFRIENDS_LISTFEATURES13 = "manage more than 100 friends and more than 50 ignores";
HOLOFRIENDS_LISTFEATURES14 = "update the status of friends (>100), not monitored online by WoW, with one button click";
HOLOFRIENDS_LISTFEATURES15 = "ignore all chat messages and invitations to group, guild, and duel for offline ignores";
HOLOFRIENDS_LISTFEATURES16 = "show a message, if one of your in-game monitored friends or ignores vanished";
HOLOFRIENDS_LISTFEATURES17 = "optional show list of online friends in the chat window at startup";
HOLOFRIENDS_LISTFEATURES18 = "substitute all friend names and your char names, i.e. to the letter box";
HOLOFRIENDS_LISTFEATURES19 = "HoloFriends help (FAQ) at the interface options panel";

HOLOFRIENDS_LISTFEATURES21 = "add long comments (up to 500 letters) to your friends and ignore list";
HOLOFRIENDS_LISTFEATURES22 = "the first 48 letters of the comments are saved to the in-game friend notes";
HOLOFRIENDS_LISTFEATURES23 = "monitor notes of the in-game friends list (support for other addons)";
HOLOFRIENDS_LISTFEATURES24 = "optional upend in-game friend notes with HoloFriends comments";
HOLOFRIENDS_LISTFEATURES25 = "display area or comment, and optional level behind the friends name";
HOLOFRIENDS_LISTFEATURES26 = "show extended informations at a tooltip beside the friend list entry";

HOLOFRIENDS_LISTFEATURES31 = "optional list only online friends";
HOLOFRIENDS_LISTFEATURES32 = "optional show only groups with online friends at the friends list";
HOLOFRIENDS_LISTFEATURES33 = "optional sort all online friends at the top of the group lists";
HOLOFRIENDS_LISTFEATURES34 = "optional display of class icons to friends";
HOLOFRIENDS_LISTFEATURES35 = "optional display of friend name in class color";
HOLOFRIENDS_LISTFEATURES36 = "save the date of last seen for your friends";
HOLOFRIENDS_LISTFEATURES37 = "save and set data for your own chars (if included in the friends list)";
HOLOFRIENDS_LISTFEATURES38 = "show the number of online/offline friends and ignores";

HOLOFRIENDS_LISTFEATURES41 = "add players to the friends or ignore list by pull down menus (no friends window needed)";
HOLOFRIENDS_LISTFEATURES42 = "add the who-request to several pull down menus";
HOLOFRIENDS_LISTFEATURES43 = "optional black opaque background for pull down menus";
HOLOFRIENDS_LISTFEATURES44 = "optional disable pull down menu modifications (to allow set focus)";

HOLOFRIENDS_LISTFEATURES51 = "share your friends and ignores including the comments across your other chars";
HOLOFRIENDS_LISTFEATURES52 = "update friends and ignore data between your chars";
HOLOFRIENDS_LISTFEATURES53 = "optional merge HoloFriends comments during sharing";
HOLOFRIENDS_LISTFEATURES54 = "share and update whole groups of friends and ignores";
HOLOFRIENDS_LISTFEATURES55 = "the update of groups optional mark not existing friends/ignores at the destination list";
HOLOFRIENDS_LISTFEATURES56 = "merge the lists of some or all your chars to one faction wide friends/ignore list";
HOLOFRIENDS_LISTFEATURES57 = "allow separation of your chars from the faction wide friends/ignore list";

HOLOFRIENDS_MSGDELETECHARDIALOG = "Do you really want to delete all data of |cffffd200%s|r?";
HOLOFRIENDS_MSGDELETECHARDONE = "deleted %s's data";
HOLOFRIENDS_MSGDELETECHARNOTFOUND = "%s not found, please check the correct spelling";

HOLOFRIENDS_MSGFACTIONMERGEDONE = "Merged %s to the faction wide list";
HOLOFRIENDS_MSGFACTIONNOMERGE = "ABORTED: No merging to the faction wide list done";

HOLOFRIENDS_MSGFRIENDLIMITALERT = "You can only monitor %d friends!";
HOLOFRIENDS_MSGFRIENDMISSINGONLINE = "Your friend %s vanished from the online friends list.";
HOLOFRIENDS_MSGFRIENDONLINEDISABLED = "Online state monitoring of friend %s disabled.";
HOLOFRIENDS_MSGFRIENDONLINEENABLED = "Online state monitoring of friend %s enabled.";

HOLOFRIENDS_MSGIGNOREDUEL = "Duel cancelled - %s is at your offline ignore list";
HOLOFRIENDS_MSGIGNOREINVITEGUILD = "Guild invitation declined - %s is at your offline ignore list";
HOLOFRIENDS_MSGIGNORELIMITALERT = "You can only monitor %d ignores!";
HOLOFRIENDS_MSGIGNOREMISSINGONLINE = "Your ignore %s vanished from the online ignores list.";
HOLOFRIENDS_MSGIGNOREONLINEDISABLED = "Online ignore monitoring of %s disabled.";
HOLOFRIENDS_MSGIGNOREONLINEENABLED = "Online ignore monitoring of %s enabled.";
HOLOFRIENDS_MSGIGNOREPARTY = "Party invitation declined - %s is at your offline ignore list";
HOLOFRIENDS_MSGIGNORESIGNGUILD = "Sign of guild charter declined - %s is at your offline ignore list";

HOLOFRIENDS_MSGSCANDONE = "Done scanning extra friends.";
HOLOFRIENDS_MSGSCANSTART = "%d friends will be scanned. This will take about %f seconds to complete. /who requests will not work during this time.";
HOLOFRIENDS_MSGSCANSTOP = "Scan stopped";

HOLOFRIENDS_OPTIONS0LISTENTRY = "HoloFriends";
HOLOFRIENDS_OPTIONS0NEEDACCEPT = "To take effect in the share window, you have to accept the options first !";
HOLOFRIENDS_OPTIONS0NEEDRELOAD = "To take effect, you have to reload the character !";
HOLOFRIENDS_OPTIONS0NOTFACTION = "This option is always off for chars using the faction wide friends list !";
HOLOFRIENDS_OPTIONS0REALID = "This option is always on for BNet friends !";
HOLOFRIENDS_OPTIONS0WINDOWTITLE = "HoloFriends options";

HOLOFRIENDS_OPTIONS1SECTIONFLW = "Friends list window";
HOLOFRIENDS_OPTIONS1BNSHOWCHARNAME = "Show char name behind BettleNet real name";
HOLOFRIENDS_OPTIONS1BNSHOWCHARNAMETT = "If checked, the char name of the RealID friends is shown behind the real name, which is shown in its faction color.";
HOLOFRIENDS_OPTIONS1SETDATEFORMAT = "Change the default date and time format";
HOLOFRIENDS_OPTIONS1SETDATEFORMATTT = "If checked, you are requested to change the default date and time format, used to show the time of last seen at the friends list tooltips.";
HOLOFRIENDS_OPTIONS1SHOWCLASSCOLOR = "Show friends name in class color in the friends list";
HOLOFRIENDS_OPTIONS1SHOWCLASSCOLORTT = "If checked, the friends name is shown in its class color in the friends list.";
HOLOFRIENDS_OPTIONS1SHOWCLASSICONS = "Show class icons in friends list";
HOLOFRIENDS_OPTIONS1SHOWCLASSICONSTT = "If checked, the class icons in front of the friends name in the friends list are shown.";
HOLOFRIENDS_OPTIONS1SHOWGROUPS = "Show also empty groups in the compact friends list mode";
HOLOFRIENDS_OPTIONS1SHOWGROUPSTT = "If checked, all groups are always shown, else in compact mode (|cffffd200Show Offline Friends|r in the friends list window is not checked) only groups with online friends are shown.";
HOLOFRIENDS_OPTIONS1SHOWLEVEL = "Show friends level in friends list";
HOLOFRIENDS_OPTIONS1SHOWLEVELTT = "If checked, the level of the friend is shown after the friends name in the friends list.";
HOLOFRIENDS_OPTIONS1SORTONLINE = "Sort online friends on the top";
HOLOFRIENDS_OPTIONS1SORTONLINETT = "If checked, all online friends are listed on the top of the group lists followed by all offline friends.";

HOLOFRIENDS_OPTIONS2SECTIONNOTES = "In-game friend notes handling";
HOLOFRIENDS_OPTIONS2MERGENOTES = "Merge HoloFriends comments with in-game friends notes";
HOLOFRIENDS_OPTIONS2MERGENOTESTT = "If checked, the HoloFriends comments are upended to the in-game friends notes or vice versa depending on the following priority switch.";
HOLOFRIENDS_OPTIONS2NOTESPRIORITYOFF = "In-game friends notes have priority";
HOLOFRIENDS_OPTIONS2NOTESPRIORITYOFFTT = "If checked, changed in-game friends notes will replace the HoloFriends comments else HoloFriends comments always undo changes to the in-game friends notes. The HoloFriends comment-edit set always both.";
HOLOFRIENDS_OPTIONS2NOTESPRIORITYON = "In-game friends notes are followed by HoloFriends comments";
HOLOFRIENDS_OPTIONS2NOTESPRIORITYONTT = "If checked, this define the upend order to in-game friends notes + HoloFriends comments else it is HoloFriends comments + in-game friends notes. (In-game friends notes have a max. length of 48 letters.)";

HOLOFRIENDS_OPTIONS3SECTIONSHARE = "Share window";
HOLOFRIENDS_OPTIONS3MARKREMOVE = "Mark at the target list the group entries not existing at the source list";
HOLOFRIENDS_OPTIONS3MARKREMOVETT = "If checked, the sharing of whole groups, mark group entries at the target list, which do'nt exist in the group at the source list. So, you can handle it (delete, move, ...) after logon to the target character. HoloFriends sharing don't remove it at all.";
HOLOFRIENDS_OPTIONS3MERGECOMMENTS = "Merge HoloFriends comments during the sharing of friends";
HOLOFRIENDS_OPTIONS3MERGECOMMENTSTT = "If checked, HoloFriends comments are upended to existing HoloFriends comments during the sharing of your friends to your other chars.";

HOLOFRIENDS_OPTIONS4SECTIONMENU = "Pull down menu modification";
HOLOFRIENDS_OPTIONS4MENUMODF = "Modify the pull down menus of the different friend frames (chat, who, ...)";
HOLOFRIENDS_OPTIONS4MENUMODP = "Modify the pull down menu of the party frames";
HOLOFRIENDS_OPTIONS4MENUMODR = "Modify the pull down menus of the raid frame";
HOLOFRIENDS_OPTIONS4MENUMODT = "Modify the pull down menu of the target frame";
HOLOFRIENDS_OPTIONS4MENUMODTT = "If checked, entries are added to the pull down menu which allow the addition of the selected player to the friends or ignore list or perform a who-check. |cffffd200But this deactivates the list entry to set the focus ot tank.|r";
HOLOFRIENDS_OPTIONS4SHOWDROPDOWNALLBG = "Add opaque background to all default pull down menus";
HOLOFRIENDS_OPTIONS4SHOWDROPDOWNALLBGTT = "If checked, all pull down menus in the game that using the default template for pull down menus get a black opaque background added.";
HOLOFRIENDS_OPTIONS4SHOWDROPDOWNBG = "Add opaque background to pull down menus";
HOLOFRIENDS_OPTIONS4SHOWDROPDOWNBGTT = "If checked, all pull down menus of HoloFriends get a black opaque background added.";

HOLOFRIENDS_OPTIONS5SECTIONMENU = "Startup modifications";
HOLOFRIENDS_OPTIONS5SHOWONLINEATLOGIN = "Show online friends at your login";
HOLOFRIENDS_OPTIONS5SHOWONLINEATLOGINTT = "If checked, a list of all active online friends is shown in the chat frame during your login";

HOLOFRIENDS_OPTIONS6SECTIONMENU = "Ignoring players";
HOLOFRIENDS_OPTIONS6MSGIGNOREDWHISPER = "Send a note to offline ignored whispers";
HOLOFRIENDS_OPTIONS6MSGIGNOREDWHISPERTT = "If checked, a note that you ignore them is send automatically to offline ignored players which whisper you, else all chat is ignored silently";

HOLOFRIENDS_SHAREFRIENDSWINDOWTITLE = "Share friends";
HOLOFRIENDS_SHAREIGNOREWINDOWTITLE = "Share ignore";
HOLOFRIENDS_SHAREWINDOWBUTTONSEPARATE = "Separate";
HOLOFRIENDS_SHAREWINDOWDELETENOTE = "NOTICE: use |cffffd200/holofriends delete {name} [at {realm}]|r to delete data from non-existing characters";
HOLOFRIENDS_SHAREWINDOWFACTIONNOTEADD = "Select one character to add it";
HOLOFRIENDS_SHAREWINDOWFACTIONNOTEPULLDOWN = "At the pull down menu:";
HOLOFRIENDS_SHAREWINDOWFACTIONNOTESEPARATE = "Select your faction and mark one |cff999999(character)|r of the target list to separate it";
HOLOFRIENDS_SHAREWINDOWFACTIONTITLE = "Faction wide list handling";
HOLOFRIENDS_SHAREWINDOWNOTE = "Sharing is done immediately after clicking to the buttons \"Add\" or \"Update\"";
HOLOFRIENDS_SHAREWINDOWSOURCE = "Select friends:";
HOLOFRIENDS_SHAREWINDOWTARGET = "Share with:";

HOLOFRIENDS_TOOLTIPDATEFORMAT = "%A %m.%d.%Y %I:%M%p";
HOLOFRIENDS_TOOLTIPDISABLEDMENUENTRYHINT = "To enable this menu entry,\nyou have to disable the HoloFriends\nmenu modifications of this menu\nat the HoloFriends options panel.";
HOLOFRIENDS_TOOLTIPDISABLEDMENUENTRYTITLE = "HoloFriends-Addon";
HOLOFRIENDS_TOOLTIPBROADCAST = "BNet broadcast message:";
HOLOFRIENDS_TOOLTIPLASTSEEN = "Last seen";
HOLOFRIENDS_TOOLTIPNEVERSEEN = "Never seen";
HOLOFRIENDS_TOOLTIPSHAREBUTTON = "Share this list across other chars";
HOLOFRIENDS_TOOLTIPTURNINFOTEXT = "Change the info shown behind the friends name to the comments and back to the location";
HOLOFRIENDS_TOOLTIPTURNINFOTITLE = "Change Info";
HOLOFRIENDS_TOOLTIPUNKNOWN = "?";

HOLOFRIENDS_WINDOWMAINADDCOMMENT = "Edit Comment";
HOLOFRIENDS_WINDOWMAINADDGROUP = "Add Group";
HOLOFRIENDS_WINDOWMAINBUTTONSCAN = "/who scan";
HOLOFRIENDS_WINDOWMAINBUTTONSTOP = "stop scan";
HOLOFRIENDS_WINDOWMAINIGNOREONLINE = "Ignores Online:";
HOLOFRIENDS_WINDOWMAINNUMBERONLINE = "Friends Online:";
HOLOFRIENDS_WINDOWMAINREMOVEGROUP = "Remove Group";
HOLOFRIENDS_WINDOWMAINRENAMEGROUP = "Rename Group";
HOLOFRIENDS_WINDOWMAINSHOWOFFLINE = "Show Offline Friends";
HOLOFRIENDS_WINDOWMAINWHOREQUEST = "Who Request";
