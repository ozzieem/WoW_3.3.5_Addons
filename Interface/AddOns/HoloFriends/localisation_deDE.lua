--[[
HoloFriends addon created by Holo, continued by Zappster, followed by Andymon

Get the latest version at wow.curse.com

See HoloFriends_change.log for more informations  
]]

--[[

This file defines the german localisation data

]]

if( GetLocale() == "deDE" ) then

HOLOFRIENDS_DIALOGDATEFORMAT = "Format des Datum im Tooltip:\n(%%Y=Jahr, %%m=Monat, %%d=Tag des Monats, %%H=Stunde {max. 24}, %%I=Stunde {max. 12}, %%M=Minute, %%p=am or pm, %%A=Wochentag)";

HOLOFRIENDS_DIALOGFACTIONASKMERGEFRIENDGROUPS = "F\195\188r alle Freunde, welche in der Freundesliste von |cffffd200%s|r enthalten sind:\nSoll die Gruppeneinteilung der faktionsweiten Freundesliste mit dieser \195\188berschrieben werden?";
HOLOFRIENDS_DIALOGFACTIONASKMERGEIGNOREGROUPS = "F\195\188r alle Ignorierten, welche in der Ignorierenliste von |cffffd200%s|r enthalten sind:\nSoll die Gruppeneinteilung der faktionsweiten Ignorierenliste mit dieser \195\188berschrieben werden?";
HOLOFRIENDS_DIALOGFACTIONMERGEFRIENDWARNING = "Sie sind im Begriff, alle Freunde von\n|cffffd200%s|r\nin die fraktionsweite Freundesliste einzuf\195\188gen.\n\n|cffffd200WARNUNG|r\nDie individuelle Freundesliste wird gel\195\182scht!\nDieser Schritt kann nicht r\195\188ckg\195\164ngig gemacht werden!\nAbh\195\164ngig von den Optionen, kann es zu Datenverlust kommen!\nDie Daten der Freundesliste sind nur lokal auf der Festplatte gespeichert.\n\n|cffffd200EMPFEHLUNG|r\nMachen Sie eine Sicherheitskopie (z.B. auf ihren USB-Stik) von der HoloFriends Freundeslisten-Datei:\n{WoW dir}/WTF/Account/{Your ACC}/SavedVariables/HoloFriends.lua\n\n|cffffd200Haben Sie eine Sicherheitskopie?|r";
HOLOFRIENDS_DIALOGFACTIONMERGEIGNOREWARNING = "Sie sind im Begriff, alle Ignorierten von\n|cffffd200%s|r\nin die fraktionsweite Ignorierenliste einzuf\195\188gen.\n\n|cffffd200WARNUNG|r\nDie individuelle Ignorierenliste wird gel\195\182scht!\nDieser Schritt kann nicht r\195\188ckg\195\164ngig gemacht werden!\nAbh\195\164ngig von den Optionen, kann es zu Datenverlust kommen!\nDie Daten der Ignorierenliste sind nur lokal auf der Festplatte gespeichert.\n\n|cffffd200EMPFEHLUNG|r\nMachen Sie eine Sicherheitskopie (z.B. auf ihren USB-Stik) von der HoloFriends Freundeslisten-Datei:\n{WoW dir}/WTF/Account/{Your ACC}/SavedVariables/HoloFriends.lua\n\n|cffffd200Haben Sie eine Sicherheitskopie?|r";
HOLOFRIENDS_DIALOGFACTIONPRIORITYFRIENDWARNING = "|cffffd200WARNUNG|r\nDie Benutzung der fraktionsweiten Freundesliste gibt ihr Priorit\195\164t \195\188ber die spielinterne Freundesliste.\n\nDas Hinzuf\195\188gen oder Entfernen von Freunden mit anderen Addons zu oder von der Freundesliste deiner Charaktere, welche die fraktionsweite Freundesliste verwenden, wird von HoloFriends r\195\188ckg\195\164ngig gemacht.\nDas Hinzuf\195\188gen oder Entfernen von Freunden ohne das HoloFriends geladen ist, wird beim n\195\164chsten Start von HoloFriends r\195\188ckg\195\164ngig gemacht.";
HOLOFRIENDS_DIALOGFACTIONPRIORITYIGNOREWARNING = "|cffffd200WARNUNG|r\nDie Benutzung der fraktionsweiten Ignorierenliste gibt ihr Priorit\195\164t \195\188ber die spielinterne Ignorierenliste.\n\nDas Hinzuf\195\188gen oder Entfernen von Ignorierten mit anderen Addons zu oder von der Ignorierenliste deiner Charaktere, welche die fraktionsweite Ignorierenliste verwenden, wird von HoloFriends r\195\188ckg\195\164ngig gemacht.\nDas Hinzuf\195\188gen oder Entfernen von Ignoriereten ohne das HoloFriends geladen ist, wird beim n\195\164chsten Start von HoloFriends r\195\188ckg\195\164ngig gemacht.";

