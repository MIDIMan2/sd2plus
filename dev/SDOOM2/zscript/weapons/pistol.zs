// Sonic Doom 2 - Chainsaw

// class SD2Pistol : CustomInventory replaces Pistol
// {
// 	States
// 	{
// 		Pickup:
// 			PIST A 0 {
// 				if (self is "SD2SonicPlayer")
// 				{
// 					A_GiveInventory("SD2SonicPistol");
// 				}
// 				else if (self is "SD2TailsPlayer")
// 				{
// 					A_GiveInventory("SD2TailsPistol");
// 				}
// 				else if (self is "SD2KnuxPlayer")
// 				{
// 					A_GiveInventory("SD2KnuxPistol");
// 				}
// 				else
// 				{
// 					A_GiveInventory("Pistol");
// 				}
// 			}
// 			Stop;
// 		Spawn:
// 			PIST A -1;
// 			Stop;
// 	}
// }

class SD2SonicPistol : Pistol
{
	Default
	{
		Inventory.RestrictedTo "SD2SonicPlayer";
	}
	
	States
	{
		Fire:
			PISG A 1;
			PISG B 6 A_FirePistol;
			PISG C 4;
			PISG B 5 A_ReFire;
			Goto Ready;
		Flash:
			PISF A 1 Bright A_Light1;
			Goto LightDone;
			PISF A 1 Bright A_Light1;
			Goto LightDone;
	}
}

class SD2TailsPistol : Pistol
{
	Default
	{
		Inventory.RestrictedTo "SD2TailsPlayer";
	}
	
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

class SD2KnuxPistol : Pistol
{
	Default
	{
		Inventory.RestrictedTo "SD2KnuxPlayer";
	}
	
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
