// Sonic Doom 2 - Health Pickups

class SD2HealthBonus : HealthBonus replaces HealthBonus
{
    Default
    {
        Inventory.MaxAmount 400;
    }
	
	States
	{
		Spawn:
			BON1 ABCDCB 6;
			Loop;
	}
}

class SD2Soulsphere : Soulsphere replaces Soulsphere
{
    Default
    {
        Inventory.Amount 127; // Oddly specific number...
        Inventory.MaxAmount 400;
    }
	
	States
	{
		Spawn:
			SOUL ABCDCB 6 Bright;
            Loop;
	}
}

class SD2MegasphereHealth : MegasphereHealth replaces MegasphereHealth
{
    Default
    {
        Inventory.Amount 400;
        Inventory.MaxAmount 400;
    }
}

class SD2Megasphere : Megasphere replaces Megasphere
{
	States
	{
		Pickup:
			TNT1 A 0 A_GiveInventory("BlueArmorForMegasphere", 1);
			TNT1 A 0 A_GiveInventory("SD2MegasphereHealth", 1);
			Stop;
	}
}

class SD2Berserk : Berserk replaces Berserk
{
	action void A_SD2SelectFist() {
		if (player == null || player.mo == null)
			return;
		
		string fistName = "SD2Fist";
		
		if (player.mo is "SD2SonicPlayer")
			fistName = "SD2SonicFist";
		else if (player.mo is "SD2TailsPlayer")
			fistName = "SD2TailsFist";
		else if (player.mo is "SD2KnuxPlayer")
			fistName = "SD2KnuxFist";
		
		A_SelectWeapon(fistName);
	}
	
	States
	{
		Pickup:
			TNT1 A 0 A_GiveInventory("PowerStrength");
			TNT1 A 0 HealThing(100, 0);
			TNT1 A 0 A_SD2SelectFist();
			// TNT1 A 0 A_SelectWeapon("Fist");
			Stop;
	}
}
