// Sonic Doom 2 - Chainsaw

class SD2TailsFist : Fist
{
	Default
	{
		Inventory.RestrictedTo "SD2SonicPlayer";
	}
	
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

class SD2KnuxFist : Fist
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
