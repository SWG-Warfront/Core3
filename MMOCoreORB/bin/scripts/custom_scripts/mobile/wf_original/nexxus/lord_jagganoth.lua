lord_jagganoth = Creature:new {
	objectName = "",
	customName = "Lord Jagganoth",
	socialGroup = "Dark Jedi",
	pvpFaction = "",
	faction = "",
	level = 320,
	chanceHit = 100,
	damageMin = 900,
	damageMax = 2700,
	baseXp = 24081,
	baseHAM = 1861000,
	baseHAMmax = 1920000,
	armor = 3,
	resists = {40,50,50,30,20,70,60,30,60},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {"object/mobile/vendor/rodian_male.iff"},
	outfit = "jagganoth_outfit",
	scale = 1.2,
	lootGroups = {},
	weapons = {"dark_jedi_weapons_gen4"},
	conversationTemplate = "",
	attacks = merge(lightsabermaster,forcepowermaster)
}

CreatureTemplates:addCreatureTemplate(lord_jagganoth, "lord_jagganoth")
