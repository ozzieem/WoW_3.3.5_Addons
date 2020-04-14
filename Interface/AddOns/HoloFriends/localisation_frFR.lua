--[[
HoloFriends addon created by Holo, continued by Zappster, followed by Andymon

Get the latest version at wow.curse.com

See HoloFriends_change.log for more informations  
]]

--[[

This file defines the French localisation data

]]

if( GetLocale() == "frFR" ) then

HOLOFRIENDS_DIALOGDATEFORMAT = "Format de date de l'infobulle :\n(%%Y=ann\195\169e, %%m=mois, %%d=jour du mois, %%H=heure {max. 24}, %%I=heure {max. 12}, %%M=minute, %%p=am or pm, %%A=nom du jour)";

HOLOFRIENDS_FAQ00TITLE = "FAQ HoloFriends";
HOLOFRIENDS_FAQ41QUESTION = "Pourquoi \"D\195\169finir la focalisation\" est d\195\169sactiv\195\169 dans certains menu d\195\169roulants ?";

HOLOFRIENDS_INITADDONLOADED = "HoloFriends v%.3f charg\195\169";
HOLOFRIENDS_INITINVALIDLISTVERSION = "Les donn\195\169es de HoloFriends ont \195\169t\195\169 \195\169crites par une version plus r\195\169cente de l'addon (%s) ; pour \195\169viter toute corruption des donn\195\169es, rien ne sera sauvegard\195\169 ou charg\195\169";

HOLOFRIENDS_LISTFEATURES0TITLE = "Fonctionnalit\195\169s";
HOLOFRIENDS_LISTFEATURES16 = "affiche un message si quelqu'un dispara\195\174t de votre liste d'amis ou d'ignor\195\169s";
HOLOFRIENDS_LISTFEATURES18 = "substitue tous les noms de vos amis et de vos persos dans les zones de saisie"; -- Needs review
HOLOFRIENDS_LISTFEATURES37 = "enregistre et affiche les donn\195\169es de vos persos (si pr\195\169sents dans la liste d'amis)"; -- Needs review
HOLOFRIENDS_LISTFEATURES38 = "affiche le nombre de connect\195\169s/d\195\169connect\195\169s de vos liste d'amis et d'ignor\195\169s";

HOLOFRIENDS_MSGDELETECHARDIALOG = "Voulez-vous vraiment supprimer toutes les donn\195\169es de |cffffd200%s|r ?";
HOLOFRIENDS_MSGDELETECHARDONE = "Donn\195\169es de %s supprim\195\169es";
HOLOFRIENDS_MSGDELETECHARNOTFOUND = "%s introuvable, v\195\169rifiez l'orthographe";

HOLOFRIENDS_MSGFRIENDLIMITALERT = "Seulement %d amis peuvent \195\170tre g\195\169r\195\169s !";
HOLOFRIENDS_MSGFRIENDMISSINGONLINE = "Votre ami %s a disparu du jeu."; -- Needs review
HOLOFRIENDS_MSGFRIENDONLINEDISABLED = "Monitoring de l'ami %s d\195\169sactiv\195\169."; -- Needs review
HOLOFRIENDS_MSGFRIENDONLINEENABLED = "Monitoring de l'ami %s activ\195\169."; -- Needs review

HOLOFRIENDS_MSGIGNOREDUEL = "Duel annul\195\169 - %s est dans votre liste d'ignor\195\169s"; -- Needs review
HOLOFRIENDS_MSGIGNOREINVITEGUILD = "Invitation de guilde annul\195\169e - %s est dans votre liste d'ignor\195\169s"; -- Needs review
HOLOFRIENDS_MSGIGNORELIMITALERT = "Vous ne pouvez g\195\169rer que %d ignor\195\169s !";
HOLOFRIENDS_MSGIGNOREMISSINGONLINE = "Le joueur ignor\195\169 %s a disparu du jeu."; -- Needs review
HOLOFRIENDS_MSGIGNOREONLINEDISABLED = "Monitoring de l'ignor\195\169 %s d\195\169sactiv\195\169."; -- Needs review
HOLOFRIENDS_MSGIGNOREONLINEENABLED = "Monitoring de l'ignor\195\169 %s activ\195\169."; -- Needs review
HOLOFRIENDS_MSGIGNOREPARTY = "Invitation de groupe annul\195\169e - %s est dans votre liste d'ignor\195\169s"; -- Needs review
HOLOFRIENDS_MSGIGNORESIGNGUILD = "Signature de charte de guilde annul\195\169e - %s est dans votre liste d'ignor\195\169s"; -- Needs review

HOLOFRIENDS_MSGSCANDONE = "Scan de la liste d'amis termin\195\169.";
HOLOFRIENDS_MSGSCANSTART = "%d amis seront scann\195\169s. Cela prendra environ %f secondes. Les requ\195\170tes /who ne fonctionneront pas durant ce temps.";
HOLOFRIENDS_MSGSCANSTOP = "Scan arr\195\170t\195\169";

HOLOFRIENDS_OPTIONS0LISTENTRY = "HoloFriends";
HOLOFRIENDS_OPTIONS0NEEDACCEPT = "Vous devez accepter les options pour que les modifications prennent effet !";
HOLOFRIENDS_OPTIONS0NEEDRELOAD = "Vous devez recharger l'UI pour que les modifications prennent effet";
HOLOFRIENDS_OPTIONS0WINDOWTITLE = "Options HoloFriends";

