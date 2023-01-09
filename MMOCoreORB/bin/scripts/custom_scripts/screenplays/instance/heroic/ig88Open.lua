local sheildBoss = function(pBoss)
		print("SheildBoss function running",pBoss)
		CreatureObject(pBoss):playEffect("clienteffect/bh_shields_effect.cef", "")
		CreatureObject(pBoss):playEffect("clienteffect/commando_position_secured.cef", "");
						         --crc,amount,duration,bufftype,    attribute, absorbtion
		--CreatureObject(pBoss):buffCharacter(0xF626F40F,    60,      30,       6,"force_armor",          0)
end
ig88Open = ScreenPlay:new {
	instance = "ig88Open",
	--leashDistance = 75, --not needed for this screenplay, commented to save power
	phases = {
		[1] = {
			damageLimit = 0.9, --%value of max H,A,M
			taunt = "Enemy Survival Chance = 87%",
			spawns = {		--t	x    z      y    f  c
				{"ig_battle_droid", -20.0, 0.0,  43.2, 177, 1},
				{"ig_battle_droid",  20.0, 0.0,  43.2, 177, 1},
				{"ig_battle_droid",  20.0, 0.0, -23.0,   0, 1},
				{"ig_battle_droid", -20.0, 0.0, -23.0,   0, 1},
				spawnTaunts = {"Target found Sir!", "Rodger, Rodger!", "Locating Target..", "Target Locked Sir!"},
			},
			--script = sheildBoss,
			--false, --not needed for this screenplay, commented to save power --TODO add functionality for this
		},
		[2] = {
			damageLimit = 0.7, --%value of max H,A,M
			taunt = "Enemy Survival Chance = 73%",
			spawns = {	   --t	    x    z      y    f  c
				{"ig_droideka",	-20.0, 0.0,  43.2, 177, 1},
				{"ig_droideka",  20.0, 0.0,  43.2, 177, 1},
				{"ig_droideka",  20.0, 0.0, -23.0,   0, 1},
				{"ig_droideka", -20.0, 0.0, -23.0,   0, 1},
				spawnTaunts = {"Target Found!", "Locating Target..", "Target Locked."},
			},
		},
		[4] = {
			damageLimit = 0.6, --%value of max H,A,M
			taunt = "Enemy Survival Chance = 53%",
			spawns = {	   --t	    x    z      y    f  c
				{"ig_droideka",	-20.0, 0.0,  43.2, 177, 1},
				{"ig_droideka",  20.0, 0.0,  43.2, 177, 1},
				{"ig_droideka",  20.0, 0.0, -23.0,   0, 1},
				{"ig_droideka", -20.0, 0.0, -23.0,   0, 1},
				spawnTaunts = {"Target Found!", "Enemy Identified!", "Locating Target..", "Target Locked."},
			},
		},
		[8] = {
			damageLimit = 0.5, --%value of max H,A,M
			taunt = "Enemy Survival Chance = 42%",
			spawns = {	   --t	    x    z      y    f  c
				{"ig_droideka",	-20.0, 0.0,  43.2, 177, 1},
				{"ig_droideka",  20.0, 0.0,  43.2, 177, 1},
				{"ig_droideka",  20.0, 0.0, -23.0,   0, 1},
				{"ig_droideka", -20.0, 0.0, -23.0,   0, 1},
				spawnTaunts = {"Destroy them!", "Enemy Identified!", "Target Pending..", "Target verified."},
			},
		},
		[16] = {
			damageLimit = 0.4, --%value of max H,A,M
			taunt = "Enemy Survival Chance = 17%",
			spawns = {		     --t      x    z     y    f  c
				{"ig_elite_battle_droid", -13.0, 0.0, 10.0, 177, 1},
				{"ig_elite_battle_droid",  13.0, 0.0, 10.0, 177, 1},
				spawnTaunts = {"Bio-Organism Identified!", "Enemy Locked!", "Command invoked..", "Target Identified."},
			},
		},
		[32] = {
			damageLimit = 0.01, --%value of max H,A,M
			taunt = "ERROR COMMAND SYSTEM OFFLINE tokenizer = incomplete type, index = -1, delimeter = incomplete type command = incomplete type fullCommand = incomplete type arguments = incomplete type Core::run Core 21 No locals.",
		},
	},
}
registerScreenPlay("ig88Open", false)

--------------------------------------
--   Initialize screenplay           -
--------------------------------------
function ig88Open:start(pBuilding)
	print("ig 88 Open ScreenPlay Started",pBuilding)
	self:spawnMobiles(pBuilding)
end
--Spawn Initial Mobiles
function ig88Open:spawnMobiles(pBuilding)
	local bID = SceneObject(pBuilding):getObjectID()
	local zone = SceneObject(getSceneObject(bID)):getZoneName()
	local pTrigger = spawnMobile(zone, "ig_mouse_droid", 0, 0, 0, 0, -99, bID+1)
        createObserver(OBJECTDESTRUCTION, "ig88Open", "notifyTriggerDead", pTrigger)
	return 0
end
--Trigger Death Event
function ig88Open:notifyTriggerDead(pTrigger, pPlayer)
	local pBuilding = Ihelp:getBuilding(pTrigger)
	local zone = SceneObject(pBuilding):getZoneName()
	local bID = SceneObject(pBuilding):getObjectID()
        local pBoss = spawnMobile(zone, "ig88_npc_boss", 0, 0, 0, -18, 0, bID+1)
	spatialChat(pBoss, "Intruder Alert Activating Defense Systems")	
	createObserver(DAMAGERECEIVED,"Ihelp","boss_damage", pBoss)
	createObserver(OBJECTDESTRUCTION, "ig88Open", "notifyBossDead", pBoss)
	createEvent(1800000, "Ihelp", "despawnBoss", pBoss,"")--Boss Despawn Timer
	return 0
end
--Boss Death Event
function ig88Open:notifyBossDead(pBoss, pPlayer)
	local pBuilding = Ihelp:getBuilding(pBoss)
	ig88Open:resetScreenplayStatus(pBuilding)
	return 0
end
--Reset Instance Screenplay
function ig88Open:resetScreenplayStatus(pBuilding)
	createEvent(6000, "Ihelp", "despawnAdds", pBuilding, "")
	createEvent(3600000, "ig88Open","spawnMobiles", pBuilding, "")--Trigger Respawn Timer
	return 0	
end
