// Sonic Doom 2 - Shotgun

// TODO: Override TryPickup to make this slightly less hacky
class SD2Shotgun : Shotgun replaces Shotgun
{
	override void AttachToOwner(Actor other)
	{
		let newShotgunClass = "Shotgun";
		if (other != NULL)
		{
			if (other is "SD2SonicPlayer")
			{
				newShotgunClass = "SD2SonicShotgun";
			}
			else if (other is "SD2KnuxPlayer")
			{
				newShotgunClass = "SD2KnuxShotgun";
			}
		}
		Super.AttachToOwner(other);
		Weapon newShotgun = Weapon(Spawn(newShotgunClass));
		newShotgun.AmmoGive1 = 0;
		newShotgun.AmmoGive2 = 0;
		newShotgun.AttachToOwner(other);
	}
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