HOLOFRIENDS_OPTIONS1SECTIONFLW = "Fen\195\170tre de liste d'amis";
HOLOFRIENDS_OPTIONS1SETDATEFORMAT = "Changer le format de date et heure par d\195\169faut";
HOLOFRIENDS_OPTIONS1SHOWCLASSCOLOR = "Afficher les couleurs de classe dans la liste d'amis";
HOLOFRIENDS_OPTIONS1SHOWCLASSCOLORTT = "Si coch\195\169, les noms des amis seront affich\195\169s avec leur couleur de classe dans la liste.";
HOLOFRIENDS_OPTIONS1SHOWCLASSICONS = "Afficher les ic\195\180nes de classe dans la liste d'amis";
HOLOFRIENDS_OPTIONS1SHOWCLASSICONSTT = "Si coch\195\169, les ic\195\180nes de classe seront affich\195\169es devant les noms des amis dans la liste.";
HOLOFRIENDS_OPTIONS1SHOWGROUPS = "Afficher aussi les groupes vides dans la liste d'amis compacte";
HOLOFRIENDS_OPTIONS1SHOWLEVEL = "Afficher le niveau de vos amis dans la liste d'amis";
HOLOFRIENDS_OPTIONS1SORTONLINE = "Placer les amis connect\195\169s en haut de la liste"; -- Needs review

HOLOFRIENDS_OPTIONS2SECTIONNOTES = "Gestion des notes du jeu";
HOLOFRIENDS_OPTIONS2MERGENOTES = "Fusionne les commentaires HoloFriends avec les notes du jeu";
HOLOFRIENDS_OPTIONS2NOTESPRIORITYOFF = "Priorit\195\169 aux notes du jeu";
HOLOFRIENDS_OPTIONS2NOTESPRIORITYON = "Notes du jeu suivies des commentaires Holofriends";

HOLOFRIENDS_OPTIONS3SECTIONSHARE = "Fen\195\170tre de partage";
HOLOFRIENDS_OPTIONS3MERGECOMMENTS = "Fusionne les commentaires HoloFriends lors du partage des amis";

HOLOFRIENDS_OPTIONS4SECTIONMENU = "Modification des menus d\195\169roulants";
HOLOFRIENDS_OPTIONS4MENUMODF = "Modifier les menus d\195\169roulants des diff\195\169rentes frames d'amis (discussion, qui, ...)";
HOLOFRIENDS_OPTIONS4MENUMODP = "Modifier les menus d\195\169roulants des frames de groupe";
HOLOFRIENDS_OPTIONS4MENUMODR = "Modifier les menus d\195\169roulants des frames de raid";
HOLOFRIENDS_OPTIONS4MENUMODT = "Modifier les menus d\195\169roulants des frames de cible";
HOLOFRIENDS_OPTIONS4SHOWDROPDOWNALLBG = "Ajouter un fond opaque \195\160 toutes les listes d\195\169roulantes par d\195\169faut"; -- Needs review
HOLOFRIENDS_OPTIONS4SHOWDROPDOWNBG = "Ajouter un fond opaque aux listes d\195\169roulantes de HoloFriends";

HOLOFRIENDS_OPTIONS5SECTIONMENU = "Modifications au d\195\169marrage";
HOLOFRIENDS_OPTIONS5SHOWONLINEATLOGIN = "Afficher les amis connect\195\169s lors de la connexion";

HOLOFRIENDS_OPTIONS6SECTIONMENU = "Joueurs ignor\195\169s"; -- Needs review

HOLOFRIENDS_SHAREFRIENDSWINDOWTITLE = "Partager la liste d'amis";
HOLOFRIENDS_SHAREIGNOREWINDOWTITLE = "Partager les ignor\195\169s";
HOLOFRIENDS_SHAREWINDOWDELETENOTE = "INFO: utilisez |cffffd200/holofriends delete {nom} [at {royaume}]|r pour supprimer les donn\195\169es de joueurs inexistants";
HOLOFRIENDS_SHAREWINDOWFACTIONNOTEADD = "S\195\169lectionner un personnage pour l'ajouter"; -- Needs review
HOLOFRIENDS_SHAREWINDOWNOTE = "Le partage est fait imm\195\169diatement apr\195\168s clic sur le bouton \"Ajouter\" ou \"Mettre \195\160 jour\"";
HOLOFRIENDS_SHAREWINDOWSOURCE = "S\195\169lectionner les amis :";
HOLOFRIENDS_SHAREWINDOWTARGET = "Partager avec :";

HOLOFRIENDS_TOOLTIPDATEFORMAT = "%A %d.%m.%Y %H:%M";
HOLOFRIENDS_TOOLTIPLASTSEEN = "Vu pour la derni\195\168re fois";
HOLOFRIENDS_TOOLTIPNEVERSEEN = "Jamais vu";
HOLOFRIENDS_TOOLTIPTURNINFOTEXT = "Change les infos affich\195\169es \195\160 c\195\180t\195\169 du nom des amis : commentaire/zone";
HOLOFRIENDS_TOOLTIPTURNINFOTITLE = "Changer infos";
HOLOFRIENDS_TOOLTIPUNKNOWN = "?";

HOLOFRIENDS_WINDOWMAINADDCOMMENT = "Editer la note";
HOLOFRIENDS_WINDOWMAINADDGROUP = "Ajouter groupe";
HOLOFRIENDS_WINDOWMAINBUTTONSTOP = "Arr\195\170t du scan";
HOLOFRIENDS_WINDOWMAINIGNOREONLINE = "Ignor\195\169s connect\195\169s :";
HOLOFRIENDS_WINDOWMAINNUMBERONLINE = "Amis connect\195\169s :";
HOLOFRIENDS_WINDOWMAINREMOVEGROUP = "Supprimer groupe";
HOLOFRIENDS_WINDOWMAINRENAMEGROUP = "Renommer groupe";
HOLOFRIENDS_WINDOWMAINSHOWOFFLINE = "Afficher les amis d\195\169connect\195\169s";

end
