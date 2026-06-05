// Sonic Doom 2 - Super Shotgun

class SD2SuperShotgun : SD2Weapon replaces SuperShotgun
{
    Default
	{
	    Weapon.SelectionOrder 400;
		Weapon.AmmoUse 2;
		Weapon.AmmoGive 8;
		Weapon.AmmoType "Shell";
		Inventory.PickupMessage "$GOTSHOTGUN2";
		Obituary "$OB_MPSSHOTGUN";
		Tag "$TAG_SUPERSHOTGUN";
        SD2Weapon.BaseClass "SD2SuperShotgun";
	}

	States
	{
        Ready:
            SHT2 A 1 A_WeaponReady;
            Loop;
        Deselect:
            SHT2 A 1 A_Lower;
            Loop;
        Select:
            SHT2 A 1 A_Raise;
            Loop;
        Fire:
            SHT2 A 3;
            SHT2 A 7 A_FireShotgun2;
            SHT2 B 7;
            SHT2 C 7 A_CheckReload;
            SHT2 D 7 A_OpenShotgun2;
            SHT2 E 7;
            SHT2 F 7 A_LoadShotgun2;
            SHT2 G 6;
            SHT2 H 6 A_CloseShotgun2;
            SHT2 A 5 A_ReFire;
            Goto Ready;
        // unused states
            SHT2 B 7;
            SHT2 A 3;
            Goto Deselect;
        Flash:
            SHT2 I 4 Bright A_Light1;
            SHT2 J 3 Bright A_Light2;
            Goto LightDone;
        Spawn:
            SGN2 A -1;
            Stop;
    }

    override void BeginPlay()
	{
        Super.BeginPlay();
		charToWeapon.Insert("SD2SonicPlayer", "SD2SonicSuperShotgun");
	}
}

class SD2SonicSuperShotgun : SD2SuperShotgun
{
    States
    {
        Ready:
            SH2S A 1 A_WeaponReady;
            Loop;
        Deselect:
            SH2S A 1 A_Lower;
            Loop;
        Select:
            SH2S A 1 A_Raise;
            Loop;
        Fire:
            SH2S A 1;
            SH2S A 1 A_FireShotgun2;
            SH2S B 1;
            SH2S C 1 A_CheckReload;
            SH2S D 1 A_OpenShotgun2;
            SH2S E 1;
            SH2S F 1 A_LoadShotgun2;
            SH2S G 1;
            SH2S H 1 A_CloseShotgun2;
            SH2S A 1 A_ReFire;
            Goto Ready;
        Flash:
            SHT2 I 1 Bright A_Light1;
            SHT2 J 1 Bright A_Light2;
            Goto LightDone;
    }
}
