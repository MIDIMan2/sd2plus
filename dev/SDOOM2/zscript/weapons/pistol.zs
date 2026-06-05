// Sonic Doom 2 - Pistol

class SD2Pistol : SD2Weapon replaces Pistol
{
	Default
	{
		Weapon.SelectionOrder 1900;
		Weapon.AmmoUse 1;
		Weapon.AmmoGive 20;
		Weapon.AmmoType "Clip";
		Obituary "$OB_MPPISTOL";
		+WEAPON.WIMPY_WEAPON
		Inventory.Pickupmessage "$PICKUP_PISTOL_DROPPED";
		Tag "$TAG_PISTOL";
		SD2Weapon.BaseClass "SD2Pistol";
	}

	States
	{
		Ready:
			PISG A 1 A_WeaponReady;
			Loop;
		Deselect:
			PISG A 1 A_Lower;
			Loop;
		Select:
			PISG A 1 A_Raise;
			Loop;
		Fire:
			PISG A 4;
			PISG B 6 A_FirePistol;
			PISG C 4;
			PISG B 5 A_ReFire;
			Goto Ready;
		Flash:
			PISF A 7 Bright A_Light1;
			Goto LightDone;
			PISF A 7 Bright A_Light1;
			Goto LightDone;
		Spawn:
			PIST A -1;
			Stop;
	}

	override void BeginPlay()
	{
		charToWeapon.Insert("SD2SonicPlayer", "SD2SonicPistol");
		charToWeapon.Insert("SD2TailsPlayer", "SD2TailsPistol");
		charToWeapon.Insert("SD2KnuxPlayer", "SD2KnuxPistol");
	}
}

class SD2SonicPistol : SD2Pistol
{
	States
	{
		Ready:
			PSGS A 1 A_WeaponReady;
			Loop;
		Deselect:
			PSGS A 1 A_Lower;
			Loop;
		Select:
			PSGS A 1 A_Raise;
			Loop;
		Fire:
			PSGS A 1;
			PSGS B 6 A_FirePistol;
			PSGS C 4;
			PSGS B 5 A_ReFire;
			Goto Ready;
		Flash:
			PISF A 1 Bright A_Light1;
			Goto LightDone;
			PISF A 1 Bright A_Light1;
			Goto LightDone;
	}
}

class SD2TailsPistol : SD2Pistol
{
	States
	{
		Ready:
			PSGT A 1 A_WeaponReady;
			Loop;
		Deselect:
			PSGT A 1 A_Lower;
			Loop;
		Select:
			PSGT A 1 A_Raise;
			Loop;
		Fire:
			PSGT A 4;
			PSGT B 6 A_FirePistol;
			PSGT C 4;
			PSGT B 5 A_ReFire;
			Goto Ready;
	}
}

class SD2KnuxPistol : SD2Pistol
{
	States
	{
		Ready:
			PISK A 1 A_WeaponReady;
			Loop;
		Deselect:
			PISK A 1 A_Lower;
			Loop;
		Select:
			PISK A 1 A_Raise;
			Loop;
		Fire:
			PISK A 4;
			PISK B 6 A_FirePistol;
			PISK C 4;
			PISK B 5 A_ReFire;
			Goto Ready;
	}
}
