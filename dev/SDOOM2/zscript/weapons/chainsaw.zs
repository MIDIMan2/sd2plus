// Sonic Doom 2 - Chainsaw

// TODO: Override TryPickup to make this slightly less hacky
class SD2Chainsaw : Chainsaw replaces Chainsaw
{
	override void AttachToOwner(Actor other)
	{
		let newClass = "Chainsaw";
		if (other != NULL)
		{
			if (other is "SD2SonicPlayer")
				newClass = "SD2SonicChainsaw";
			else if (other is "SD2TailsPlayer")
				newClass = "SD2TailsChainsaw";
			else if (other is "SD2KnuxPlayer")
				newClass = "SD2KnuxChainsaw";
		}
		Super.AttachToOwner(other);
		Weapon newWeapon = Weapon(Spawn(newClass));
		newWeapon.AmmoGive1 = 0;
		newWeapon.AmmoGive2 = 0;
		newWeapon.AttachToOwner(other);
	}
}

class SD2SonicChainsaw : Chainsaw
{
	Default
	{
		Inventory.RestrictedTo "SD2SonicPlayer";
	}

	States
	{
		Ready:
			SAWG C 1 A_WeaponReady;
			SAWG D 4 A_WeaponReady;
			Loop;
		Deselect:
			SAWG C 1 A_Lower;
			Loop;
		Select:
			SAWG C 1 A_Raise;
			Loop;
		Fire:
			SAWG A 1 A_Saw;
			SAWG B 4 A_Saw;
			SAWG B 0 A_ReFire;
			Goto Ready;
	}
}

class SD2TailsChainsaw : Chainsaw
{
	Default
	{
		Inventory.RestrictedTo "SD2TailsPlayer";
	}

	States
	{
		Ready:
			SAWT CD 4 A_WeaponReady;
			Loop;
		Deselect:
			SAWT C 1 A_Lower;
			Loop;
		Select:
			SAWT C 1 A_Raise;
			Loop;
		Fire:
			SAWT AB 4 A_Saw;
			SAWT B 0 A_ReFire;
			Goto Ready;
	}
}

class SD2KnuxChainsaw : Chainsaw
{
	Default
	{
		Inventory.RestrictedTo "SD2KnuxPlayer";
	}

	States
	{
		Ready:
			SAWK CD 4 A_WeaponReady;
			Loop;
		Deselect:
			SAWK C 1 A_Lower;
			Loop;
		Select:
			SAWK C 1 A_Raise;
			Loop;
		Fire:
			SAWK AB 4 A_Saw;
			SAWK B 0 A_ReFire;
			Goto Ready;
	}
}
