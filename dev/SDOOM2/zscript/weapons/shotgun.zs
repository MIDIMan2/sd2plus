// Sonic Doom 2 - Shotgun

class SD2Shotgun : SD2Weapon replaces Shotgun
{
	Default
	{
		Weapon.SelectionOrder 1300;
		Weapon.AmmoUse 1;
		Weapon.AmmoGive 8;
		Weapon.AmmoType "Shell";
		Inventory.PickupMessage "$GOTSHOTGUN";
		Obituary "$OB_MPSHOTGUN";
		Tag "$TAG_SHOTGUN";
		SD2Weapon.BaseClass "SD2Shotgun";
	}

	States
	{
		Ready:
			SHTG A 1 A_WeaponReady;
			Loop;
		Deselect:
			SHTG A 1 A_Lower;
			Loop;
		Select:
			SHTG A 1 A_Raise;
			Loop;
		Fire:
			SHTG A 3;
			SHTG A 7 A_FireShotgun;
			SHTG BC 5;
			SHTG D 4;
			SHTG CB 5;
			SHTG A 3;
			SHTG A 7 A_ReFire;
			Goto Ready;
		Flash:
			SHTF A 4 Bright A_Light1;
			SHTF B 3 Bright A_Light2;
			Goto LightDone;
		Spawn:
			SHOT A -1;
			Stop;
	}

	override void BeginPlay()
	{
		charToWeapon.Insert("SD2SonicPlayer", "SD2SonicShotgun");
		charToWeapon.Insert("SD2TailsPlayer", "SD2TailsShotgun");
		charToWeapon.Insert("SD2KnuxPlayer", "SD2KnuxShotgun");
	}
}

class SD2SonicShotgun : SD2Shotgun
{
	States
	{
		Ready:
			SHTS A 1 A_WeaponReady;
			Loop;
		Deselect:
			SHTS A 1 A_Lower;
			Loop;
		Select:
			SHTS A 1 A_Raise;
			Loop;
		Fire:
			SHTS A 1;
			SHTS A 1 A_FireShotgun;
			SHTS BCDCBA 1;
			SHTS A 1 A_ReFire;
			Goto Ready;
		Flash:
			SHTF A 1 Bright A_Light1;
			SHTF B 1 Bright A_Light2;
			Goto LightDone;
	}
}

class SD2TailsShotgun : SD2Shotgun
{
	States
	{
		Ready:
			SHTT A 1 A_WeaponReady;
			Loop;
		Deselect:
			SHTT A 1 A_Lower;
			Loop;
		Select:
			SHTT A 1 A_Raise;
			Loop;
		Fire:
			SHTT A 3;
			SHTT A 7 A_FireShotgun;
			SHTT BC 5;
			SHTT D 4;
			SHTT CB 5;
			SHTT A 3;
			SHTT A 7 A_ReFire;
			Goto Ready;
	}
}

class SD2KnuxShotgun : SD2Shotgun
{
	States
	{
		Ready:
			SHTK A 1 A_WeaponReady;
			Loop;
		Deselect:
			SHTK A 1 A_Lower;
			Loop;
		Select:
			SHTK A 1 A_Raise;
			Loop;
		Fire:
			SHTK A 3;
			SHTK A 7 A_FireShotgun;
			SHTK BC 5;
			SHTK D 4;
			SHTK CB 5;
			SHTK A 3;
			SHTK A 7 A_ReFire;
			Goto Ready;
	}
}
