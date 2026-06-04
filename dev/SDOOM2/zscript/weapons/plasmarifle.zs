// Sonic Doom 2 - Plasma Rifle

// TODO: Override TryPickup to make this slightly less hacky
class SD2PlasmaRifle : PlasmaRifle replaces PlasmaRifle
{
    override void AttachToOwner(Actor other)
	{
		let newClass = "PlasmaRifle";
		if (other != NULL)
		{
			if (other is "SD2SonicPlayer")
				newClass = "SD2SonicPlasmaRifle";
            else if (other is "SD2MechaPlayer")
                newClass = "SD2MechaPlasmaRifle";
		}
		Super.AttachToOwner(other);
		Weapon newWeapon = Weapon(Spawn(newClass));
		newWeapon.AmmoGive1 = 0;
		newWeapon.AmmoGive2 = 0;
		newWeapon.AttachToOwner(other);
	}
}

class SD2SonicPlasmaRifle : PlasmaRifle
{
    Default
	{
		Inventory.RestrictedTo "SD2SonicPlayer";
	}

    States
    {
        Fire:
            PLSG A 1 A_FirePlasma;
            PLSG B 1 A_ReFire;
            Goto Ready;
        Flash:
            PLSF A 1 Bright A_Light1;
            Goto LightDone;
            PLSF B 1 Bright A_Light1;
            Goto LightDone;
    }
}

class SD2MechaPlasmaRifle : PlasmaRifle
{
    Default
	{
		Inventory.RestrictedTo "SD2MechaPlayer";
	}

    States
    {
        Ready:
            PLMG A 1 A_WeaponReady;
            Loop;
        Deselect:
            PLMG A 1 A_Lower;
            Loop;
        Select:
            PLMG A 1 A_Raise;
            Loop;
        Fire:
            PLMG A 3 A_FirePlasma;
            PLMG B 20 A_ReFire;
            Goto Ready;
        Flash:
            PLMF A 4 Bright A_Light1;
            Goto LightDone;
            PLMF B 4 Bright A_Light1;
            Goto LightDone;
    }
}
