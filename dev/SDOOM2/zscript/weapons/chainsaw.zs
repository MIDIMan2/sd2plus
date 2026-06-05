// Sonic Doom 2 - Chainsaw

class SD2Chainsaw : SD2Weapon replaces Chainsaw
{
	Default
	{
		Weapon.Kickback 0;
		Weapon.SelectionOrder 2200;
		Weapon.UpSound "weapons/sawup";
		Weapon.ReadySound "weapons/sawidle";
		Inventory.PickupMessage "$GOTCHAINSAW";
		Obituary "$OB_MPCHAINSAW";
		Tag "$TAG_CHAINSAW";
		+WEAPON.MELEEWEAPON
		+WEAPON.NOAUTOSWITCHTO
		SD2Weapon.BaseClass "SD2Chainsaw";
	}

	States
	{
		Ready:
			SAWG CD 4 A_WeaponReady;
			Loop;
		Deselect:
			SAWG C 1 A_Lower;
			Loop;
		Select:
			SAWG C 1 A_Raise;
			Loop;
		Fire:
			SAWG AB 4 A_Saw;
			SAWG B 0 A_ReFire;
			Goto Ready;
		Spawn:
			CSAW A -1;
			Stop;
	}

	override void BeginPlay()
	{
		charToWeapon.Insert("SD2SonicPlayer", "SD2SonicChainsaw");
		charToWeapon.Insert("SD2TailsPlayer", "SD2TailsChainsaw");
		charToWeapon.Insert("SD2KnuxPlayer", "SD2KnuxChainsaw");
	}
}

class SD2SonicChainsaw : SD2Chainsaw
{
	States
	{
		Ready:
			SAWS C 1 A_WeaponReady;
			SAWS D 4 A_WeaponReady;
			Loop;
		Deselect:
			SAWS C 1 A_Lower;
			Loop;
		Select:
			SAWS C 1 A_Raise;
			Loop;
		Fire:
			SAWS A 1 A_Saw;
			SAWS B 4 A_Saw;
			SAWS B 0 A_ReFire;
			Goto Ready;
	}
}

class SD2TailsChainsaw : SD2Chainsaw
{
	States
	{
		Ready:
			SAWT CD 4 A_WeaponReady;
			Loop;
		Deselect:
			SAWT C 1 A_Lower;
			Loop;
		Select:
			SAWT C 1 A_Raise;
			Loop;
		Fire:
			SAWT AB 4 A_Saw;
			SAWT B 0 A_ReFire;
			Goto Ready;
	}
}

class SD2KnuxChainsaw : SD2Chainsaw
{
	States
	{
		Ready:
			SAWK CD 4 A_WeaponReady;
			Loop;
		Deselect:
			SAWK C 1 A_Lower;
			Loop;
		Select:
			SAWK C 1 A_Raise;
			Loop;
		Fire:
			SAWK AB 4 A_Saw;
			SAWK B 0 A_ReFire;
			Goto Ready;
	}
}
