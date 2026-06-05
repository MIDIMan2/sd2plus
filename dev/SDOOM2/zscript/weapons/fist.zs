// Sonic Doom 2 - Fist

class SD2Fist : SD2Weapon replaces Fist
{
	Default
	{
		Weapon.SelectionOrder 3700;
		Weapon.Kickback 100;
		Obituary "$OB_MPFIST";
		Tag "$TAG_FIST";
		+WEAPON.WIMPY_WEAPON
		+WEAPON.MELEEWEAPON
		+WEAPON.NOAUTOSWITCHTO
		SD2Weapon.BaseClass "SD2Fist";
	}

	States
	{
		Ready:
			PUNG A 1 A_WeaponReady;
			Loop;
		Deselect:
			PUNG A 1 A_Lower;
			Loop;
		Select:
			PUNG A 1 A_Raise;
			Loop;
		Fire:
			PUNG B 4;
			PUNG C 4 A_Punch;
			PUNG D 5;
			PUNG C 4;
			PUNG B 5 A_ReFire;
			Goto Ready;
	}

	override void BeginPlay()
	{
		Super.BeginPlay();
		charToWeapon.Insert("SD2SonicPlayer", "SD2SonicFist");
		charToWeapon.Insert("SD2TailsPlayer", "SD2TailsFist");
		charToWeapon.Insert("SD2KnuxPlayer", "SD2KnuxFist");
	}
}

class SD2SonicFist : SD2Fist
{
	States
	{
		Ready:
			PUNS A 1 A_WeaponReady;
			Loop;
		Deselect:
			PUNS A 1 A_Lower;
			Loop;
		Select:
			PUNS A 1 A_Raise;
			Loop;
		Fire:
			PUNS B 4;
			PUNS C 4 A_Punch;
			PUNS D 5;
			PUNS C 4;
			PUNS B 5 A_ReFire;
			Goto Ready;
	}
}

class SD2TailsFist : SD2Fist
{
	States
	{
		Ready:
			PUNT A 1 A_WeaponReady;
			Loop;
		Deselect:
			PUNT A 1 A_Lower;
			Loop;
		Select:
			PUNT A 1 A_Raise;
			Loop;
		Fire:
			PUNT B 4;
			PUNT C 4 A_Punch;
			PUNT D 5;
			PUNT C 4;
			PUNT B 5 A_ReFire;
			Goto Ready;
	}
}

class SD2KnuxFist : SD2Fist
{
	States
	{
		Ready:
			PUNK A 1 A_WeaponReady;
			Loop;
		Deselect:
			PUNK A 1 A_Lower;
			Loop;
		Select:
			PUNK A 1 A_Raise;
			Loop;
		Fire:
			PUNK B 1;
			PUNK C 1 A_Punch;
			PUNK DC 1;
			PUNK B 1 A_ReFire;
			Goto Ready;
	}
}
