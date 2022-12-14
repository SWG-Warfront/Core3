--Copyright (C) 2010 <SWGEmu>


--This File is part of Core3.

--This program is free software; you can redistribute 
--it and/or modify it under the terms of the GNU Lesser 
--General Public License as published by the Free Software
--Foundation; either version 2 of the License, 
--or (at your option) any later version.

--This program is distributed in the hope that it will be useful, 
--but WITHOUT ANY WARRANTY; without even the implied warranty of 
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
--See the GNU Lesser General Public License for
--more details.

--You should have received a copy of the GNU Lesser General 
--Public License along with this program; if not, write to
--the Free Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA

--Linking Engine3 statically or dynamically with other modules 
--is making a combined work based on Engine3. 
--Thus, the terms and conditions of the GNU Lesser General Public License 
--cover the whole combination.

--In addition, as a special exception, the copyright holders of Engine3 
--give you permission to combine Engine3 program with free software 
--programs or libraries that are released under the GNU LGPL and with 
--code included in the standard release of Core3 under the GNU LGPL 
--license (or modified versions of such code, with unchanged license). 
--You may copy and distribute such a system following the terms of the 
--GNU LGPL for Engine3 and the licenses of the other code concerned, 
--provided that you include the source code of that other code when 
--and as the GNU LGPL requires distribution of source code.

--Note that people who make modified versions of Engine3 are not obligated 
--to grant this special exception for their modified versions; 
--it is their choice whether to do so. The GNU Lesser General Public License 
--gives permission to release a modified version without this exception; 
--this exception also makes it possible to release a modified version 


