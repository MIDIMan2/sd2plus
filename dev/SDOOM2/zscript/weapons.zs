// Sonic Doom 2 - Weapons

class SD2Weapon : Weapon
{
    Map<string, string> charToWeapon;
    string baseClass;
    property BaseClass: baseClass;

    Default
    {
        SD2Weapon.BaseClass "";
    }

    override void AttachToOwner(Actor other)
	{
		let newClass = baseClass;
		if (other != NULL)
		{
            string playerClass = other.GetClassName();
			if (charToWeapon.CheckKey(playerClass))
                newClass = charToWeapon.Get(playerClass);
		}
		if (GetClass() == newClass)
		{
			Super.AttachToOwner(other);
			return;
		}
		Weapon newWeapon = Weapon(Spawn(newClass));
        newWeapon.AmmoGive1 = self.AmmoGive1;
        newWeapon.AmmoGive2 = self.AmmoGive2;
		newWeapon.AttachToOwner(other);
		GoAwayAndDie();
	}

    override bool HandlePickup (Inventory item)
	{
        let sd2Weapon = SD2Weapon(item);
		// Allow any player to get ammo from this weapon if has the same BaseClass
		if (sd2Weapon != null && self.BaseClass == sd2Weapon.BaseClass)
		{
			if (Weapon(item).PickupForAmmo (self))
			{
				item.bPickupGood = true;
			}
			if (MaxAmount > 1) //[SP] If amount<maxamount do another pickup test of the weapon itself!
			{
				return Super.HandlePickup (item);
			}
			return true;
		}
		return Super.HandlePickup(item);
	}
}

// class SD2Weapon : Weapon replaces Weapon
// {
// 	override Inventory CreateCopy(Actor other)
// 	{
// 		Inventory copy;

// 		if (!IsCreatingLocalCopy())
// 			Amount = MIN(Amount, MaxAmount);
// 		if (GoAway())
// 		{
// 			copy = Inventory(Spawn("SD2KnuxShotgun"));
// 			copy.Amount = Amount;
// 			copy.MaxAmount = MaxAmount;
// 		}
// 		else
// 		{
// 			copy = self;
// 		}

// 		Weapon copy2 = Weapon(copy);
// 		if (copy2 != self && copy2 != null)
// 		{
// 			copy2.AmmoGive1 = AmmoGive1;
// 			copy2.AmmoGive2 = AmmoGive2;
// 		}
// 		return copy2;
// 	}
// }

#include "zscript/weapons/chainsaw.zs"
#include "zscript/weapons/fist.zs"
#include "zscript/weapons/pistol.zs"
#include "zscript/weapons/shotgun.zs"
#include "zscript/weapons/supershotgun.zs"
#include "zscript/weapons/chaingun.zs"
#include "zscript/weapons/rocketlauncher.zs"
#include "zscript/weapons/plasmarifle.zs"
#include "zscript/weapons/bfg9000.zs"
