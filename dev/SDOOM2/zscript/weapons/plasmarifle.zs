// Sonic Doom 2 - Plasma Rifle

class SD2PlasmaRifle : SD2Weapon replaces PlasmaRifle
{
    Default
	{
		Weapon.SelectionOrder 100;
		Weapon.AmmoUse 1;
		Weapon.AmmoGive 40;
		Weapon.AmmoType "Cell";
		Inventory.PickupMessage "$GOTPLASMA";
		Tag "$TAG_PLASMARIFLE";
        SD2Weapon.BaseClass "SD2PlasmaRifle";
	}

	States
	{
        Ready:
            PLSG A 1 A_WeaponReady;
            Loop;
        Deselect:
            PLSG A 1 A_Lower;
            Loop;
        Select:
            PLSG A 1 A_Raise;
            Loop;
        Fire:
            PLSG A 3 A_FirePlasma;
            PLSG B 20 A_ReFire;
            Goto Ready;
        Flash:
            PLSF A 4 Bright A_Light1;
            Goto LightDone;
            PLSF B 4 Bright A_Light1;
            Goto LightDone;
        Spawn:
            PLAS A -1;
            Stop;
	}

    override void BeginPlay()
    {
        Super.BeginPlay();
        charToWeapon.Insert("SD2SonicPlayer", "SD2SonicPlasmaRifle");
        charToWeapon.Insert("SD2MechaPlayer", "SD2MechaPlasmaRifle");
    }
}

class SD2SonicPlasmaRifle : SD2PlasmaRifle
{
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

class SD2MechaPlasmaRifle : SD2PlasmaRifle
{
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
