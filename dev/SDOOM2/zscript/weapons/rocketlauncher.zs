// Sonic Doom 2 - Rocket Launcher

class SD2RocketLauncher : SD2Weapon replaces RocketLauncher
{
	Default
	{
		Weapon.SelectionOrder 2500;
		Weapon.AmmoUse 1;
		Weapon.AmmoGive 2;
		Weapon.AmmoType "RocketAmmo";
		+WEAPON.NOAUTOFIRE
		+WEAPON.EXPLOSIVE
		Inventory.PickupMessage "$GOTLAUNCHER";
		Tag "$TAG_ROCKETLAUNCHER";
		SD2Weapon.BaseClass "SD2RocketLauncher";
	}

	States
	{
		Ready:
			MISG A 1 A_WeaponReady;
			Loop;
		Deselect:
			MISG A 1 A_Lower;
			Loop;
		Select:
			MISG A 1 A_Raise;
			Loop;
		Fire:
			MISG B 8 A_GunFlash;
			MISG B 12 A_FireMissile;
			MISG B 0 A_ReFire;
			Goto Ready;
		Flash:
			MISF A 3 Bright A_Light1;
			MISF B 4 Bright;
			MISF CD 4 Bright A_Light2;
			Goto LightDone;
		Spawn:
			LAUN A -1;
			Stop;
	}

	override void BeginPlay()
	{
		charToWeapon.Insert("SD2SonicPlayer", "SD2SonicRocketLauncher");
	}
}

class SD2SonicRocketLauncher : SD2RocketLauncher
{
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
