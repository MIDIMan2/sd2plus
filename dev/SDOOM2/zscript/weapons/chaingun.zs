// Sonic Doom 2 - Chaingun

class SD2Chaingun : SD2Weapon replaces Chaingun
{
    Default
	{
		Weapon.SelectionOrder 700;
		Weapon.AmmoUse 1;
		Weapon.AmmoGive 20;
		Weapon.AmmoType "Clip";
		Inventory.PickupMessage "$GOTCHAINGUN";
		Obituary "$OB_MPCHAINGUN";
		Tag "$TAG_CHAINGUN";
        SD2Weapon.BaseClass "SD2Chaingun";
	}

	States
	{
        Ready:
            CHGG A 1 A_WeaponReady;
            Loop;
        Deselect:
            CHGG A 1 A_Lower;
            Loop;
        Select:
            CHGG A 1 A_Raise;
            Loop;
        Fire:
            CHGG AB 4 A_FireCGun;
            CHGG B 0 A_ReFire;
            Goto Ready;
        Flash:
            CHGF A 5 Bright A_Light1;
            Goto LightDone;
            CHGF B 5 Bright A_Light2;
            Goto LightDone;
        Spawn:
            MGUN A -1;
            Stop;
	}

    override void BeginPlay()
	{
		charToWeapon.Insert("SD2SonicPlayer", "SD2SonicChaingun");
		charToWeapon.Insert("SD2MechaPlayer", "SD2MechaChaingun");
	}
}

class SD2SonicChaingun : SD2Chaingun
{
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

class SD2MechaChaingun : SD2Chaingun
{
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