HOLOFRIENDS_FAQ00TITLE = "HoloFriends FAQ";
HOLOFRIENDS_FAQ011QUESTION = "Zeigt dieses Addon, wann deine Freunde das letzte mal online waren? Ich finde das eine sehr n\195\188tzliche Sache.";
HOLOFRIENDS_FAQ012ANSWER = "HoloFriends zeigt f\195\188r deine Freunde das Datum an denen du sie das letzte mal gesehen hast. So viel ich weis, ist es nur m\195\182glich das Datum des letzten Login f\195\188r Gildenmitglieder zu erhalten.";
HOLOFRIENDS_FAQ21QUESTION = "Weis jemand, was das Markieren der kleinen Boxen bewirkt?";
HOLOFRIENDS_FAQ22ANSWER = "Es existiert ein kleines Markierungsfeld vor den Namen der Freunde (schaue auf den Screenshot \"Display all friends\"). Wenn diese Box markiert ist, ist der Freund in der spielinternen Freundesliste von WoW enthalten, ansonsten steht der Freund nur in der Freundesliste von HoloFriends.\nFreunde in der spielinternen Freundesliste von WoW werden online durch das Spiel aktualisiert und man sieht immer den aktuellen Status. Aber die spielinterne Freundesliste hat ein Limit von max. 100 Freunden.\nFreunde ohne Markierung in der Box (nur in der Freundesliste von HoloFriends enthalten) werden nicht durch das Spiel \195\188berwacht. HoloFriends muss den Status dieser Freunde mit Hilfe des \"/who\" Kommandos von WoW \195\188berpr\195\188fen. Aber diese \195\156berpr\195\188fung ist langsam, da das Spiel eine Pause zwischen den Ausf\195\188hrungen von zwei \"/who\" Kommandos erzwingt.";
HOLOFRIENDS_FAQ31QUESTION = "Da steht \"Aktualisiere den Status von Freunden (>100), welche nicht online von WoW \195\188berwacht werden, mit nur einem Klick\", aber das ist nicht sehr verst\195\164ndlich.";
HOLOFRIENDS_FAQ32ANSWER = "Wegen dem langsamen Scan mit \"/who\" f\195\188r die Freunde, welche nicht in der spielinternen Freundesliste von WoW enthalten sind (Box vor dem Freund nicht markiert), wird eine Aktualisierung des Status nicht automatisch ausgef\195\188hrt. Du hast den \"/who Scan\" manuell durch einen Klick auf den roten Knopf \"/who Scan\" in der oberen rechten Ecke des Freundeslistenfensters zu starten.\nBeachte: W\195\164hrend der \"/who Scan\" l\195\164uft, wird das \"/who\" Kommando nicht funktionieren.";
HOLOFRIENDS_FAQ41QUESTION = "Weshalb ist \"Focus setzen\" in einigen Pulldown-Men\195\188s deaktiviert?";
HOLOFRIENDS_FAQ42ANSWER = "Ich musste das deaktivieren, da sonst die Fehlermeldung \"function blocked by blizzard\" erscheint.\nIch habe eine Option im HoloFriends Optionen Fenster hinzugef\195\188gt, welche alle Men\195\188modifikationen von HoloFriends deaktiviert, damit der Eintrag \"Fokus setzen\" in allen Pulldown-Men\195\188s funktioniert.\nDas Setzen des Fokus scheint eine generell gesch\195\188tzte Funktion im Spiel zu sein. Ich verstehe nicht so richtig, warum der Fokus nicht nur eine im Kampf gesch\195\188tzte Funktion ist, wie das Raid-Fenster.\nEs ist eine Eigenschaft des Spiels, dass eine gesch\195\188tzt Funktion nicht funktioniert, wenn am Fenster dieser Funktion eine nicht signierte \195\132nderung vorgenommen wurde, in diesem Fall dem Pulldown-Men\195\188.";
HOLOFRIENDS_FAQ51QUESTION = "Weshalb ist in einem Raid im Kampf das Raid-Fenster leer, wenn HoloFriends geladen ist?";
HOLOFRIENDS_FAQ52ANSWER = "Es ist eine Eigenschaft des Spiels, dass ein gesch\195\188tztes Fenster, wie das Raid-Fenster, im Kampf nicht funktioniert, wenn eine unsignierte \195\132nderung an irgendeinem Teil des Fensters vorgenommen wurde.\nDas Raid-Fenster ist ein Teil des Freund-Fensters, wo auch das Freundeslisten-Fenster ein Teil davon ist. Und das Freundeslisten-Fenster ist durch HoloFriends modifiziert. Und HoloFriends ist nicht durch Blizz signiert.";
HOLOFRIENDS_FAQ61QUESTION = "Gibt es einen Weg, Gruppen und Mitglieder der Gruppen zwischen den Charakteren zu synchronisieren?";
HOLOFRIENDS_FAQ62ANSWER = "Ja.\nMan kann die fraktionsweite Freundesliste f\195\188r einige oder alle seine Charaktere verwenden, wobei alle diese Charaktere die selbe Freundesliste in HoloFriends verwenden. Auch die spielinterne Freundesliste auf dem Server wird synchronisiert.\nOder man synchronisiert manuell einzelne Gruppen zwischen seinen Charakteren.\n\nDas Hinzuf\195\188gen zur fraktionsweiten Freundesliste und auch das Synchronisieren von einzelnen Gruppen wird im \195\156bertragen-Fenster von HoloFriends durchgef\195\188hrt. Man erreicht es \195\188ber den untersten mittleren Knopf im Freundeslistenfenster, oder durch das Navigieren zu \"Hauptmen\195\188 -> Interface -> Addons -> HoloFriends -> Freunde \195\188bertragen\".\n\nUm einen seiner Charaktere zur fraktionsweiten Freundesliste hinzuzuf\195\188gen, w\195\164hlt man ihn am Aufklappmen\195\188 im oberen Teil des Fensters aus und klicke auf den \"Hinzuf\195\188gen\"-Knopf im unteren Teil des Fensters, in der Sektion der fraktionsweiten Freundesliste. Man darf keine Eintr\195\164ge in den 2 Listen markieren.\n\nUm eine Gruppe zu/mit anderen seiner Charaktere zu \195\156bertragen/Aktualisieren, w\195\164hlt man den \"Quellen\"-Charakter am Aufklappmen\195\188 im oberen Teil des Fensters aus, markiert die zu \195\188bertragenden/aktualisierenden Gruppen im Markierungsfeld der Gruppe in der linken Liste, markiere die Empf\195\164nger-Charaktere in der rechten Liste und klickt auf den \"Hinzuf\195\188gen\"/\"Aktualisieren\"-Knopf direkt unter den Listen. \"Hinzuf\195\188gen\" f\195\188gt nur noch nicht existierende Freunde zu den Gruppen der \"Ziel\"-Charaktere hinzu und \"Aktualisieren\" synchronisiert die Daten von allen Freunden der ausgew\195\164hlten Gruppen mit den \"Ziel\"-Charakteren.\nEs gibt eine Option im HoloFriends-Optionenfenster, welche es erlaubt, gel\195\182schte Freunde aus den \"Quell\"-Gruppen in den \"Ziel\"-Gruppen zu markieren. Freunde werden automatisch zu anderen ausgew\195\164hlten Gruppen verschoben, aber nicht aus Gruppen gel\195\182scht. Das L\195\182schen von Freunden hat man selbst vorzunehmen.";
HOLOFRIENDS_FAQ71QUESTION = "Danke f\195\188r die Einf\195\188hrung. Wird das auch die Gruppen und Mitglieder synchron halten, oder muss ich die Prozedur jedes mal ausf\195\188hren, wenn ich ein neues Mitglied zu einer Gruppe hinzuf\195\188ge, oder eine neue Gruppe erstelle? Es w\195\164re besser, wenn es eine Option g\195\164be, um das synchron zu halten, ohne den beschriebenen \"Aktualisieren\"-Prozess.";
HOLOFRIENDS_FAQ72ANSWER = "Die fraktionsweite Freundesliste von HoloFriends ist das gesuchte Feature. Zu deren Benutzung, siehe den dritten Absatz der oberen Beschreibung.\n\nDie fraktionsweite Freundesliste ist eine einzige Freundesliste f\195\188r einiege oder alle deine Charaktere der selben Fraktion auf einem Realm. Es gibt hier kein Synchronisieren mehr. Alle \195\132nderungen zur Freundesliste werden f\195\188r alle Charaktere gemacht und die spielinterne Freundesliste auf dem WoW-Server deiner anderen Charaktere wird w\195\164hrend des Login aktualisiert.\nAber, es gibt eine Einschr\195\164nkung mit der fraktionsweiten Freundesliste: HoloFriends braucht die Priorit\195\164t \195\188ber die Freundesliste von WoW. Das Bedeutet f\195\188r die Charaktere, welche die fraktionsweite Freundesliste verwenden, dass kein anderer Freundeslisten-Addon mit HoloFriends zusammen arbeitet.";
HOLOFRIENDS_FAQ81QUESTION = "Ich frage mich, ob es m\195\182glich ist, einen Freund von einem Chatakter zu l\195\182schen und dann dieses L\195\182schen mit anderen Charakteren zu synchronisieren. Z.B. wenn ich einen Freund X von meinen Charakter l\195\182sche und dann die anderen Charaktere ausw\195\164hle, wird der Freund auch von ihren Listen entfernt?";
HOLOFRIENDS_FAQ82ANSWER = "Wenn die fraktionsweite Freundesliste benutzt wird, werden die spielinternen Freundeslisten der anderen Charaktere w\195\164hrend des Login mit HoloFriends auf den Stand der HoloFriends-Freundesliste aktualisiert. Wenn ein Freund von der fraktionsweiten Freundesliste entfernt wurde, wird er deshalb automatisch von der spielinternen Freundesliste deiner anderen Charaktere w\195\164hrend des Login entfernt.\n\nWenn der normale Modus mit einzelnen Freundeslisten f\195\188r alle Charaktere benutzt wird, muss die Gruppe im \"Freunde \195\188bertragen\"-Fenster von HoloFriends zu den anderen Charakteren \195\188bertragen werden. Wenn ein Freund in der \195\188bertragenen Gruppe entfernt wurde, wird er in der Freundesliste der anderen Charaktere optional nur markiert (Durchgestrichen), aber nicht entfernt. Er muss manuell nach dem Login zu den anderen Charakteren entfernt werden. (Das soll das zusammenarbeiten mit anderen Addons erm\195\182glichen.)";
HOLOFRIENDS_FAQ091QUESTION = "Gibt es einen Weg, die Freundesliste automatisch zu syncronisieren, oder einen Weg alle Namen beim manuellen Synchronisieren auszuw\195\164hlen? Wenn ich nichts \195\188bersehen habe, bin ich nur in der Lage zu synchronisieren, wenn ich jeden Namen einzeln anklicke.";
HOLOFRIENDS_FAQ092ANSWER = "Durch Markieren der Gruppen, k\195\182nnen sie auch ganze Gruppen \195\188bertragen. Nach dem Markieren klappt die Gruppe zusammen, aber die Markierungsbox ist noch markiert.";
HOLOFRIENDS_FAQ101QUESTION = "Mein anderer Freundeslisten-Addon funktioniert nicht wie erwartet, wenn ich HoloFriends benutze. Ist HoloFriends nicht kompatibel?";
HOLOFRIENDS_FAQ102ANSWER = "Ja / Nein\nHoloFriends sollte mit anderen Addons kompatibel sein, wenn jeder Charakter eine eigene Freundesliste benutzt.\n\nDie fraktionsweite Freundesliste von HoloFriends ist mit einigen anderen Freundeslisten-Addons nicht kompatibel. Vor allem das Hinzuf\195\188gen und Entfernen von Freunden durch andere Addons wird durch die fraktionsweite Freundesliste von HoloFriends ignoriert, da die fraktionsweite Freundesliste Priorit\195\164t \195\188ber die spielinterne Freundesliste braucht. Deswegen werden \195\132nderungen an der spielinternen Freundesliste, ohne das HoloFriends geladen ist, durch die fraktionsweite Freundesliste von HoloFriends r\195\188ckg\195\164ngig gemacht, wenn HoloFriends das n\195\164chste mal geladen wird. Deshalb sollte die fraktionsweite Freundesliste von HoloFriends nicht benutzt werden, wenn man an verschiedenen Computern spielt oder HoloFriends nicht die ganze Zeit benutzt.";
HOLOFRIENDS_FAQ111QUESTION = "Vor einiger Zeit habe ich HoloFriends mit einer fraktionsweiten Freundesliste benutzt, aber in der Zwischenzeit spielte ich ohne es. Wenn ich nun HoloFriends wieder lade, wird es alle meine \195\132nderungen zur Freundesliste, welche ich in der Zwischenzeit gemacht habe, wieder entfernen?";
HOLOFRIENDS_FAQ112ANSWER = "Wenn eine fraktionsweite Freundesliste \195\188ber einen Zeitraum von mehr als 30 Tagen nicht benutzt wurde, wird HoloFriends w\195\164hrend des Ladens fragen, ob sie geladen und alle \195\132nderungen r\195\188ckg\195\164ngig gemacht werden sollen, oder ob mit der aktuellen spielinternen Freundesliste gestartet werden soll. Die fraktionsweite Freundesliste bleibt weiter bestehen und es kann \195\188ber das \"Freunde \195\188bertragen\"-Fenster auf sie zugegriffen werden.";

