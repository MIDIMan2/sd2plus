// Sonic Doom 2 - BFG9000

// TODO: Override TryPickup to make this slightly less hacky
class SD2BFG9000 : BFG9000 replaces BFG9000
{
	override void AttachToOwner(Actor other)
	{
		let newClass = "BFG9000";
		if (other != NULL)
		{
			if (other is "SD2SonicPlayer")
				newClass = "SD2SonicBFG9000";
		}
		Super.AttachToOwner(other);
		Weapon newWeapon = Weapon(Spawn(newClass));
		newWeapon.AmmoGive1 = 0;
		newWeapon.AmmoGive2 = 0;
		newWeapon.AttachToOwner(other);
	}
}

class SD2SonicBFG9000 : BFG9000
{
    Default
	{
		Inventory.RestrictedTo "SD2SonicPlayer";
	}

    States
    {
        Fire:
            BFGG A 5 A_BFGsound;
            BFGG B 10 A_GunFlash;
            BFGG B 10 A_FireBFG;
            BFGG B 20 A_ReFire;
            Goto Ready;
        Flash:
            BFGF A 5 Bright A_Light1;
            BFGF B 6 Bright A_Light2;
            Goto LightDone;
    }
}
