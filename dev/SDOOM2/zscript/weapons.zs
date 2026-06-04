// Sonic Doom 2 - Weapons

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