HOLOFRIENDS_HOMEPAGEACTUAL = "Nach einer langen Zeit ist das n\195\164chste gro\195\159e Update zu HoloFriends da. Neben einigen neuen Funktionen, bietet es nun eine Ignorierenliste vergleichbar zur Freundesliste. Nun bekommt man die M\195\182glichkeit Ignorierte zu verteilen, eine fraktionsweite Ignorierenliste zu benutzen, eine unbegrenzte Anzahl von offline Ignorierten einzutragen und vieles mehr.\n\nAuf Grund der vielen \195\132nderungen zu HoloFriends, um die Behandlung der Ignorierenliste zu integrieren und des kompletten Neuschreibens des Ignorierenlisten-Programms, wird diese neu Version als Betaversion ver\195\182ffentlicht. Ich habe es ausf\195\188hrlich selbst getested und hoffe, dass keine Fehler enthalten sind, aber wer weiss.";
HOLOFRIENDS_HOMEPAGEADDRESS = "Das Projekt ist zu Hause auf:\nhttp://wow.curseforge.com/projects/holo-friends-continued/\nHier ist auch ein Ticket-System f\195\188r das Anfordern von Neuerungen und Fehlermeldungen vorhanden:\nhttp://wow.curseforge.com/projects/holo-friends-continued/tickets/";
HOLOFRIENDS_HOMEPAGEAIM = "Dieses Addon modifiziert das Freundfenster von WoW, um ein besseres Management der Freundes- und Ignorierenliste zu erm\195\182glichen.";
HOLOFRIENDS_HOMEPAGELOCALIZATION = "\195\156bersetzungen von\nAndymon - Deutsch (deDE)\nzwlong9069 - Einfaches Chinesisch (zhCN)\nAladdinn, zwlong9069 - Traditionelles Chinesisch (zhTW)\nmarturo77 - Lateinamerikanisches Spanisch (esMX)\noXid_FoX - Franz\195\182sisch (frFR)";
HOLOFRIENDS_HOMEPAGEREMARKSTITLE = "Hinweise";
HOLOFRIENDS_HOMEPAGESEARCH = "Du m\195\182chtest HoloFriends auch in deiner Sprache haben?\nIch suche nach \195\156bersetzern von HoloFriends und dem Inhalt der WEB-Seite.\nSende mir eine Notiz in curse, wenn du dem Team als \195\156bersetzer beitreten m\195\182chtest. Die \195\156bersetzung wird einfach \195\188ber ein WEB-Oberfl\195\164che bedient.\n\195\150ffentliche \195\156bersetzungen sind in curse geschlossen.";
HOLOFRIENDS_HOMEPAGETITLE = "HoloFriends (continued) v0.440";

