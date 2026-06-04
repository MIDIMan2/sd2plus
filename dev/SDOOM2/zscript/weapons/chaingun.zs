// Sonic Doom 2 - Chaingun

// TODO: Override TryPickup to make this slightly less hacky
class SD2Chaingun : Chaingun replaces Chaingun
{
    override void AttachToOwner(Actor other)
	{
		let newClass = "Chaingun";
		if (other != NULL)
		{
			if (other is "SD2SonicPlayer")
				newClass = "SD2SonicChaingun";
            else if (other is "SD2MechaPlayer")
                newClass = "SD2MechaChaingun";
		}
		Super.AttachToOwner(other);
		Weapon newWeapon = Weapon(Spawn(newClass));
		newWeapon.AmmoGive1 = 0;
		newWeapon.AmmoGive2 = 0;
		newWeapon.AttachToOwner(other);
	}
}

class SD2SonicChaingun : Chaingun
{
    Default
	{
		Inventory.RestrictedTo "SD2SonicPlayer";
	}

    States
    {
        Fire:
            CHGG A 1 A_FireCGun;
            CHGG B 4 A_FireCGun;
            CHGG B 0 A_ReFire;
            Goto Ready;
        Flash:
            CHGF A 1 Bright A_Light1;
            Goto LightDone;
            CHGF B 5 Bright A_Light2;
            Goto LightDone;
    }
}

class SD2MechaChaingun : Chaingun
{
    Default
	{
		Inventory.RestrictedTo "SD2MechaPlayer";
	}

    States
    {
        Ready:
            CHMG A 1 A_WeaponReady;
            Loop;
        Deselect:
            CHMG A 1 A_Lower;
            Loop;
        Select:
            CHMG A 1 A_Raise;
            Loop;
        Fire:
            CHMG AB 4 A_FireCGun;
            CHMG B 0 A_ReFire;
            Goto Ready;
        Flash:
            CHMF A 1 Bright A_Light1;
            Goto LightDone;
            CHGF B 5 Bright A_Light2;
            Goto LightDone;
    }
}
