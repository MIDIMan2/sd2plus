// Sonic Doom 2 - BFG9000

class SD2BFG9000 : SD2Weapon replaces BFG9000
{
	Default
	{
		Height 20;
		Weapon.SelectionOrder 2800;
		Weapon.AmmoUse 40;
		Weapon.AmmoGive 40;
		Weapon.AmmoType "Cell";
		+WEAPON.NOAUTOFIRE;
		+WEAPON.BFG;
		Inventory.PickupMessage "$GOTBFG9000";
		Tag "$TAG_BFG9000";
		SD2Weapon.BaseClass "SD2BFG9000";
	}

	States
	{
		Ready:
			BFGG A 1 A_WeaponReady;
			Loop;
		Deselect:
			BFGG A 1 A_Lower;
			Loop;
		Select:
			BFGG A 1 A_Raise;
			Loop;
		Fire:
			BFGG A 20 A_BFGsound;
			BFGG B 10 A_GunFlash;
			BFGG B 10 A_FireBFG;
			BFGG B 20 A_ReFire;
			Goto Ready;
		Flash:
			BFGF A 11 Bright A_Light1;
			BFGF B 6 Bright A_Light2;
			Goto LightDone;
		Spawn:
			BFUG A -1;
			Stop;
		OldFire:
			BFGG A 10 A_BFGsound;
			BFGG BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB 1 A_FireOldBFG;
			BFGG B 0 A_Light0;
			BFGG B 20 A_ReFire;
			Goto Ready;
	}

	override void BeginPlay()
	{
		Super.BeginPlay();
		charToWeapon.Insert("SD2SonicPlayer", "SD2SonicBFG9000");
	}
}

class SD2SonicBFG9000 : SD2BFG9000
{
    States
    {
		Ready:
			BFGS A 1 A_WeaponReady;
			Loop;
		Deselect:
			BFGS A 1 A_Lower;
			Loop;
		Select:
			BFGS A 1 A_Raise;
			Loop;
        Fire:
            BFGS A 5 A_BFGsound;
            BFGS B 10 A_GunFlash;
            BFGS B 10 A_FireBFG;
            BFGS B 20 A_ReFire;
            Goto Ready;
        Flash:
            BFGF A 5 Bright A_Light1;
            BFGF B 6 Bright A_Light2;
            Goto LightDone;
    }
}