HOLOFRIENDS_INITADDONLOADED = "HoloFriends Addon v%.3f wurde geladen";
HOLOFRIENDS_INITINVALIDLISTVERSION = "Die HoloFriends Daten wurden mit einer neueren Version von HoloFriends (%s) erzeugt - um die Daten nicht zu besch\195\164digen, werden keine Informationen geladen oder gespeichert";
HOLOFRIENDS_INITLOADFACTIONSFRIENDSLIST = "|cffffd200WARNUNG:|r Die fraktionsweite Freundesliste von diesem Charakter war seit langem nicht geladen.\nM\195\182glicherweise wurde gespielt, ohne das HoloFriends geladen war und nun soll die spielinterne Freundesliste f\195\188r diesen Charakter geladen werden.\nDas Fortfahren mit dem Laden der fraktionsweiten Freundesliste f\195\188r diesen Charakter wird alle \195\132nderungen an der spielinternen Freundesliste, welche ohne geladenes HoloFriends gemacht wurden, r\195\188ckg\195\164ngig machen.\nSoll die fraktionsweite Freundesliste geladen werden?";
HOLOFRIENDS_INITLOADFACTIONSIGNORELIST = "|cffffd200WARNUNG:|r Die fraktionsweite Ignorierenliste von diesem Charakter war seit langem nicht geladen.\nM\195\182glicherweise wurde gespielt, ohne das HoloFriends geladen war und nun soll die spielinterne Ignorierenliste f\195\188r diesen Charakter geladen werden.\nDas Fortfahren mit dem Laden der fraktionsweiten Ignorierenliste f\195\188r diesen Charakter wird alle \195\132nderungen an der spielinternen Ignorierenliste, welche ohne geladenes HoloFriends gemacht wurden, r\195\188ckg\195\164ngig machen.\nSoll die fraktionsweite Ignorierenliste geladen werden?";
HOLOFRIENDS_INITSHOWONLINEATLOGIN = "Liste deiner Online-Freunde:";

