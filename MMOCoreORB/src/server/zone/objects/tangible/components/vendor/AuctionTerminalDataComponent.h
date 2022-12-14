/*
 * AuctionTerminalDataComponent.h
 *
 *  Created on: 5/27/2012
 *      Author: kyle
 */

#ifndef AUCTIONTERMINALDATACOMPONENT_H_
#define AUCTIONTERMINALDATACOMPONENT_H_

#include "server/zone/objects/scene/components/DataObjectComponent.h"
#include "server/zone/managers/auction/AuctionManager.h"
#include "server/zone/objects/region/CityRegion.h"
#include "server/zone/Zone.h"

class AuctionTerminalDataComponent : public DataObjectComponent {
protected:

	ManagedWeakReference<AuctionManager*> auctionMan;
	SerializableString uid;

public:
	AuctionTerminalDataComponent() {
		uid = "";
		addSerializableVariables();
	}

	virtual ~AuctionTerminalDataComponent() {

	}

	void writeJSON(nlohmann::json& j) const {
		DataObjectComponent::writeJSON(j);

		SERIALIZE_JSON_MEMBER(uid);
	}

	void initializeTransientMembers() {
		ManagedReference<SceneObject*> strongParent = parent.get();
		if(strongParent != nullptr && strongParent->getZoneServer() != nullptr) {
			auctionMan = strongParent->getZoneServer()->getAuctionManager();
			if(uid.isEmpty())
				updateUID();
		}
	}

	void updateUID() {
		ManagedReference<SceneObject*> strongParent = parent.get();
		ManagedReference<AuctionManager*> auctionManager = auctionMan.get();

		if(auctionManager == nullptr || strongParent == nullptr || strongParent->getZone() == nullptr)
			return;

		String olduid = uid;

		uid = strongParent->getZone()->getZoneName() + ".";

		String region = "@planet_n:" + strongParent->getZone()->getZoneName();
		ManagedReference<CityRegion*> cityRegion = strongParent->getCityRegion().get();
		if(cityRegion != nullptr)
			region = cityRegion->getCityRegionName();

		uid += region + "." + strongParent->getDisplayedName() + ".";
		uid += String::valueOf(strongParent->getObjectID()) + "#";
		uid += String::valueOf(((int)strongParent->getWorldPositionX())) + "," + String::valueOf(((int)strongParent->getWorldPositionY()));

		if(olduid != uid)
			auctionManager->updateVendorUID(strongParent, olduid, uid);
	}

	String getUID() {
		return uid;
	}

	bool isAuctionTerminalData() {
		return true;
	}

private:
	void addSerializableVariables() {
		addSerializableVariable("uid", &uid);
	}
};


#endif /* AUCTIONTERMINALDATACOMPONENT_H_ */
