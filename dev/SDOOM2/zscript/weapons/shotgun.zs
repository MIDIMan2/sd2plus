// Sonic Doom 2 - Shotgun

// TODO: Figure out how to prevent players from picking this up if they have max ammo
class SD2Shotgun : Shotgun replaces Shotgun
{
	override Inventory CreateCopy(Actor other)
	{
		Inventory copy;

		if (!IsCreatingLocalCopy())
			Amount = MIN(Amount, MaxAmount);
		if (GoAway())
		{
			copy = Inventory(Spawn(GetClass()));
			copy.Amount = Amount;
			copy.MaxAmount = MaxAmount;
		}
		else
		{
			copy = self;
		}

		Weapon copy2 = Weapon(copy);
		if (copy2 != self && copy2 != null)
		{
			copy2.AmmoGive1 = AmmoGive1;
			copy2.AmmoGive2 = AmmoGive2;
		}
		Console.PrintF(copy2.GetClassName());
		return copy2;
	}
	
	// States
	// {
	// 	Pickup:
	// 		SHOT A 0 {
	// 			if (self is "SD2SonicPlayer")
	// 			{
	// 				A_GiveInventory("SD2SonicShotgun");
	// 			}
	// 			else if (self is "SD2KnuxPlayer")
	// 			{
	// 				A_GiveInventory("SD2KnuxShotgun");
	// 			}
	// 			else
	// 			{
	// 				A_GiveInventory("Shotgun");
	// 			}
	// 		}
	// 		Stop;
	// 	Spawn:
	// 		SHOT A -1;
	// 		Stop;
	// }
}

class SD2SonicShotgun : Shotgun
{
	Default
	{
		Inventory.RestrictedTo "SD2SonicPlayer";
	}
	
	States
	{
		Fire:
			SHTG A 1;
			SHTG A 1 A_FireShotgun;
			SHTG BCDCBA 1;
			SHTG A 1 A_ReFire;
			Goto Ready;
		Flash:
			SHTF A 1 Bright A_Light1;
			SHTF B 1 Bright A_Light2;
			Goto LightDone;
	}
}

class SD2KnuxShotgun : Shotgun
{
	Default
	{
		Inventory.RestrictedTo "SD2KnuxPlayer";
	}
	
	States
	{
		Ready:
			SHTK A 1 A_WeaponReady;
			Loop;
		Deselect:
			SHTK A 1 A_Lower;
			Loop;
		Select:
			SHTK A 1 A_Raise;
			Loop;
		Fire:
			SHTK A 3;
			SHTK A 7 A_FireShotgun;
			SHTK BC 5;
			SHTK D 4;
			SHTK CB 5;
			SHTK A 3;
			SHTK A 7 A_ReFire;
			Goto Ready;
	}
}