HOLOFRIENDS_LISTFEATURES0TITLE = "F\195\164higkeiten";

HOLOFRIENDS_LISTFEATURES11 = "Handhabung einer fraktionsweiten Freundes- und Ignorierenliste f\195\188r einige oder alle deine Charaktere";
HOLOFRIENDS_LISTFEATURES12 = "Ordne die Freundes- und die Ignorierenliste in Gruppen";
HOLOFRIENDS_LISTFEATURES13 = "Verwalte mehr als 100 Freunde und 50 Ignorierte";
HOLOFRIENDS_LISTFEATURES14 = "Aktualisiere den Status von Freunden (>100), welche nicht online von WoW \195\188berwacht werden, mit nur einem Klick";
HOLOFRIENDS_LISTFEATURES15 = "Ignoriert alle Chat-Nachrichten und Einladungen in Gruppe, Gilde und Duell f\195\188r offline Ignorierte";
HOLOFRIENDS_LISTFEATURES16 = "Zeigt eine Nachricht, wenn einer deiner Freunde oder Ignorierten von der spielinternen Freundesliste verschwindet";
HOLOFRIENDS_LISTFEATURES17 = "Optional zeige Liste mit online Freunden im Chat-Fenster beim Login";
HOLOFRIENDS_LISTFEATURES18 = "Substituiere die Namen aller Freunde und deiner Charaktere, z.B. im Briefkasten";
HOLOFRIENDS_LISTFEATURES19 = "HoloFriends Hilfe (FAQ) in der Interface-Optionenliste";

HOLOFRIENDS_LISTFEATURES21 = "F\195\188ge lange Kommentare (bis zu 500 Zeichen) zur Freundes- und zur Ignorierenliste hinzu";
HOLOFRIENDS_LISTFEATURES22 = "Die ersten 48 Buchstaben der Kommentare werden in die spielinternen Freundnotizen geschrieben";
HOLOFRIENDS_LISTFEATURES23 = "\195\156berwacht Notizen der spielinternen Freundesliste (Unterst\195\188tzung anderer Addons)";
HOLOFRIENDS_LISTFEATURES24 = "Optionales Verbinden der spielinternen Freundnotizen mit den HoloFriends-Kommentaren";
HOLOFRIENDS_LISTFEATURES25 = "Zeigt die Region oder den Kommentar und optional das Level hinter dem Freundesnamen";
HOLOFRIENDS_LISTFEATURES26 = "Zeigt erweiterte Informationen in einem Tooltip seitlich des Freundeslisteneintrages";

HOLOFRIENDS_LISTFEATURES31 = "Optional zeige nur online Freunde an";
HOLOFRIENDS_LISTFEATURES32 = "Optional zeige nur Gruppen mit Online-Freunden in der Freundesliste";
HOLOFRIENDS_LISTFEATURES33 = "Optional sortiere alle online Freunde nach oben in den Gruppenlisten";
HOLOFRIENDS_LISTFEATURES34 = "Optionale Anzeige von Klassenpiktogrammen zu den Freunden";
HOLOFRIENDS_LISTFEATURES35 = "Optionale Anzeige der Freundesnamen in ihren Klassenfarben";
HOLOFRIENDS_LISTFEATURES36 = "Speichert das Datum, an dem die Freunde zuletzt gesehen wurden";
HOLOFRIENDS_LISTFEATURES37 = "Speichert und zeigt Daten deiner eigenen Charaktere (wenn sie in der Freundesliste enthalten sind)";
HOLOFRIENDS_LISTFEATURES38 = "Zeigt die Anzahl von online/offline Freunden und Ignorierten";

HOLOFRIENDS_LISTFEATURES41 = "F\195\188ge Spieler zur Freundes- oder Ignorierenliste durch Pulldown-Men\195\188s hinzu (Das Freunde-Fenster wird nicht ben\195\182tigt)";
HOLOFRIENDS_LISTFEATURES42 = "F\195\188gt eine /who-Anfrage zu einigen Pulldown-Men\195\188s hinzu";
HOLOFRIENDS_LISTFEATURES43 = "Optionaler schwarzer undurchsichtiger Hintergrund f\195\188r Pulldown-Men\195\188s";
HOLOFRIENDS_LISTFEATURES44 = "Optionales Deaktivieren der Pulldown-Men\195\188-Modifikationen (um das setzen des Fokus zu erm\195\182glichen)";

HOLOFRIENDS_LISTFEATURES51 = "Verteile deine Freunde/Ignorierte inklusive den Kommentaren zu deinen anderen Charakteren";
HOLOFRIENDS_LISTFEATURES52 = "Aktualisiere Freundes- und Ignorierendaten zwischen deinen Charakteren";
HOLOFRIENDS_LISTFEATURES53 = "Optionales Verbinden von HoloFriends Kommentaren w\195\164hrend dem \195\156bertragenen";
HOLOFRIENDS_LISTFEATURES54 = "\195\156bertrage und Aktualisiere ganze Gruppen von Freunden und Ignorierten";
HOLOFRIENDS_LISTFEATURES55 = "Die Aktualisierung von Gruppen optional markiert nicht existierende Freunde/Ignorierte in der Liste des Ziels";
HOLOFRIENDS_LISTFEATURES56 = "Verbinde die Listen von einigen oder allen deinen Chatakteren zu einer fraktionsweiten Freundes- oder Ignorierenliste";
HOLOFRIENDS_LISTFEATURES57 = "Erlaubt das Separieren von deinen Charakteren von der fraktionsweiten Freundes- oder Ignorierenliste";

