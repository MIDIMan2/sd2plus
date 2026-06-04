// Sonic Doom 2 - Rocket Launcher

// TODO: Override TryPickup to make this slightly less hacky
class SD2RocketLauncher : RocketLauncher replaces RocketLauncher
{
	override void AttachToOwner(Actor other)
	{
		let newClass = "RocketLauncher";
		if (other != NULL)
		{
			if (other is "SD2SonicPlayer")
				newClass = "SD2SonicRocketLauncher";
		}
		Super.AttachToOwner(other);
		Weapon newWeapon = Weapon(Spawn(newClass));
		newWeapon.AmmoGive1 = 0;
		newWeapon.AmmoGive2 = 0;
		newWeapon.AttachToOwner(other);
	}
}

class SD2SonicRocketLauncher : RocketLauncher
{
    Default
	{
		Inventory.RestrictedTo "SD2SonicPlayer";
	}

    States
    {
        Fire:
            MISG B 1 A_GunFlash;
            MISG B 12 A_FireMissile;
            MISG B 0 A_ReFire;
            Goto Ready;
        Flash:
            MISF A 1 Bright A_Light1;
            MISF B 4 Bright;
            MISF CD 4 Bright A_Light2;
            Goto LightDone;
    }
}
