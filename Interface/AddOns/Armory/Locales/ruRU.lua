--[[

    Please do NOT edit this file but go to http://wow.curseforge.com/addons/armory/localization/ instead.

    Original translators: MegaKSVS, alex_n
    
    The contents of this file will be generated automatically.
    
]]--

local L = LibStub("AceLocale-3.0"):NewLocale("Armory", "ruRU");
if ( not L ) then 
    return;
end

L["ARMORY_ALTS"] = "Альты"
L["ARMORY_BANK_CONTAINER_NAME"] = "Банк"
L["ARMORY_BY_DATE"] = "View by date" -- Requires localization
L["ARMORY_BY_GROUP"] = "View by group" -- Requires localization
L["ARMORY_CHECK_MAIL_DISABLED"] = "Проверка почты отключена."
L["ARMORY_CHECK_MAIL_MESSAGE"] = "Входящие %1$s (%2$s) содержат вещь '%3$s' которая истечет через %4$s!"
L["ARMORY_CHECK_MAIL_NONE"] = "Истекающей почты не найдено."
L["ARMORY_CHECK_MAIL_POPUP"] = "Есть почта, которая скоро истечет. Используйте '/ar check' для подробной информации."
L["ARMORY_CMD_CHECK"] = "проверка"
L["ARMORY_CMD_CHECK_INVALID"] = "Specify the number of days to check or none for default." -- Requires localization
L["ARMORY_CMD_CHECK_MENUTEXT"] = "Проверка описания вещи"
L["ARMORY_CMD_CHECK_TEXT"] = "проверить истекающую почту"
L["ARMORY_CMD_CONFIG"] = "настройка"
L["ARMORY_CMD_CONFIG_TEXT"] = "открыть панель настроек"
L["ARMORY_CMD_DELETE"] = "удалить"
L["ARMORY_CMD_DELETE_ALL"] = "все"
L["ARMORY_CMD_DELETE_ALL_MSG"] = "База данных Armory очищена."
L["ARMORY_CMD_DELETE_ALL_TEXT"] = "удалить всю базу данных"
L["ARMORY_CMD_DELETE_CHAR"] = "персонаж"
L["ARMORY_CMD_DELETE_CHAR_MSG"] = "Запись Армори для '%1$s' на сервере '%2$s' убрана."
L["ARMORY_CMD_DELETE_CHAR_NOT_FOUND"] = "Запись '%1$s' в мире '%2$s' не найдена в Armory!"
L["ARMORY_CMD_DELETE_CHAR_PARAMS_TEXT"] = "[имя] [сервер]"
L["ARMORY_CMD_DELETE_CHAR_TEXT"] = "удалить одного персонажа"
L["ARMORY_CMD_DELETE_REALM"] = "сервер"
L["ARMORY_CMD_DELETE_REALM_MSG"] = "Мир '%s' был удален из Armory."
L["ARMORY_CMD_DELETE_REALM_NOT_FOUND"] = "Armory сервер '%s' не найден!"
L["ARMORY_CMD_DELETE_REALM_PARAMS_TEXT"] = "[имя]"
L["ARMORY_CMD_DELETE_REALM_TEXT"] = "удалить все данные сервера"
L["ARMORY_CMD_DOWNLOAD"] = "загрузка"
L["ARMORY_CMD_DOWNLOAD_TEXT"] = "запрос рецептов у членов гильдии" -- Needs review
L["ARMORY_CMD_FIND"] = "найти"
L["ARMORY_CMD_FIND_ACHIEVEMENT"] = "achievement" -- Requires localization
L["ARMORY_CMD_FIND_ALL"] = "все"
L["ARMORY_CMD_FIND_FOUND"] = "Всего найдено: %d"
L["ARMORY_CMD_FIND_INVENTORY"] = "инвентарь"
L["ARMORY_CMD_FIND_ITEM"] = "вещь"
L["ARMORY_CMD_FIND_MENUTEXT"] = "Поиск в базе данных"
L["ARMORY_CMD_FIND_NOT_FOUND"] = "Не найдено"
L["ARMORY_CMD_FIND_PARAMS_TEXT"] = "[частьимени]"
L["ARMORY_CMD_FIND_QUEST"] = "задание"
L["ARMORY_CMD_FIND_QUEST_REWARD"] = "Награда за квест"
L["ARMORY_CMD_FIND_SKILL"] = "Навык"
L["ARMORY_CMD_FIND_SPELL"] = "Заклинание"
L["ARMORY_CMD_FIND_TEXT"] = "найти информацию в локальной базе данных"
L["ARMORY_CMD_HELP"] = "помощь"
L["ARMORY_CMD_HELP_TEXT"] = "показать эту справку"
L["ARMORY_CMD_LOOKUP"] = "глянуть"
L["ARMORY_CMD_LOOKUP_MENUTEXT"] = "Глянуть информацию"
L["ARMORY_CMD_LOOKUP_TEXT"] = "собирать информацию от других игроков"
L["ARMORY_CMD_RESET"] = "сброс"
L["ARMORY_CMD_RESET_FRAME"] = "окна"
L["ARMORY_CMD_RESET_FRAME_MENUTEXT"] = "Сбросить расположение" -- Needs review
L["ARMORY_CMD_RESET_FRAME_SUCCESS"] = "сброс окна"
L["ARMORY_CMD_RESET_FRAME_TEXT"] = "установить позицию на экране по умолчанию"
L["ARMORY_CMD_RESET_SETTINGS"] = "Настройки"
L["ARMORY_CMD_RESET_SETTINGS_SUCCESS"] = "Сброс настроек"
L["ARMORY_CMD_RESET_SETTINGS_TEXT"] = "установить все настройки обратно на стандартные"
L["ARMORY_CMD_SET_CHECKCOOLDOWNS_MENUTEXT"] = "Check available cooldowns" -- Requires localization
L["ARMORY_CMD_SET_CHECKCOOLDOWNS_TEXT"] = "check available cooldowns on startup" -- Requires localization
L["ARMORY_CMD_SET_CHECKCOOLDOWNS_TOOLTIP"] = "If enabled, tradeskill cooldowns that became available while you were offline will be displayed when you log in." -- Requires localization
L["ARMORY_CMD_SET_COOLDOWNEVENTS_MENUTEXT"] = "Include tradeskill cooldowns" -- Requires localization
L["ARMORY_CMD_SET_COOLDOWNEVENTS_TEXT"] = "include tradeskill cooldowns in event list" -- Requires localization
L["ARMORY_CMD_SET_COOLDOWNEVENTS_TOOLTIP"] = "If enabled, tradeskill cooldowns will be included in Armory's event list." -- Requires localization
L["ARMORY_CMD_SET_COUNTALL_MENUTEXT"] = "Включить в рассчет все миры"
L["ARMORY_CMD_SET_COUNTALL_TEXT"] = "включить в количество вещей все миры"
L["ARMORY_CMD_SET_COUNTALL_TOOLTIP"] = "Если включено, общее показывается для всех серверов; в других случаях только для текущего сервера."
L["ARMORY_CMD_SET_COUNTXFACTION_MENUTEXT"] = "Включить все фракции в подсчет"
L["ARMORY_CMD_SET_COUNTXFACTION_TEXT"] = "включить подсчет вещей для всех фракций"
L["ARMORY_CMD_SET_COUNTXFACTION_TOOLTIP"] = "If enabled, totals are shown for all factions; otherwise only for the current faction." -- Requires localization
L["ARMORY_CMD_SET_DEFAULTSEARCH_MENUTEXT"] = "Стандартный поиск домена"
L["ARMORY_CMD_SET_DEFAULTSEARCH_TEXT"] = "стандартный домен"
L["ARMORY_CMD_SET_DEFAULTSEARCH_TOOLTIP"] = "Использовать домен в поиске если другой не выбран."
L["ARMORY_CMD_SET_EVENTLOCALTIME_MENUTEXT"] = "Use local time for events" -- Requires localization
L["ARMORY_CMD_SET_EVENTLOCALTIME_TEXT"] = "use local time in event list" -- Requires localization
L["ARMORY_CMD_SET_EVENTLOCALTIME_TOOLTIP"] = "If enabled, local time is used in the event list; otherwise the realm time." -- Requires localization
L["ARMORY_CMD_SET_EVENTWARNINGS_MENUTEXT"] = "Event notifications" -- Requires localization
L["ARMORY_CMD_SET_EVENTWARNINGS_TEXT"] = "enable event notifications" -- Requires localization
L["ARMORY_CMD_SET_EVENTWARNINGS_TOOLTIP"] = "If enabled, you will be warned about confirmed events of your characters that are about to become due." -- Requires localization
L["ARMORY_CMD_SET_EXPDAYS_INVALID"] = "%1$s должно быть от 0 (отключить предупреждение) до %2$d дней!"
L["ARMORY_CMD_SET_EXPDAYS_PARAMS_TEXT"] = "<количестводней>"
L["ARMORY_CMD_SET_EXPDAYS_TEXT"] = "когда предупреждать о истечении почты"
L["ARMORY_CMD_SET_EXPDAYS_TOOLTIP"] = "Почта будет проверена, есть ли истекающие письма в указанное количество дней (0 - отключает предупреждение)"
L["ARMORY_CMD_SET_EXTENDEDSEARCH_MENUTEXT"] = "Улучшеный поиск"
L["ARMORY_CMD_SET_EXTENDEDSEARCH_TEXT"] = "смотреть в текстовую подсказку для совпадений когда используется найденое"
L["ARMORY_CMD_SET_EXTENDEDSEARCH_TOOLTIP"] = "Если включено, то поиск будет проверять подсказки, иначе только названия."
L["ARMORY_CMD_SET_EXTENDEDTRADE_MENUTEXT"] = "Включить фильтры профессий"
L["ARMORY_CMD_SET_EXTENDEDTRADE_TEXT"] = "Включить фильтры субкласса и слота"
L["ARMORY_CMD_SET_EXTENDEDTRADE_TOOLTIP"] = [=[Если включено, профессии могут быть отсортированы по субклассам или/и по слотам вещей.
Если у вас есть проблемы с другими аддонами, вы можете выключить эту функцию что бы получить простой список который не вызывает никаких ивентов( Список с категориями будет доступен при нажатии шифт-клик на ссылку).]=]
L["ARMORY_CMD_SET_FILTERALL_MENUTEXT"] = "Фильтровать все сообщения"
L["ARMORY_CMD_SET_FILTERALL_TEXT"] = "фильтровать все выходы Армори"
L["ARMORY_CMD_SET_FILTERALL_TOOLTIP"] = "Если включено, то все сообщения будут выводить в то же окно чата (имеет смысл, только если для Armory используется отдельное окно чата)."
L["ARMORY_CMD_SET_GLOBALSEARCH_MENUTEXT"] = "Глобальный поиск"
L["ARMORY_CMD_SET_GLOBALSEARCH_TEXT"] = "искать на всех серверах когда используется поиск"
L["ARMORY_CMD_SET_GLOBALSEARCH_TOOLTIP"] = "Если включено, команда поиска пройдет по введеной базе данных; в другом случае, будет искать только на данном сервере."
L["ARMORY_CMD_SET_HIDELOGON_MENUTEXT"] = "Спрятать предупреждение при входе"
L["ARMORY_CMD_SET_HIDELOGON_TEXT"] = "не показывать предупреждение при входе"
L["ARMORY_CMD_SET_HIDELOGON_TOOLTIP"] = "Если включено, предупреждение не будет отображатся при входе."
L["ARMORY_CMD_SET_HIDEMMTOOLBAR_MENUTEXT"] = "Прятать кнопку миникарты с панелями инструментов"
L["ARMORY_CMD_SET_HIDEMMTOOLBAR_TEXT"] = "спрятать кнопку у миникарты, если Titan или FuBar загружен"
L["ARMORY_CMD_SET_HIDEMMTOOLBAR_TOOLTIP"] = "Если включено, то кнопка у миникарты будет автоматически спрятана, если Titan или FuBar загружен."
L["ARMORY_CMD_SET_IGNOREALTS_MENUTEXT"] = "Игнорировать почту с альтов"
L["ARMORY_CMD_SET_IGNOREALTS_TEXT"] = "отключить предупреждения о почте от альтов"
L["ARMORY_CMD_SET_IGNOREALTS_TOOLTIP"] = "Если включено, то окно с предупреждением о истекающей почте будет отключено для писем от других ваших персонажей. Необходимо, чтобы эти персонажи были известны Armory."
L["ARMORY_CMD_SET_LASTVIEWED_MENUTEXT"] = "Запоминать выбор"
L["ARMORY_CMD_SET_LASTVIEWED_TEXT"] = "запоминать последнего просмотренного персонажа"
L["ARMORY_CMD_SET_LASTVIEWED_TOOLTIP"] = "Если включено, то выбраный персонаж будет сохранен между сессиями."
L["ARMORY_CMD_SET_LDBLABEL_MENUTEXT"] = "Включить пометку LDB"
L["ARMORY_CMD_SET_LDBLABEL_TEXT"] = "Включить отображение в Титане,ФуБАре и т.д"
L["ARMORY_CMD_SET_LDBLABEL_TOOLTIP"] = "Если включено, то текстовая пометка будет показана в дисплее LibDataBroker."
L["ARMORY_CMD_SET_MAILCHECKCOUNT_MENUTEXT"] = "Проверьте оставшуюся почту"
L["ARMORY_CMD_SET_MAILCHECKCOUNT_TEXT"] = "проверить не осталась ли почта в ящике"
L["ARMORY_CMD_SET_MAILCHECKCOUNT_TOOLTIP"] = "Если включено, будет отображено предупреждение когда не вся почта было отсканирована из-за того что был лимит отображения при исполнении"
L["ARMORY_CMD_SET_MAILCHECKVISIT_MENUTEXT"] = "Предупреждать о непрочитаной почте"
L["ARMORY_CMD_SET_MAILCHECKVISIT_TEXT"] = "включить последнее посещение ящика при просмотре почты"
L["ARMORY_CMD_SET_MAILCHECKVISIT_TOOLTIP"] = "If enabled, a warning will be shown when a character's mailbox hasn't been opened for at least 30 minus expiration threshold number of days and therefore may contain mail without being noticed." -- Requires localization
L["ARMORY_CMD_SET_MAILEXCLUDEVISIT_MENUTEXT"] = "Exclude this character's mailbox visit" -- Requires localization
L["ARMORY_CMD_SET_MAILEXCLUDEVISIT_TEXT"] = "не проверять просмотр почты этим персонажем"
L["ARMORY_CMD_SET_MAILEXCLUDEVISIT_TOOLTIP"] = "If enabled, the current character's mailbox visit will be excluded from the check." -- Requires localization
L["ARMORY_CMD_SET_MAILHIDECOUNT_MENUTEXT"] = "Спрятать сообщение о сканировании оставшейся почты"
L["ARMORY_CMD_SET_MAILHIDECOUNT_TEXT"] = "не показывать предупреждение если почта закрыта"
L["ARMORY_CMD_SET_MAILHIDECOUNT_TOOLTIP"] = "Если включено, предупреждение об оставшейся почте не будет отображатся после закрытия почтового ящика."
L["ARMORY_CMD_SET_MMB_ANGLE_TEXT"] = "расположение кнопки у миникарты"
L["ARMORY_CMD_SET_MMB_RADIUS_TEXT"] = "радиус кнопки миникарты"
L["ARMORY_CMD_SET_NOVALUE"] = "текущее значение: %s"
L["ARMORY_CMD_SET_NOVALUE_TEXT"] = "показывать текущее значение"
L["ARMORY_CMD_SET_OFF"] = "выкл"
L["ARMORY_CMD_SET_ON"] = "включено"
L["ARMORY_CMD_SET_PAUSEINCOMBAT_MENUTEXT"] = "Пауза в бою"
L["ARMORY_CMD_SET_PAUSEINCOMBAT_TEXT"] = "не сканировать в бою"
L["ARMORY_CMD_SET_PAUSEINCOMBAT_TOOLTIP"] = "Если включено, Армори ставит на паузу сканирование когда вы входите в бой, и продолжает когда выходите."
L["ARMORY_CMD_SET_PAUSEININSTANCE_MENUTEXT"] = "Remain paused in instance" -- Requires localization
L["ARMORY_CMD_SET_PAUSEININSTANCE_TEXT"] = "do not resume when in an instance" -- Requires localization
L["ARMORY_CMD_SET_PAUSEININSTANCE_TOOLTIP"] = "If enabled, getting out of combat in an instance will not process any postponed updates. Be aware that in this case item counts in tooltips will not be updated either." -- Requires localization
L["ARMORY_CMD_SET_PERCHARACTER_MENUTEXT"] = "Запомнить для каждого персонажа"
L["ARMORY_CMD_SET_PERCHARACTER_TEXT"] = "запоминать индивидуальные настройки"
L["ARMORY_CMD_SET_PERCHARACTER_TOOLTIP"] = "Если включено, 'все персонажи' и 'последний персонаж' значения будут хранится стандартно для каждого персонажа."
L["ARMORY_CMD_SET_SEARCHALL_MENUTEXT"] = "Запоминать 'все персонажи'"
L["ARMORY_CMD_SET_SEARCHALL_TEXT"] = "запоминать настройки инвентаря для 'все персонажи'"
L["ARMORY_CMD_SET_SEARCHALL_TOOLTIP"] = "Если включено, то настройки просмотра инвентаря для 'все персонажи' будут сохранены между сессиями."
L["ARMORY_CMD_SET_SHAREALL_MENUTEXT"] = "Показывать всех персонажей" -- Needs review
L["ARMORY_CMD_SET_SHAREALL_TEXT"] = "Менятся инфой со всеми вашими персонажами"
L["ARMORY_CMD_SET_SHAREALL_TOOLTIP"] = "Если включено, информация всех ваших персонажей будет передаватся; в другом случае инфо только о текущем персонаже."
L["ARMORY_CMD_SET_SHAREALT_MENUTEXT"] = "Показать отоношения"
L["ARMORY_CMD_SET_SHAREALT_TEXT"] = "Показать отношение с другими персонажами"
L["ARMORY_CMD_SET_SHAREALT_TOOLTIP"] = "Если включено , дружба между вашим текущим персонажем и вашими другими персонажами будет видима (т.е показана как альт). Выключение делает его 'самостоятельным' персонажем."
L["ARMORY_CMD_SET_SHARECHANNEL_MENUTEXT"] = "включить канал поиска"
L["ARMORY_CMD_SET_SHARECHANNEL_TEXT"] = "Включить отдельный канал"
L["ARMORY_CMD_SET_SHARECHANNEL_TOOLTIP"] = "Если включено, запросы поиска могут быть отправлены через доступный канал через который вы можете обмениватся данными с конкретными группами игроков."
L["ARMORY_CMD_SET_SHARECHARACTER_MENUTEXT"] = "Передовать информацию о персонаже"
L["ARMORY_CMD_SET_SHARECHARACTER_TEXT"] = " поделится информацией о своем персонаже "
L["ARMORY_CMD_SET_SHARECHARACTER_TOOLTIP"] = " Если включен, другие пользователи Армори  могут осмотреть вашу одежду и таланты."
L["ARMORY_CMD_SET_SHAREGUILD_MENUTEXT"] = " Осмотреть члена гильдии "
L["ARMORY_CMD_SET_SHAREGUILD_TEXT"] = " Поделится информацией c членом гильдии"
L["ARMORY_CMD_SET_SHAREGUILD_TOOLTIP"] = " Если включено, можно делится информацией о персонаже в пределах той же самой гильдии ."
L["ARMORY_CMD_SET_SHAREINCOMBAT_MENUTEXT"] = "осмотреть в битве"
L["ARMORY_CMD_SET_SHAREINCOMBAT_TEXT"] = " осмотреть когда в битве "
L["ARMORY_CMD_SET_SHAREINCOMBAT_TOOLTIP"] = " Если включено, Вы будете оповещены, в то время как Вы находитесь в бою. Выключение  может улучшить производительность."
L["ARMORY_CMD_SET_SHAREININSTANCE_MENUTEXT"] = "Делится в подземелье"
L["ARMORY_CMD_SET_SHAREININSTANCE_TEXT"] = "делится находясь в подземелье"
L["ARMORY_CMD_SET_SHAREININSTANCE_TOOLTIP"] = "Если включенно, вы будете отвечать очереди пока вы в подземелье. Выключение может увеличить производительность."
L["ARMORY_CMD_SET_SHAREQUESTS_MENUTEXT"] = "Обмен квестами"
L["ARMORY_CMD_SET_SHAREQUESTS_TEXT"] = "передача ваших квестов"
L["ARMORY_CMD_SET_SHAREQUESTS_TOOLTIP"] = "Если включенно, другие пользователи Армори могут искать ваши задания."
L["ARMORY_CMD_SET_SHARESKILLS_MENUTEXT"] = "Обмен профессиями"
L["ARMORY_CMD_SET_SHARESKILLS_TEXT"] = "обмен ваших рецептов"
L["ARMORY_CMD_SET_SHARESKILLS_TOOLTIP"] = "Если включенно, другие пользователи Армори могут искать ваши рецепты."
L["ARMORY_CMD_SET_SHOWACHIEVEMENTS_MENUTEXT"] = "Показывать достижения как ссылки"
L["ARMORY_CMD_SET_SHOWACHIEVEMENTS_TEXT"] = "показывать персонажам достижения как ссылки"
L["ARMORY_CMD_SET_SHOWACHIEVEMENTS_TOOLTIP"] = "Если включенно, персонажи которые заработали или в прогрессе достижения ссылка на который в чат будут добавлены в подсказку."
L["ARMORY_CMD_SET_SHOWALTEQUIP_MENUTEXT"] = "Показать альтернативные доспехи"
L["ARMORY_CMD_SET_SHOWALTEQUIP_TEXT"] = "показать альтернативные слоты доспехов"
L["ARMORY_CMD_SET_SHOWALTEQUIP_TOOLTIP"] = "Если включено, кукла будет показовать другие вещи с инвентаря которые подходят к слоту."
L["ARMORY_CMD_SET_SHOWCOUNTTOTAL_MENUTEXT"] = "показать общее количество вещей"
L["ARMORY_CMD_SET_SHOWCOUNTTOTAL_TEXT"] = "включяя общий счет вещей"
L["ARMORY_CMD_SET_SHOWCOUNTTOTAL_TOOLTIP"] = "Если включено, общий счет будет добавлен к счету вещей."
L["ARMORY_CMD_SET_SHOWCRAFTERS_MENUTEXT"] = "Показывать создателей в подсказке"
L["ARMORY_CMD_SET_SHOWCRAFTERS_TEXT"] = "показывать создателей в подсказке"
L["ARMORY_CMD_SET_SHOWCRAFTERS_TOOLTIP"] = "If enabled, item tooltips will show which character can craft that item." -- Requires localization
L["ARMORY_CMD_SET_SHOWEQCTOOLTIPS_MENUTEXT"] = "Показать подсказки сравнения"
L["ARMORY_CMD_SET_SHOWEQCTOOLTIPS_TEXT"] = "показать подсказку сравнения доспехов"
L["ARMORY_CMD_SET_SHOWEQCTOOLTIPS_TOOLTIP"] = "Если включенно, подсказки сравнения будут показаны при нажатии клавиши Альт."
L["ARMORY_CMD_SET_SHOWGEARSETS_MENUTEXT"] = "Показывать сет вещей в подсказке"
L["ARMORY_CMD_SET_SHOWGEARSETS_TEXT"] = "Показать имя одетых вещей в подсказке"
L["ARMORY_CMD_SET_SHOWGEARSETS_TOOLTIP"] = "Если включено и вещи принаджлежат сету , имя сета будет показано в подсказке."
L["ARMORY_CMD_SET_SHOWGEMS_MENUTEXT"] = "Show gemming details" -- Requires localization
L["ARMORY_CMD_SET_SHOWGEMS_TEXT"] = "show socket gemming details in tooltips" -- Requires localization
L["ARMORY_CMD_SET_SHOWGEMS_TOOLTIP"] = "If enabled, the color of the socket and the name of the gem will be added to the item tooltip." -- Requires localization
L["ARMORY_CMD_SET_SHOWITEMCOUNT_MENUTEXT"] = "Показать счет вещей в подсказке"
L["ARMORY_CMD_SET_SHOWITEMCOUNT_TEXT"] = "показать счет вещей в подсказке"
L["ARMORY_CMD_SET_SHOWITEMCOUNT_TOOLTIP"] = "Если включенно, подсказки вещей будут показывать собственные итоги для каждого персонажа."
L["ARMORY_CMD_SET_SHOWMINIMAP_MENUTEXT"] = "Показывать кнопку миникарты"
L["ARMORY_CMD_SET_SHOWMINIMAP_TEXT"] = "показывать кнопку миникарты"
L["ARMORY_CMD_SET_SHOWMINIMAP_TOOLTIP"] = "Если включенно, легкая кнопка доступа добавляется к миникарте."
L["ARMORY_CMD_SET_SHOWMMGLOBAL_MENUTEXT"] = "кнопка миникарты для всего"
L["ARMORY_CMD_SET_SHOWMMGLOBAL_TEXT"] = "Показывать кнопку миникарты для всех персонажей"
L["ARMORY_CMD_SET_SHOWMMGLOBAL_TOOLTIP"] = "Если включенно кнопка миникарты будет показана для всех персонажей. Если нет, вы должны будете включить кнопку миникарты для каждого персонажа индивидуально."
L["ARMORY_CMD_SET_SHOWQUESTALTS_MENUTEXT"] = "Показывать Альтов в линканутых заданиях"
L["ARMORY_CMD_SET_SHOWQUESTALTS_TEXT"] = "показать персонажей в линканутых заданиях"
L["ARMORY_CMD_SET_SHOWQUESTALTS_TOOLTIP"] = "Если включено, персонажи которые на задании линканутого в чате добавляются в подсказку."
L["ARMORY_CMD_SET_SHOWRECIPEKNOWN_MENUTEXT"] = "Показать известные рецепты в списке"
L["ARMORY_CMD_SET_SHOWRECIPEKNOWN_TEXT"] = "показывать известные рецепты в подсказке"
L["ARMORY_CMD_SET_SHOWRECIPEKNOWN_TOOLTIP"] = "Если включено, подсказки рецептов будут показывать какой персонаж уже знает этот рецепт."
L["ARMORY_CMD_SET_SHOWSHAREMSG_MENUTEXT"] = "Показывать сообщения обмена"
L["ARMORY_CMD_SET_SHOWSHAREMSG_TEXT"] = "показывать данные обмена сообщениями"
L["ARMORY_CMD_SET_SHOWSHAREMSG_TOOLTIP"] = "Если включенно, сообщения будут написанны в чат который предоставляет информацию про обмен данными о событиях."
L["ARMORY_CMD_SET_SHOWSUMMARY_MENUTEXT"] = "Итоговая инфа"
L["ARMORY_CMD_SET_SHOWSUMMARY_TEXT"] = "показывать итоговую информацию"
L["ARMORY_CMD_SET_SHOWSUMMARY_TOOLTIP"] = "Если включенно, итоговая информация о персонаже будет отображатся когда вы наводите на кнопку миникарты."
L["ARMORY_CMD_SET_SHOWUNEQUIP_MENUTEXT"] = "Показывать неодеваемые альтернативы"
L["ARMORY_CMD_SET_SHOWUNEQUIP_TEXT"] = "показывать неодеваемые альтернативы"
L["ARMORY_CMD_SET_SHOWUNEQUIP_TOOLTIP"] = "Если включенно, все вещи инвентаря которые могут быть в слоте будут показаны."
L["ARMORY_CMD_SET_SUCCESS"] = "%1$s установлено на %2$s"
L["ARMORY_CMD_SET_SUMMARYDELAY_TEXT"] = "Время отсрочки всплывающего окошка"
L["ARMORY_CMD_SET_SUMMARYDELAY_TOOLTIP"] = "Установите интервал после которого итог будет показан."
L["ARMORY_CMD_SET_USEENCODING_MENUTEXT"] = "Предпочитать память процессору"
L["ARMORY_CMD_SET_USEENCODING_TEXT"] = "предпочитать использование памяти над скоростью процессора"
L["ARMORY_CMD_SET_USEENCODING_TOOLTIP"] = "Если включенно, данные будут сохраненны в двоичном формате использовая меньше памяти но больше ресурсов процессора для збережения и отображения."
L["ARMORY_CMD_SET_USEINPROGRESSCOLOR_MENUTEXT"] = "Use different color for 'in progress'" -- Requires localization
L["ARMORY_CMD_SET_USEINPROGRESSCOLOR_TEXT"] = "colorize 'in progress' differently" -- Requires localization
L["ARMORY_CMD_SET_USEINPROGRESSCOLOR_TOOLTIP"] = "If enabled, a different color will be used for achievements still in progress by a character." -- Requires localization
L["ARMORY_CMD_SET_WINDOWSEARCH_MENUTEXT"] = "Показывать результаты поиска в окне"
L["ARMORY_CMD_SET_WINDOWSEARCH_TEXT"] = "показывать результаты команды поиска в отведенном окне"
L["ARMORY_CMD_SET_WINDOWSEARCH_TOOLTIP"] = "Если включенно, результаты команды поиска будут показаны в отдельном окне; в другом случае результаты показываются в окне чата."
L["ARMORY_CMD_TOGGLE"] = "включает/выключает Армори"
L["ARMORY_CMD_USAGE"] = "Использование:"
L["ARMORY_COOLDOWN_AVAILABLE"] = "Cooldown of '%1$s' is available again for %2$s (%3$s)." -- Requires localization
L["ARMORY_COOLDOWN_WARNING"] = "%s in %d |4minute:minutes;" -- Requires localization
L["ARMORY_CRAFTABLE_BY"] = "Может зделать"
L["ARMORY_DB_INCOMPATIBLE"] = [=[База данных не сопоставима с этой версией Армори и будет очищенна.
Вы должны будете ввести сервер с каждым персонажем что бы перестроить базу данных.]=]
L["ARMORY_DELETE_UNIT"] = "Хотите ли вы удалить %s из базы данных?"
L["ARMORY_DELETE_UNIT_HINT"] = "Правый клик что бы удалить этого персонажа." -- Needs review
L["ARMORY_EQUIPMENT"] = "Оснастка"
L["ARMORY_EQUIPPED"] = "Equipped" -- Requires localization
L["ARMORY_ERROR"] = "ОШИБКА"
L["ARMORY_EVENT_WARNING"] = "%s starts in %d |4minute:minutes;" -- Requires localization
L["ARMORY_EXPIRATION_LABEL"] = "Истечение"
L["ARMORY_EXPIRATION_SUBTEXT"] = "Эти настройки позволят вам изменять поведение проверки истечения почты."
L["ARMORY_EXPIRATION_TITLE"] = "Истечение почты"
L["ARMORY_EXTENDED"] = "Расширенный"
L["ARMORY_FILTER_ALL"] = "Выбрать все"
L["ARMORY_FILTER_CLEAR"] = "Очистить выбор"
L["ARMORY_FILTER_DISABLE"] = "Выключить фильтры"
L["ARMORY_FILTER_ENABLE"] = "Включить фильтры"
L["ARMORY_FILTER_LABEL"] = "Фильтры: %s"
L["ARMORY_FILTER_TOOLTIP"] = "Кликните что бы войти в глобальный фильтр вещей."
L["ARMORY_FIND_BUTTON"] = "Найти"
L["ARMORY_FIND_LABEL"] = "Найти"
L["ARMORY_FIND_SUBTEXT"] = "Эти настройки позволят вам изменять поведение команды поиска."
L["ARMORY_FIND_TITLE"] = "База данных поиска"
L["ARMORY_FONT_COLOR"] = "Цвет шрифта"
L["ARMORY_FULLY_RESTED"] = "Fully rested in: %s" -- Requires localization
L["ARMORY_GLOBAL"] = "Глобально"
L["ARMORY_IGNORE_REASON_COMBAT"] = "обмен выключен пока вы находитесь в бою"
L["ARMORY_IGNORE_REASON_INSTANCE"] = "обмен выключен пока вы находитесь в подземелье"
L["ARMORY_IGNORE_REASON_SHARING"] = "обмен выключен"
L["ARMORY_IGNORE_REASON_VERSION"] = "не поддерживаемая версия протокола"
L["ARMORY_INFO"] = "ИНФО"
L["ARMORY_INVENTORY_BAGLAYOUT"] = "Использовать вывод сумки"
L["ARMORY_INVENTORY_BAGLAYOUT_TOOLTIP"] = "Показывать контейнеры в соответствии с выводимым слоем."
L["ARMORY_INVENTORY_ICONVIEW"] = "Вид Иконки"
L["ARMORY_INVENTORY_ICONVIEW_TOOLTIP"] = "Стандартный вид"
L["ARMORY_INVENTORY_LISTVIEW"] = "Отобразить вид в списке"
L["ARMORY_INVENTORY_LISTVIEW_TOOLTIP"] = "Улучшеное отображение"
L["ARMORY_INVENTORY_SEARCH_ALL"] = "Все персонажи"
L["ARMORY_INVENTORY_SEARCH_ALL_TOOLTIP"] = "Выбирете все вещи инвентаря всех персонажей в базе данных."
L["ARMORY_INVENTORY_SEARCH_TEXT_TOOLTIP"] = [=[Введите критерию фильтра.

Вы можете фильтрировать качество введя '=' следуемое за %s, %s, %s, %s, %s, %s, %s or %s или ихи соответствущей нумерации 0-7 (т.е. '=4' для эпик вещей).]=]
L["ARMORY_KNOWN_BY"] = "Known by" -- Requires localization
L["ARMORY_LINK_HINT"] = "Шифт Клик для ссылки" -- Needs review
L["ARMORY_LINK_TRADESKILL_TOOLTIP"] = "ШИфт-клик открывает ваши профессии."
L["ARMORY_LOOKUP_BUTTON"] = "Просмотр"
L["ARMORY_LOOKUP_CHARACTER"] = "Поиск персонажа"
L["ARMORY_LOOKUP_CHARACTER_SEARCH_TOOLTIP"] = [=[Введите критерию фильтра.

Это также может быть имя альта когонибудь.]=]
L["ARMORY_LOOKUP_DETAIL"] = "Нажмите для деталей"
L["ARMORY_LOOKUP_DISABLED"] = "Обмен данными выключен."
L["ARMORY_LOOKUP_IGNORED"] = "Запрос проигнорирован (причина: %s)"
L["ARMORY_LOOKUP_NODETAIL"] = "Детали не доступны"
L["ARMORY_LOOKUP_PLAYER_HINT"] = "Shift-клик для инфо о игроке  Правый-клик что бы шепнуть"
L["ARMORY_LOOKUP_QUEST"] = "Просмотр Заданий"
L["ARMORY_LOOKUP_QUEST_AREA"] = "Область Задания"
L["ARMORY_LOOKUP_QUEST_NAME"] = "Имя Задания"
L["ARMORY_LOOKUP_QUEST_SEARCH_TOOLTIP"] = [=[Введите критерию фильтра.

Вы также можете запросить у персонажей наличие заданий в определенной зоне выбрав ответ кореспонденции в выпадающем меню.]=]
L["ARMORY_LOOKUP_REALM_ALIAS"] = "Просмотрено"
L["ARMORY_LOOKUP_REQUEST_DETAIL"] = "Запрос данных: %s"
L["ARMORY_LOOKUP_REQUEST_RECEIVED"] = "Запрос обмена данными получен с %s"
L["ARMORY_LOOKUP_REQUEST_SENT"] = "Запрос на отправление от %s"
L["ARMORY_LOOKUP_RESPONSE_RECEIVED"] = "Получены данные от %s"
L["ARMORY_LOOKUP_RESPONSE_SENT"] = "Запрос ответа отправлен %s"
L["ARMORY_LOOKUP_SEARCH_EXACT"] = "Точное совпадение"
L["ARMORY_LOOKUP_SKILL"] = "Поиск рецептов"
L["ARMORY_LOOKUP_SKILL_SEARCH_TOOLTIP"] = [=[Введите критерию вашого фильтра.

Имена персонажей которые были возвращены могут быть нажаты что бы открыть их окно скила.
Заметьте что вы можете запросить полный список рецептов введя только (*).]=]
L["ARMORY_MAIL_COUNT_WARNING1"] = "The inbox still contains %d |4mail:mails; that couldn't be scanned." -- Requires localization
L["ARMORY_MAIL_COUNT_WARNING2"] = "%1$s (%2$s) has %d |4mail:mails; that couldn't be scanned." -- Requires localization
L["ARMORY_MAIL_ITEM_COUNT"] = "Количество вещей:"
L["ARMORY_MAIL_LAST_VISIT"] = "Последнее посещение:"
L["ARMORY_MAIL_REMAINING"] = "Почта осталась:"
L["ARMORY_MAIL_VISIT_WARNING"] = "%1$s (%2$s) hasn't visited the mailbox for %3$s. Please log in to check your inbox." -- Requires localization
L["ARMORY_MESSAGE_FILTER"] = "Фильтр Сообщений"
L["ARMORY_MINIMAP_LABEL"] = "Миникарта"
L["ARMORY_MINIMAP_SUBTEXT"] = "Это настройки контроля отображения кнопки миникарты."
L["ARMORY_MINIMAP_TITLE"] = "Кнопка Армори на Миникарте"
L["ARMORY_MISC_LABEL"] = "Разное"
L["ARMORY_MISC_SUBTEXT"] = "Эти настройки позволяют вам устанавливать разнообразные установки."
L["ARMORY_MISC_TITLE"] = "Настройки Разного"
L["ARMORY_MODULES_LABEL"] = "Модули"
L["ARMORY_MODULES_SUBTEXT"] = "Эти настройки позволяют вам выбирать какие модули активны."
L["ARMORY_MODULES_TITLE"] = "Модули Армори"
L["ARMORY_MONEY_TOTAL"] = "%1$s %2$s общее:"
L["ARMORY_OPEN_HINT"] = "Нажмите что бы открыть" -- Needs review
L["ARMORY_QUEST_TOOLTIP_LABEL"] = "Альты на этом задании:"
L["ARMORY_REPUTATION_SUMMARY"] = "%1$s - %2$s (%3$d/%4$d, %5$d левый)"
L["ARMORY_SEARCHING"] = "Поиск..."
L["ARMORY_SELECT_UNIT_HINT"] = "Левый клик что бы выбрать этого персонажа."
L["ARMORY_SHARE_DOWNLOAD_LOADERROR"] = "Невозможно загрузить %1$s; причина: %2$s"
L["ARMORY_SHARE_LABEL"] = "Обмен"
L["ARMORY_SHARE_SUBTEXT1"] = "Эти Настройки определяют как вы обмениваетесь данными с другими пользователями Армори. Заметьте что эти на стройки на стандартных каждого персонажа."
L["ARMORY_SHARE_SUBTEXT2"] = "Следущие настройки установленны на глобальном уровне."
L["ARMORY_SHARE_TITLE"] = "Обмен данными"
L["ARMORY_SHORTDATE_FORMAT"] = "ARMORY_SHORTDATE_FORMAT"
L["ARMORY_SLASH_ALTERNATIVES"] = "/ar"
L["ARMORY_SOCIAL_ADD_TOOLTIP"] = "ШИфт-клик что бы добавть ваш текущий список."
L["ARMORY_SUBTEXT"] = "Эти настройки позволят вам модифицировать поведение Армори."
L["ARMORY_SUMMARY_LABEL"] = "Итог"
L["ARMORY_SUMMARY_SUBTEXT1"] = "Эти настройки позволяют вам изменять итог вещей персонажа в Армори."
L["ARMORY_SUMMARY_SUBTEXT2"] = "Выбирете отображаемую информацию."
L["ARMORY_SUMMARY_TITLE"] = "Итоговые Настройки"
L["ARMORY_TALENTS"] = "СПЕЦИАЛИЗАЦИЯ ТАНАНТОВ:"
L["ARMORY_TOOLTIP1"] = "Персонаж:"
L["ARMORY_TOOLTIP2"] = "Сервер:"
L["ARMORY_TOOLTIP_HINT1"] = "Левый клик включить/выключить Армори"
L["ARMORY_TOOLTIP_HINT2"] = "Правый клик для настроек"
L["ARMORY_TOOLTIP_LABEL"] = "Подсказка"
L["ARMORY_TOOLTIP_SUBTEXT"] = "Эти настройки позволяют вам добавлять информацию в подсказки."
L["ARMORY_TOOLTIP_TITLE"] = "ПОдсказка Зачарования"
L["ARMORY_TOTAL"] = "Итог: %d"
L["ARMORY_TRADE_ALCHEMY"] = "Алхимия"
L["ARMORY_TRADE_BLACKSMITHING"] = "Кузнечное дело"
L["ARMORY_TRADE_COOKING"] = "Кулинария"
L["ARMORY_TRADE_ENCHANTING"] = "Зачарование"
L["ARMORY_TRADE_ENGINEERING"] = "Инженерное дело"
L["ARMORY_TRADE_FIRST_AID"] = "Первая помощь"
L["ARMORY_TRADE_FISHING"] = "Рыбная ловля"
L["ARMORY_TRADE_HERBALISM"] = "Травничество"
L["ARMORY_TRADE_INSCRIPTION"] = "Начертание"
L["ARMORY_TRADE_JEWELCRAFTING"] = "Ювелирное дело"
L["ARMORY_TRADE_LEATHERWORKING"] = "Кожевничество"
L["ARMORY_TRADE_MINING"] = "Горное дело"
L["ARMORY_TRADE_POISONS"] = "Яды"
L["ARMORY_TRADE_SKILLS"] = "Главные професии:"
L["ARMORY_TRADESKILL_SEARCH_TEXT_TOOLTIP"] = [=[Введите критерий вашего фильтра.

Вы также можете ввести для примера '10', '~10' or '10-20' что бы фильтровать уровень рецепта.]=]
L["ARMORY_TRADE_SKINNING"] = "Снятие шкур"
L["ARMORY_TRADE_TAILORING"] = "Шитье"
L["ARMORY_TRADE_UPDATE_WARNING"] = "Данные о професии не сохранены. Пожалуйста используйте кнопку закрытия что бы получить обновление."
L["ARMORY_UPDATE_SUSPENDED"] = "suspended" -- Requires localization
L["ARMORY_WARNING"] = "ВНИМАНИЕ"
L["ARMORY_WHAT"] = "Что"
L["ARMORY_WHERE"] = "Где"
L["ARMORY_WHO"] = "Кто"
L["ARMORY_XP_SUMMARY"] = "Level %1$d (%2$s) %3$d XP to go, %4$s rested" -- Requires localization
L["BINDING_NAME_ARMORY_TOGGLE"] = "Показать\\скрыть Armory"
L["BINDING_NAME_CURRENT_CHARACTER"] = "Выбрать текущего персонажа"
L["BINDING_NAME_FIND"] = "Показать\\скрыть поиск"
L["BINDING_NAME_LOOKUP"] = "Показать\\скрыть просмотр" -- Needs review
L["BINDING_NAME_NEXT_CHARACTER"] = "Выбрать следующий персонаж"
L["BINDING_NAME_PREVIOUS_CHARACTER"] = "Выбрать предыдущий персонаж"

