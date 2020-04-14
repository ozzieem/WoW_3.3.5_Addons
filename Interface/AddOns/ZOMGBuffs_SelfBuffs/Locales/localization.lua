local L = LibStub("AceLocale-2.2"):new("ZOMGSelfBuffs")

L:RegisterTranslations("enUS", function() return {
	["Self Buff Configuration"]								= true,
	["Self"]												= true,
	["Templates"]											= true,
	["Template configuration"]								= true,
	["Class Spells"]										= true,
	["Class spell configuration"]							= true,
	["Items"]												= true,
	["Item configuration"]									= true,
	["Main Hand"]											= true,
	["Use this item or spell on the main hand weapon"]		= true,
	["Off Hand"]											= true,
	["Use this item or spell on the off hand weapon"]		= true,
	["You need |cFFFFFF80%s|r"]								= true,
	["You need %s"]											= true,
	["You need |c0080FF80%s|r on |c00FFFF80%s|r"]			= true,
	["You need %s on |c00FFFF80%s|r"]						= true,
	["You need %s on %s"]									= true,
	["Tracking"]											= true,
	["Tracking configuration"]								= true,
	["Behaviour"]											= true,
	["Self buffing behaviour"]								= true,
	["Auto buffs"]											= true,
	["Use auto-intelligent buffs such as Crusader Aura when mounted"] = true,
	["Self Buffs Template: "]								= true,
	["(modified)"]											= true,
	["none"]												= true,
	["Main Hand"]											= true,
	["Off Hand"]											= true,
	["Seals"]												= true,				-- Generic Paladin 'Seal of ' description
	["Expiry Prelude"]										= true,
	["Rebuff prelude for %s (0=Module default)"]			= true,
	["Minimum Charges"]										= true,
	["Rebuff if number of charges left is less than defined amount"] = true,
	["Default"]												= true,
	["Default rebuff prelude for all self buffs"]			= true,
	["Warning: |cFF%s%s|r already applied by another %s"]	= true,
	["Combat Warnings"]										= true,
	["Warn about expiring buffs in combat. Note that auto buffing cannot be done in combat, this is simply a reminder"] = true,
	["%s, %s%d|r %s remain"]								= true,
	["Learnable"]											= true,
	["Remember this spell when it's cast manually?"]		= true,
	["Reagent Reminder"]									= true,
	["Show message when spells requiring reagents are used"] = true,
	["Flask of the North"]									= true,
	["Special handling for Flask of the North"]				= true,
	["Expiry prelude for flasks"]							= true,
} end)