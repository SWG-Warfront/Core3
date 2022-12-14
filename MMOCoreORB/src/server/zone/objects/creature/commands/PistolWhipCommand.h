/*
Copyright (C) 2007 <SWGEmu>

This File is part of Core3.

This program is free software; you can redistribute
it and/or modify it under the terms of the GNU Lesser
General Public License as published by the Free Software
Foundation; either version 2 of the License,
or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Lesser General Public License for
more details.

You should have received a copy of the GNU Lesser General
Public License along with this program; if not, write to
the Free Software Foundation, Inc., 52 Franklin St, Fifth Floor, Boston, MA 02220-2302 USA

Linking Engine3 statically or dynamically with other modules
is making a combined work based on Engine3.
Thus, the terms and conditions of the GNU Lesser General Public License
cover the whole combination.

In addition, as a special exception, the copyright holders of Engine3
give you permission to combine Engine3 program with free software
programs or libraries that are released under the GNU LGPL and with
code included in the standard release of Core3 under the GNU LGPL
license (or modified versions of such code, with unchanged license).
You may copy and distribute such a system following the terms of the
GNU LGPL for Engine3 and the licenses of the other code concerned,
provided that you include the source code of that other code when
and as the GNU LGPL requires distribution of source code.

Note that people who make modified versions of Engine3 are not obligated
to grant this special exception for their modified versions;
it is their choice whether to do so. The GNU Lesser General Public License
gives permission to release a modified version without this exception;
this exception also makes it possible to release a modified version
which carries forward this exception.
*/

#ifndef PISTOLWHIPCOMMAND_H_
#define PISTOLWHIPCOMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "CombatQueueCommand.h"
#include "server/zone/packets/player/PlayMusicMessage.h"
#include "server/zone/objects/creature/buffs/SingleUseBuff.h"


class PistolWhipCommand : public CombatQueueCommand {
public:

	PistolWhipCommand(const String& name, ZoneProcessServer* server)
		: CombatQueueCommand(name, server) { 

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;
		
		ManagedReference<WeaponObject*> weapon = creature->getWeapon();
	
		if (!weapon->isRangedWeapon()) {
			return INVALIDWEAPON;
		}

		// Fail if target is not a player...
		ManagedReference<SceneObject*> object = server->getZoneServer()->getObject(target);

		if (object == nullptr || !object->isCreatureObject())
			return INVALIDTARGET;

		CreatureObject* creatureTarget = cast<CreatureObject*>( object.get());
		PlayerManager* playerManager = server->getPlayerManager();

		if (creature != creatureTarget && !CollisionManager::checkLineOfSight(creature, creatureTarget)) {
			creature->sendSystemMessage("@cbt_spam:los_recycle"); // You cannot see your target. 
			return INVALIDTARGET;
		}

		if (!creature->checkCooldownRecovery("pistolwhip")) {
			StringIdChatParameter stringId;

			const Time* cdTime = creature->getCooldownTime("pistolwhip");

			// Returns -time. Multiple by -1 to return positive.
			int timeLeft = floor((float)cdTime->miliDifference() / 1000) *-1;

			stringId.setStringId("@cbt_spam:cooldown_ability_message"); // You must wait %DI seconds before using %TU again.
			stringId.setDI(timeLeft);
			stringId.setTU("Pistol Whip");
			creature->sendSystemMessage(stringId);

			return GENERALERROR;
		}

		if (creatureTarget == nullptr)
			return INVALIDTARGET;

		Locker clocker(creatureTarget, creature);

		ManagedReference<PlayerObject*> targetGhost = creatureTarget->getPlayerObject();
		ManagedReference<PlayerObject*> playerObject = creature->getPlayerObject();

		if (targetGhost == nullptr || playerObject == nullptr)
			return GENERALERROR;

		if (creature->getDistanceTo(creatureTarget) > 10.f){
			creature->sendSystemMessage("@cbt_spam:target_out_of_range"); // You are out of range of your target.
			return GENERALERROR;}

		if (creatureTarget->isRidingMount()) {
			creature->sendSystemMessage("@error_message:target_mounted_invalid"); // You cannot use this attack on a mounted target. 
			return GENERALERROR;
		}

		
		if (object->isCreatureObject() && creatureTarget->isAttackableBy(creature)) {
			creatureTarget->setSnaredState(5);
			creatureTarget->playEffect("clienteffect/sm_pistol_whip.cef", "");
			creatureTarget->inflictDamage(creatureTarget, CreatureAttribute::HEALTH, 300 + System::random(300), true);
			creatureTarget->sendSystemMessage("You have been rooted");
			creature->addCooldown("pistolwhip", 30 * 1000);
		}

		uint32 buffCRC = BuffCRC::FORCE_RANK_SUFFERING; //DURATION
		int duration = 10;
		int loopCount = ((duration/9)-1);
		ManagedReference<SingleUseBuff*> buff = new SingleUseBuff(creatureTarget, buffCRC, duration, BuffType::JEDI, getNameCRC());
		
		 if (!creature->hasBuff(buffCRC)) {
			Locker locker(buff);
			buff->setSpeedMultiplierMod(0.01f);
			creatureTarget->addBuff(buff);
		}

		return doCombatAction(creature, target);
	}

};

#endif //PISTOLWHIPCOMMAND_H_