HOLOFRIENDS_MSGDELETECHARDIALOG = "Willst Du wirklich alle Daten von |cffffd200%s|r l\195\182schen?";
HOLOFRIENDS_MSGDELETECHARDONE = "Alle Daten von %s wurden gel\195\182scht";
HOLOFRIENDS_MSGDELETECHARNOTFOUND = "%s wurde nicht gefunden, bitte \195\188berpr\195\188fe die genaue Schreibweise";

HOLOFRIENDS_MSGFACTIONMERGEDONE = "%s zur fraktionsweiten Liste hinzugef\195\188gt";
HOLOFRIENDS_MSGFACTIONNOMERGE = "ABGEBROCHEN: Kein Hinzuf\195\188gen zur fraktionsweiten Liste durchgef\195\188hrt";

HOLOFRIENDS_MSGFRIENDLIMITALERT = "Sie k\195\182nnen nur %d Freunde \195\156berwachen!";
HOLOFRIENDS_MSGFRIENDMISSINGONLINE = "Dein Freund %s ist von der Online-Freundesliste verschwunden.";
HOLOFRIENDS_MSGFRIENDONLINEDISABLED = "Online Status \195\156berwachung des Freundes %s deaktiviert.";
HOLOFRIENDS_MSGFRIENDONLINEENABLED = "Online Status \195\156berwachung des Freundes %s aktiviert.";

HOLOFRIENDS_MSGIGNOREDUEL = "Duell abgebrochen - %s ist in der offline Ignorierenliste";
HOLOFRIENDS_MSGIGNOREINVITEGUILD = "Gildeneinladung abgelehnt - %s ist in der offline Ignorierenliste";
HOLOFRIENDS_MSGIGNORELIMITALERT = "Sie k\195\182nnen nur %d Spieler online ignorieren!";
HOLOFRIENDS_MSGIGNOREMISSINGONLINE = "Der Spieler %s ist von der Online-Ignorierenliste verschwunden.";
HOLOFRIENDS_MSGIGNOREONLINEDISABLED = "Online ignorieren \195\156berwachung von %s deaktiviert.";
HOLOFRIENDS_MSGIGNOREONLINEENABLED = "Online ignorieren \195\156berwachung von %s aktiviert.";
HOLOFRIENDS_MSGIGNOREPARTY = "Gruppeneinladung abgelehnt - %s ist in der offline Ignorierenliste";
HOLOFRIENDS_MSGIGNORESIGNGUILD = "Unterschrift der Gildensatzung abgelehnt - %s ist in der offline Ignorierenliste";

HOLOFRIENDS_MSGSCANDONE = "Scan der zus\195\164tzlichen Freunde beendet";
HOLOFRIENDS_MSGSCANSTART = "%d Eintr\195\164ge werden \195\188berpr\195\188ft. Der Vorgang dauert ca. %f Sekunden. /who wird w\195\164hrend dieser Zeit nicht funktionieren.";
HOLOFRIENDS_MSGSCANSTOP = "Scan abgebrochen";

HOLOFRIENDS_OPTIONS0LISTENTRY = "HoloFriends";
HOLOFRIENDS_OPTIONS0NEEDACCEPT = "Um im \195\156bertrage-Fenster wirksam zu werden, m\195\188ssen die Optionen erst akzeptiert werden !";
HOLOFRIENDS_OPTIONS0NEEDRELOAD = "Um wirksam zu werden, muss man den Charakter neu laden !";
HOLOFRIENDS_OPTIONS0NOTFACTION = "Diese Option ist f\195\188r Charactere, welche die fraktionsweite Freundsliste benutzen, immer aus !";
HOLOFRIENDS_OPTIONS0REALID = "Diese Option ist f\195\188r BNet Freunde immer aktiv !";
HOLOFRIENDS_OPTIONS0WINDOWTITLE = "HoloFriends Optionen";

HOLOFRIENDS_OPTIONS1SECTIONFLW = "Fenster der Freundesliste";
HOLOFRIENDS_OPTIONS1BNSHOWCHARNAME = "Zeige Charactername hinter BettleNet-Name";
HOLOFRIENDS_OPTIONS1BNSHOWCHARNAMETT = "Wenn aktiviert, wird der Charaktername der RealID-Freunde hinter dem realen Namen angezeigt. Der reale Name bekommt die Farbe seiner Fraktion.";
HOLOFRIENDS_OPTIONS1SETDATEFORMAT = "\195\132ndere das standardm\195\164\195\159ige Format f\195\188r Datum und Uhrzeit";
HOLOFRIENDS_OPTIONS1SETDATEFORMATTT = "Wenn aktiviert, wird man zur \195\132nderung des standardm\195\164\195\159igen Formats von Datum und Uhrzeit aufgefordert, welches zur Anzeige der Zeit von \"Zuletzt gesehen\" in den Tooltips der Freundesliste benutzt wird.";
HOLOFRIENDS_OPTIONS1SHOWCLASSCOLOR = "Zeige die Namen der Freunde in ihren Klassenfarben in der Freundesliste";
HOLOFRIENDS_OPTIONS1SHOWCLASSCOLORTT = "Wenn aktiviert, wird der Name der Freunde in ihren Klassenfarben in der Freundesliste angezeigt.";
HOLOFRIENDS_OPTIONS1SHOWCLASSICONS = "Zeige Klassenpiktogramme in der Freundesliste";
HOLOFRIENDS_OPTIONS1SHOWCLASSICONSTT = "Wenn aktiviert, wird vor dem Namen der Freunde ein Klassenpiktogramm in der Freundesliste angezeigt.";
HOLOFRIENDS_OPTIONS1SHOWGROUPS = "Zeige auch leere Gruppen im kompakten Modus der Freundesliste";
HOLOFRIENDS_OPTIONS1SHOWGROUPSTT = "Wenn aktiviert, werden alle Gruppen immer angezeigt, ansonsten werden im kompakten Modus (|cffffd200Offline-Freunde anzeigen|r ist im Fenster der Freundesliste nicht aktiviert) nur Gruppen mit Online-Freunden angezeigt.";
HOLOFRIENDS_OPTIONS1SHOWLEVEL = "Zeige das Level der Freunde in der Freundesliste";
HOLOFRIENDS_OPTIONS1SHOWLEVELTT = "Wenn aktiviert, wird das Level der Freundes hinter dem Freundesnamen in der Freundesliste angezeigt.";
HOLOFRIENDS_OPTIONS1SORTONLINE = "Sortiere Online-Freunde nach oben";
HOLOFRIENDS_OPTIONS1SORTONLINETT = "Wenn aktiviert, werden alle Online-Freunde in den Gruppen oben aufgelistet, gefolgt von allen Offline-Freunden.";

