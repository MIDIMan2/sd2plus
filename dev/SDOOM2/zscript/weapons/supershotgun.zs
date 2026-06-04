// Sonic Doom 2 - Super Shotgun

// TODO: Override TryPickup to make this slightly less hacky
class SD2SuperShotgun : SuperShotgun replaces SuperShotgun
{
	override void AttachToOwner(Actor other)
	{
		let newClass = "SuperShotgun";
		if (other != NULL)
		{
			if (other is "SD2SonicPlayer")
				newClass = "SD2SonicSuperShotgun";
		}
		Super.AttachToOwner(other);
		Weapon newWeapon = Weapon(Spawn(newClass));
		newWeapon.AmmoGive1 = 0;
		newWeapon.AmmoGive2 = 0;
		newWeapon.AttachToOwner(other);
	}
}

class SD2SonicSuperShotgun : SuperShotgun
{
    Default
	{
		Inventory.RestrictedTo "SD2SonicPlayer";
	}

    States
    {
        Fire:
            SHT2 A 1;
            SHT2 A 1 A_FireShotgun2;
            SHT2 B 1;
            SHT2 C 1 A_CheckReload;
            SHT2 D 1 A_OpenShotgun2;
            SHT2 E 1;
            SHT2 F 1 A_LoadShotgun2;
            SHT2 G 1;
            SHT2 H 1 A_CloseShotgun2;
            SHT2 A 1 A_ReFire;
            Goto Ready;
        Flash:
            SHT2 I 1 Bright A_Light1;
            SHT2 J 1 Bright A_Light2;
            Goto LightDone;
    }
}
