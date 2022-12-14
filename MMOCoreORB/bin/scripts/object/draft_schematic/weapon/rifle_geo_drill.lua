
object_draft_schematic_weapon_rifle_geo_drill = object_draft_schematic_weapon_shared_rifle_geo_drill:new {

   templateType = DRAFTSCHEMATIC,

   customObjectName = "Geo Drill Rifle",

   craftingToolTab = 1, -- (See DraftSchematicObjectTemplate.h)
   complexity = 17,
   size = 2,

   xpType = "crafting_weapons_general",
   xp = 230,

   assemblySkill = "weapon_assembly",
   experimentingSkill = "weapon_experimentation",
   customizationSkill = "weapon_customization",

   customizationOptions = {},
   customizationStringNames = {},
   customizationDefaults = {},

   ingredientTemplateNames = {"craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_weapon_ingredients_n"},
   ingredientTitleNames = {"stock", "receiver_assembly", "grip_assembly", "powerhandler", "barrel"},
   ingredientSlotType = {0, 0, 0, 1, 1},
   resourceTypes = {"copper_mythra", "iron_doonium", "metal", "object/tangible/component/weapon/shared_blaster_power_handler.iff", "object/tangible/component/weapon/shared_blaster_rifle_barrel.iff"},
   resourceQuantities = {60, 35, 10, 10, 1},
   contribution = {100, 100, 100, 100, 100},


   targetTemplate = "object/weapon/ranged/rifle/rifle_geo_drill_generic.iff",

   additionalTemplates = {
             }


}
ObjectTemplates:addTemplate(object_draft_schematic_weapon_rifle_geo_drill, "object/draft_schematic/weapon/rifle_geo_drill.iff")