HOLOFRIENDS_OPTIONS2SECTIONNOTES = "Handhabung spielinterner Freundesnotizen";
HOLOFRIENDS_OPTIONS2MERGENOTES = "Verbinde HoloFriends Kommentare mit den spielinternen Freund-Notizen";
HOLOFRIENDS_OPTIONS2MERGENOTESTT = "Wenn aktiviert, werden die HoloFriends Kommentare an die spielinternen Freund-Notizen angeh\195\164ngt oder umgekehrt, abh\195\164ngig vom folgenden Priorit\195\164tenschalter.";
HOLOFRIENDS_OPTIONS2NOTESPRIORITYOFF = "Spielinterne Freund-Notizen haben Priorit\195\164t";
HOLOFRIENDS_OPTIONS2NOTESPRIORITYOFFTT = "Wenn aktiviert, ersetzt eine ge\195\164nderte spielinterne Freund-Notiz den HoloFriends Kommentar, ansonsten werden \195\132nderungen zur spielinternen Freund-Notiz immer wieder durch den HoloFriends Kommentar ersetzt. Die HoloFriends Kommentarbearbeitung setzt allerdings immer Beides.";
HOLOFRIENDS_OPTIONS2NOTESPRIORITYON = "HoloFriends Kommentare an spielinterne Freund-Notizen anh\195\164ngen";
HOLOFRIENDS_OPTIONS2NOTESPRIORITYONTT = "Wenn aktiviert, wird die Reihenfolge des Anh\195\164ngens zu spielinterne Freund-Notiz + HoloFriends Kommentar festgelgt, ansonsten ist die Reihenfolge HoloFriends Kommentar + spielinterne Freund-Notiz. (Spielinterne Freund-Notizen haben eine max. L\195\164nge von 48 Buchstaben.)";

HOLOFRIENDS_OPTIONS3SECTIONSHARE = "Fenster zum Freunde \195\188bertragen";
HOLOFRIENDS_OPTIONS3MARKREMOVE = "Markiere in der Zielliste die Gruppeneintr\195\164ge, welche in der Quellenliste nicht existieren";
HOLOFRIENDS_OPTIONS3MARKREMOVETT = "Wenn aktiviert, markiert das \195\156bertragen ganzer Gruppen die Eintr\195\164ge in der Zielliste, welche in der Gruppe in der Quellenliste nicht existieren. So k\195\182nnen diese, nach dem einw\195\164hlen mit dem Zielcharakter, bearbeitet (L\195\182schen, Verschieben, ...) werden. Das Verteilen von HoloFriends l\195\182scht auf jeden Fall nichts.";
HOLOFRIENDS_OPTIONS3MERGECOMMENTS = "Verbinde HoloFriends Kommentare w\195\164hrend dem \195\156bertragen von Freunden";
HOLOFRIENDS_OPTIONS3MERGECOMMENTSTT = "Wenn aktiviert, werden HoloFriends Kommentare an existierende HoloFriends Kommentare w\195\164hrend des \195\156bertragens von deinen Freunden zu deinen anderen Charakteren angeh\195\164ngt.";

HOLOFRIENDS_OPTIONS4SECTIONMENU = "Modifikationen an Pulldown-Menu\195\188s";
HOLOFRIENDS_OPTIONS4MENUMODF = "Modifiziere die Pulldown-Men\195\188s der verschiedenen Freund-Fenster (Chat, Who, ...)";
HOLOFRIENDS_OPTIONS4MENUMODP = "Modifiziere die Pulldown-Men\195\188s der Gruppen-Fenster";
HOLOFRIENDS_OPTIONS4MENUMODR = "Modifiziere die Pulldown-Men\195\188s des Raid-Fensters";
HOLOFRIENDS_OPTIONS4MENUMODT = "Modifiziere das Pulldown-Men\195\188s des Spieler-Fensters";
HOLOFRIENDS_OPTIONS4MENUMODTT = "Wenn aktiviert, werden Eintr\195\164ge zu den Pulldown-Men\195\188s hinzugef\195\188gt, um den ausgew\195\164hlten Spieler in die Freundes- oder Ignorieren-Liste einzutragen oder einen WHO-Check durchzuf\195\188hren. |cffffd200Das deaktiviert aber den Eintrag zum setzen des Fokus und Tank.|r";
HOLOFRIENDS_OPTIONS4SHOWDROPDOWNALLBG = "Undurchsichtiger Hintergrund bei allen Standard-Pulldown-Men\195\188s";
HOLOFRIENDS_OPTIONS4SHOWDROPDOWNALLBGTT = "Wenn aktiviert, wird allen Pulldown-Men\195\188s im Spiel, welche die Standard-Vorlage f\195\188r Pulldown-Men\195\188s verwenden, ein schwarzer undurchsichtiger Hintergrund hinzugef\195\188gt.";
HOLOFRIENDS_OPTIONS4SHOWDROPDOWNBG = "Undurchsichtiger Hintergrund bei Pulldown-Men\195\188s";
HOLOFRIENDS_OPTIONS4SHOWDROPDOWNBGTT = "Wenn aktiviert, wird allen Pulldown-Men\195\188s von HoloFriends ein schwarzer undurchsichtiger Hintergrund hinzugef\195\188gt.";

