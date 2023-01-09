candy_graul_hue = Creature:new {
	objectName = "",
	customName = "Elder Candy Graul",
	socialGroup = "graul",
	faction = "",
	level = 100,
	chanceHit = 10.75,
	damageMin = 1095,
	damageMax = 1900,
	baseXp = 16411,
	baseHAM = 120000,
	baseHAMmax = 125000,
	armor = 2,
	resists = {175,155,190,190,190,155,155,155,-1},
	tamingChance = 0,
	ferocity = 15,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/candy_graul_hue.iff"},
	scale = 1,
	lootGroups = {},
	weapons = {"creature_spit_small_yellow"},
	conversationTemplate = "",
	attacks = {
		{"creatureareableeding",""},
		{"stunattack",""}
	}
}

CreatureTemplates:addCreatureTemplate(candy_graul_hue, "candy_graul_hue")
