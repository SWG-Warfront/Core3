nova_hutt_charter = Creature:new {
	objectName = "@npc_name:hutt_base_female",
	customName = "(Charter Service Representitive)",
	socialGroup = "townsperson",
	faction = "townsperson",
	level = 100,
	chanceHit = 1,
	damageMin = 645,
	damageMax = 1000,
	baseXp = 9429,
	baseHAM = 24000,
	baseHAMmax = 30000,
	armor = 0,
	resists = {0,0,0,0,0,0,0,0,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = NONE,
	creatureBitmask = PACK,
	--optionsBitmask = AIENABLED + CONVERSABLE,
	diet = HERBIVORE,
	scale = .6,

	templates = {"object/mobile/shalera.iff"},
	lootGroups = {},
	weapons = {},
	--conversationTemplate = "",
	attacks = {
	}
}

CreatureTemplates:addCreatureTemplate(nova_hutt_charter, "nova_hutt_charter")
