// Sonic Doom 2 - Chainsaw

class SD2Chainsaw : CustomInventory replaces Chainsaw
{
	States
	{
		Pickup:
			CSAW A 0 {
				if (self is "SD2SonicPlayer")
				{
					A_GiveInventory("SD2SonicChainsaw");
				}
				else if (self is "SD2TailsPlayer")
				{
					A_GiveInventory("SD2TailsChainsaw");
				}
				else if (self is "SD2KnuxPlayer")
				{
					A_GiveInventory("SD2KnuxChainsaw");
				}
				else
				{
					A_GiveInventory("Chainsaw");
				}
			}
			Stop;
		Spawn:
			CSAW A -1;
			Stop;
	}
}

class SD2SonicChainsaw : Chainsaw
{
	States
	{
		Ready:
			SAWG C 1 A_WeaponReady;
			SAWG D 4 A_WeaponReady;
			Loop;
		Deselect:
			SAWG C 1 A_Lower;
			Loop;
		Select:
			SAWG C 1 A_Raise;
			Loop;
		Fire:
			SAWG A 1 A_Saw;
			SAWG B 4 A_Saw;
			SAWG B 0 A_ReFire;
			Goto Ready;
	}
}

class SD2TailsChainsaw : Chainsaw
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

class SD2KnuxChainsaw : Chainsaw
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
