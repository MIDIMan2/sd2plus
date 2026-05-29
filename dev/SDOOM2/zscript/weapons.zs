// Sonic Doom 2 - Weapons

#include "zscript/weapons/chainsaw.zs"
// #include "zscript/weapons/fist.zs"
// #include "zscript/weapons/pistol.zs"
// #include "zscript/weapons/shotgun.zs"
// #include "zscript/weapons/supershotgun.zs"
// #include "zscript/weapons/chaingun.zs"
// #include "zscript/weapons/rocketlauncher.zs"
// #include "zscript/weapons/plasmarifle.zs"
// #include "zscript/weapons/bfg9000.zs"

class SD2Backpack : Backpack replaces Backpack
{
	// Figure out why this sometimes doesn't work
	override bool HandlePickup(Inventory item)
	{
		let sd2p = SD2Player(Owner);
		if (sd2p != null)
		{
			sd2p.SD2SetAmmoCapacity(2);
		}
		return super.HandlePickup(item);
	}
// 	override bool HandlePickup(Inventory item)
// 	{
// 		// Since you already have a backpack, that means you already have every
// 		// kind of ammo in your inventory, so we don't need to look at the
// 		// entire PClass list to discover what kinds of ammo exist, and we don't
// 		// have to alter the MaxAmount either.
// 		if (item is 'BackpackItem')
// 		{
// 			for (let probe = Owner.Inv; probe != NULL; probe = probe.Inv)
// 			{
// 				let ammoitem = Ammo(probe);

// 				if (ammoitem && ammoitem.GetParentAmmo() == ammoitem.GetClass())
// 				{
// 					if (ammoitem.Amount < ammoitem.MaxAmount || sv_unlimited_pickup)
// 					{
// 						int amount = ammoitem.Default.BackpackAmount;
// 						let sd2p = SD2Player(Owner);
// 						if (sd2p != null)
// 						{
// 							amount = sd2p.SD2GetAmmoCapacity(ammoitem);
// 						}
// 						Console.PrintF("%d", amount);
// 						// extra ammo in baby mode and nightmare mode
// 						if (!bIgnoreSkill)
// 						{
// 							amount = int(amount * (G_SkillPropertyFloat(SKILLP_AmmoFactor) * sv_ammofactor));
// 						}
// 						ammoitem.Amount += amount;
// 						if (ammoitem.Amount > ammoitem.MaxAmount && !sv_unlimited_pickup)
// 						{
// 							ammoitem.Amount = ammoitem.MaxAmount;
// 						}
// 					}
// 				}
// 			}
// 			// The pickup always succeeds, even if you didn't get anything
// 			item.bPickupGood = true;
// 			return true;
// 		}
// 		return false;
// 	}
}