object_building_player_tree_house = object_building_player_shared_tree_house:new {
	lotSize = 2,
	baseMaintenanceRate = 10,
	allowedZones = {"corellia", "dantooine", "lok", "naboo", "rori", "talus", "tatooine"},
	constructionMarker = "object/building/player/construction/construction_player_house_corellia_large_style_01.iff",
	length = 5,
	width = 7,
	publicStructure = 0,
	skillMods = {
		{"private_medical_rating", 100},
		{"private_buff_mind", 100},
		{"private_med_battle_fatigue", 15},
		{"private_safe_logout", 1}
	},
	childObjects = {
--			{templateFile = "object/tangible/sign/player/house_address.iff", x = 4.34, z = 3.4, y = 18.40, ox = 0, oy = 0.707107, oz = 0, ow = 0.707107, cellid = -1, containmentType = -1},
--			{templateFile = "object/tangible/sign/streetsign_wall_style_01.iff", x = 11.68, z = 0.5, y = 19.04, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1},
			{templateFile = "object/tangible/terminal/terminal_player_structure.iff", x = 4.8, z = 1.22656, y = 2.3, ow = 0.8940034, ox = 0, oz = 0, oy = -0.4480601, cellid = 1, containmentType = -1},
			{templateFile = "object/soundobject/soundobject_swamp_a.iff", x = 4.8, z = 5.22656, y = 15.3, ow = 0.8940034, ox = 0, oz = 0, oy = -0.4480601, cellid = -1, containmentType = -1},
			{templateFile = "object/tangible/furniture/tatooine/frn_tato_fruit_stand_large_style_01.iff", x = 8.6, z = 0.9, y = 5.2, ow = 0.9858966, ox = 0, oz = 0, oy = 0.1673557, cellid = -1, containmentType = -1},
			{templateFile = "object/tangible/furniture/tatooine/frn_tato_fruit_stand_small_style_01.iff", x = 3, z = 0.9, y = 9.1, ow = 0.913843, ox = 0, oz = 0, oy = 0.4060677, cellid = -1, containmentType = -1},
			{templateFile = "object/tangible/furniture/effect_control/tree_house_control.iff", x = 0.73, z = 1.54, y = 9.1, ow = 0.3583679, ox = 0, oz = 0, oy = -0.9335804, cellid = 1, containmentType = -1},
			{templateFile = "object/tangible/furniture/decorative/tanning_hide_s01.iff", x = -13.5, z = 0.9, y = 18.5, ow = 0.913843, ox = 0, oz = 0, oy = 0.4060677, cellid = -1, containmentType = -1},
			{templateFile = "object/tangible/event_perk/endr_imprv_flagpole_s01.iff", x = 13.0, z = 0.6, y = 19.5, ox = 0, oy = 0, oz = 0, ow = 1, cellid = -1, containmentType = -1},
			{templateFile = "object/tangible/furniture/all/frn_all_tiki_torch_s1.iff", x = 13.350, z = 1.1, y = 21.4, ox = 0, oy = 0, oz = 0, ow = 1, cellid = -1, containmentType = -1},
			{templateFile = "object/tangible/furniture/all/frn_all_tiki_torch_s1.iff", x = 7.5, z = 1.1, y = 21.4, ox = 0, oy = 0, oz = 0, ow = 1, cellid = -1, containmentType = -1},
			{templateFile = "object/tangible/food/crafted/drink_veronian_berry_wine.iff", x = 10.3, z = 1.75, y = 7.7, ox = 0, oy = 0, oz = 0, ow = 1, cellid = -1, containmentType = -1},
			{templateFile = "object/tangible/food/crafted/drink_kylessian_fruit_distillate.iff", x = 9.8, z = 1.75, y = 7.3, ox = 0, oy = 0, oz = 0, ow = 1, cellid = -1, containmentType = -1},
			{templateFile = "object/tangible/food/crafted/dessert_kiwik_clusjo_swirl.iff", x = 10.1, z = 1.75, y = 7.9, ox = 0, oy = 0, oz = 0, ow = 1, cellid = -1, containmentType = -1},			
			{templateFile = "object/tangible/furniture/tatooine/frn_tato_tbl_cafe_table_style_01.iff", x = 10.0, z = 1, y = 7.5, ox = 0, oy = 0, oz = 0, ow = 1, cellid = -1, containmentType = -1},
			{templateFile = "object/tangible/furniture/tatooine/frn_tato_cafe_parasol.iff", x = 10.0, z = 1.3, y = 7.5, ox = 0, oy = 0, oz = 0, ow = 1, cellid = -1, containmentType = -1},
			{templateFile = "object/tangible/furniture/tatooine/frn_tato_chair_cafe_style_01.iff", x = 10.0, z = 1, y = 6.5, ox = 0, oy = 0, oz = 0, ow = 1, cellid = -1, containmentType = -1},
			{templateFile = "object/tangible/furniture/tatooine/frn_tato_chair_cafe_style_01.iff", x = 11.0, z = 1, y = 7.5, ox = 0, oy = 0, oz = 0, ow = 1, cellid = -1, containmentType = -1},
			{templateFile = "object/tangible/furniture/tatooine/frn_tato_chair_cafe_style_01.iff", x = 9.0, z = 1, y = 7.5, ox = 0, oy = 0, oz = 0, ow = 1, cellid = -1, containmentType = -1},			
			{templateFile = "object/tangible/furniture/tatooine/frn_tato_meat_rack.iff", x = 7.0, z = 0.2, y = 10.0, ox = 0, oy = 0, oz = 0, ow = 1, cellid = -1, containmentType = -1},
			{templateFile = "object/tangible/furniture/decorative/campfire.iff", x = 7.8, z = 0.9, y = 10.0, ox = 0, oy = 0, oz = 0, ow = 0, cellid = -1, containmentType = -1},
			{templateFile = "object/tangible/furniture/decorative/campfire.iff", x = 7.0, z = 0.9, y = 10.0, ox = 0, oy = 0, oz = 0, ow = 0, cellid = -1, containmentType = -1},
			{templateFile = "object/tangible/furniture/decorative/campfire.iff", x = 6.2, z = 0.9, y = 10.0, ox = 0, oy = 0, oz = 0, ow = 0, cellid = -1, containmentType = -1},					
			{templateFile = "object/tangible/furniture/tatooine/frn_tato_chair_cafe_style_01.iff", x = 7.0, z = 1, y = 14.5, ox = 0, oy = 0, oz = 0, ow = 1, cellid = -1, containmentType = -1},
			{templateFile = "object/tangible/furniture/tatooine/frn_tato_chair_cafe_style_01.iff", x = 8.0, z = 1, y = 15.5, ox = 0, oy = 0, oz = 0, ow = 1, cellid = -1, containmentType = -1},
			{templateFile = "object/tangible/furniture/tatooine/frn_tato_chair_cafe_style_01.iff", x = 6.0, z = 1, y = 15.5, ox = 0, oy = 0, oz = 0, ow = 1, cellid = -1, containmentType = -1},			
			{templateFile = "object/tangible/furniture/tatooine/frn_tato_tbl_cafe_table_style_01.iff", x = 7.0, z = 1, y = 15.5, ox = 0, oy = 0, oz = 0, ow = 1, cellid = -1, containmentType = -1},
			{templateFile = "object/tangible/food/crafted/drink_double_dip_outer_rim_rumdrop.iff", x = 7.3, z = 1.75, y = 15.9, ox = 0, oy = 0, oz = 0, ow = 1, cellid = -1, containmentType = -1},
			{templateFile = "object/tangible/food/crafted/drink_elshandruu_pica_thundercloud.iff", x = 6.5, z = 1.75, y = 15.2, ox = 0, oy = 0, oz = 0, ow = 1, cellid = -1, containmentType = -1},
			{templateFile = "object/tangible/food/crafted/dessert_almond_kwevvu_crisp_munchies.iff", x = 7.1, z = 1.75, y = 16.0, ox = 0, oy = 0, oz = 0, ow = 1, cellid = -1, containmentType = -1},			
			{templateFile = "object/tangible/furniture/tatooine/frn_tato_cafe_parasol.iff", x = 7.0, z = 1.3, y = 15.5, ox = 0, oy = 0, oz = 0, ow = 1, cellid = -1, containmentType = -1},			
			{templateFile = "object/tangible/sign/all_sign_city_s03.iff", x = 5.0, z = 0.8, y = 6.5, ox = 0, oy = 0, oz = 0, ow = 1, cellid = -1, containmentType = -1},
	},
	shopSigns = {
			{templateFile = "object/tangible/sign/streetsign_wall_style_01.iff", x = 7.0, z = 0.8, y = 6.5, ox = 0, oy = 0, oz = 0, ow = 1, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:house_address"},	
			{templateFile = "object/tangible/sign/player/shop_sign_s01.iff", x = 7.0, z = 0.8, y = 6.5, ox = 0, oy = 1, oz = 0, ow =  0, cellid = -1, containmentType = -1, requiredSkill = "crafting_merchant_management_01", suiItem = "@player_structure:shop_sign1"},
			{templateFile = "object/tangible/sign/player/shop_sign_s02.iff", x = 7.0, z = 0.8, y = 6.5, ox = 0, oy = 1, oz = 0, ow =  0, cellid = -1, containmentType = -1, requiredSkill = "crafting_merchant_management_02", suiItem = "@player_structure:shop_sign2"},
			{templateFile = "object/tangible/sign/player/shop_sign_s03.iff", x = 7.0, z = 0.8, y = 6.5, ox = 0, oy = 1, oz = 0, ow =  0, cellid = -1, containmentType = -1, requiredSkill = "crafting_merchant_management_03", suiItem = "@player_structure:shop_sign3"},
			{templateFile = "object/tangible/sign/player/shop_sign_s04.iff", x = 7.0, z = 0.8, y = 6.5, ox = 0, oy = 1, oz = 0, ow =  0, cellid = -1, containmentType = -1, requiredSkill = "crafting_merchant_management_04", suiItem = "@player_structure:shop_sign4"},			
			{templateFile = "object/tangible/tcg/series5/house_sign_tcg_standing.iff", x = 7.0, z = 0.8, y = 6.5, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "crafting_merchant_management_01", suiItem = "Flashing Standing Neon"},
			{templateFile = "object/tangible/tcg/series3/house_sign_tcg_s02.iff", x = 7.0, z = 0.8, y = 6.5, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "crafting_merchant_management_01", suiItem = "Flashing Standing Neon series 2"},
			{templateFile = "object/tangible/sign/player/efol_standing_sign_01.iff", x = 7.0, z = 0.8, y = 6.5, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "Ewok Festival of Love Standing Sign"},
			{templateFile = "object/tangible/sign/player/shop_sign_halloween_sign.iff", x = 7.0, z = 0.8, y = 6.5, ox = 0, oy = 0, oz = 0, ow = 1, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "Standing Halloween Sign"},
			{templateFile = "object/tangible/sign/player/imperial_empire_day_2009_sign_standing.iff", x = 7.0, z = 0.8, y = 6.5, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "Imperial Empire Day Standing Sign"},
			{templateFile = "object/tangible/sign/player/rebel_remembrance_day_2009_sign_standing.iff", x = 7.0, z = 0.8, y = 6.5, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "Alliance Remembrance Day Standing Sign"},
			{templateFile = "object/tangible/sign/player/pgc_sign_standing.iff", x = 7.0, z = 0.8, y = 6.5, ox = 0, oy = 0, oz = 0, ow = 1, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "Chronicle Master Standing Sign"},
			{templateFile = "object/tangible/sign/player/wod_sm_standing_sign_01.iff", x = 7.0, z = 0.8, y = 6.5, ox = 0, oy = 0, oz = 0, ow = 1, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "Witches of Dathomir Standing Sign"},
			{templateFile = "object/tangible/sign/player/wod_sm_banner_sign_01.iff", x = 7.0, z = 0.8, y = 6.5, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "Standing Banner: The Maiden"},
			{templateFile = "object/tangible/sign/player/wod_sm_banner_sign_02.iff", x = 7.0, z = 0.8, y = 6.5, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "Standing Banner: The Mother"},
			{templateFile = "object/tangible/sign/player/wod_sm_banner_sign_03.iff", x = 7.0, z = 0.8, y = 6.5, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "Standing Banner: The Crone"},
	}
	
}

ObjectTemplates:addTemplate(object_building_player_tree_house, "object/building/player/tree_house.iff")