HOLOFRIENDS_OPTIONS5SECTIONMENU = "Modifikationen des Starts";
HOLOFRIENDS_OPTIONS5SHOWONLINEATLOGIN = "Zeige die Online-Freunde w\195\164hrend des Login";
HOLOFRIENDS_OPTIONS5SHOWONLINEATLOGINTT = "Wenn aktiviert, wird eine Liste aller aktiven Online-Freunde im Chat-Fenster w\195\164hrend des Login angezeigt.";

HOLOFRIENDS_OPTIONS6SECTIONMENU = "Ignorieren von Spielern";
HOLOFRIENDS_OPTIONS6MSGIGNOREDWHISPER = "Sende eine Notiez zu offline ignorierten Fl\195\188sterern";
HOLOFRIENDS_OPTIONS6MSGIGNOREDWHISPERTT = "Wenn aktiviert, wird automatisch eine Notiez, dass du sie ignorierst, zu offline ignorierten Spielern gesendet, welche dich anfl\195\188stern, ansonsten wird der gesamte Chat stumm ignoriert.";

HOLOFRIENDS_SHAREFRIENDSWINDOWTITLE = "Freunde \195\188bertragen";
HOLOFRIENDS_SHAREIGNOREWINDOWTITLE = "Ignorierte \195\188bertragen";
HOLOFRIENDS_SHAREWINDOWBUTTONSEPARATE = "Separieren";
HOLOFRIENDS_SHAREWINDOWDELETENOTE = "HINWEIS: Um Daten von bereits gel\195\182schten Charakteren zu entfernen, benutze:\n|cffffd200/holofriends delete {name} [at {realm}]|r";
HOLOFRIENDS_SHAREWINDOWFACTIONNOTEADD = "W\195\164hle einen Charakter, um ihn hinzuzuf\195\188gen";
HOLOFRIENDS_SHAREWINDOWFACTIONNOTEPULLDOWN = "Am Pulldown-Men\195\188:";
HOLOFRIENDS_SHAREWINDOWFACTIONNOTESEPARATE = "W\195\164hle deine Fraktion und markiere einen |cff999999(Charakter)|r deiner Charakerliste, um ihn zu separieren";
HOLOFRIENDS_SHAREWINDOWFACTIONTITLE = "Bedienung der fraktionsweiten Liste";
HOLOFRIENDS_SHAREWINDOWNOTE = "Das \195\156bertragen wird direkt nach dem Klick auf die Kn\195\182pfe \"Hinzuf\195\188gen\" oder \"Aktualisieren\" ausgef\195\188hrt";
HOLOFRIENDS_SHAREWINDOWSOURCE = "Freunde ausw\195\164hlen:";
HOLOFRIENDS_SHAREWINDOWTARGET = "\195\156bertrage an:";

HOLOFRIENDS_TOOLTIPDATEFORMAT = "%A %d.%m.%Y %H:%M";
HOLOFRIENDS_TOOLTIPDISABLEDMENUENTRYHINT = "Um diesen Men\195\188eintrag zu aktivieren,\nm\195\188ssen die HoloFriends Men\195\188modifikationen\nf\195\188r dieses Men\195\188 im HoloFriends\nOptionenfenster deaktivieren.";
HOLOFRIENDS_TOOLTIPDISABLEDMENUENTRYTITLE = "HoloFriends-Addon";
HOLOFRIENDS_TOOLTIPBROADCAST = "BNet-Nachricht an alle Freunde:";
HOLOFRIENDS_TOOLTIPLASTSEEN = "Zuletzt gesehen";
HOLOFRIENDS_TOOLTIPNEVERSEEN = "bisher nicht gesehen";
HOLOFRIENDS_TOOLTIPSHAREBUTTON = "\195\156bertrage diese Liste zu anderen Charakteren";
HOLOFRIENDS_TOOLTIPTURNINFOTEXT = "Wechselt die Info, welche hinter den Freundesnamen gezeigt wird zum Kommentar und zur\195\188ck zur Region";
HOLOFRIENDS_TOOLTIPTURNINFOTITLE = "Info wechseln";
HOLOFRIENDS_TOOLTIPUNKNOWN = "?";

HOLOFRIENDS_WINDOWMAINADDCOMMENT = "Kommentar bearbeiten";
HOLOFRIENDS_WINDOWMAINADDGROUP = "Gruppe hinzuf\195\188gen";
HOLOFRIENDS_WINDOWMAINBUTTONSCAN = "/who Scan";
HOLOFRIENDS_WINDOWMAINBUTTONSTOP = "Scan stoppen";
HOLOFRIENDS_WINDOWMAINIGNOREONLINE = "Online Ignorierte:";
HOLOFRIENDS_WINDOWMAINNUMBERONLINE = "Freunde Online:";
HOLOFRIENDS_WINDOWMAINREMOVEGROUP = "Gruppe entfernen";
HOLOFRIENDS_WINDOWMAINRENAMEGROUP = "Gruppe umbenennen";
HOLOFRIENDS_WINDOWMAINSHOWOFFLINE = "Offline-Freunde anzeigen";
HOLOFRIENDS_WINDOWMAINWHOREQUEST = "Who Abfrage";

end
