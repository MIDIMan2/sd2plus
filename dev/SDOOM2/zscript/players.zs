// Sonic Doom 2 - Player Classes
// Coded by MIDIMan

class SD2Player : DoomPlayer
{
	// Version of SetAmmoCapacity that also sets backpack capacity
	virtual void SD2SetAmmoCapacity(class<Ammo> type, int amount)
	{
		if (type != NULL)
		{
			let item = Ammo(FindInventory(type));
			if (item != NULL)
			{
				item.MaxAmount = amount;
				item.BackpackMaxAmount = 2 * amount;
			}
			else
			{
				item = Ammo(GiveInventoryType(type));
				if (item != NULL)
				{
					item.MaxAmount = amount;
					item.BackpackMaxAmount = 2 * amount;
					item.Amount = 0;
				}
			}
		}
	}

	Default
	{
		Player.MaxHealth 200;
		Player.CrouchSprite "";
	}
}

class SD2SonicPlayer : SD2Player
{
	Default
	{
		Speed 2.55;
		Player.DisplayName "Sonic";
		Player.Face "STF";
		Player.ColorRange 192,207;
		Player.StartItem "SD2SonicPistol";
		Player.StartItem "Clip", 50;
		Player.StartItem "Fist";
		Player.WeaponSlot 1, "Fist", "SD2SonicChainsaw";
		Player.WeaponSlot 2, "SD2SonicPistol";
		Player.WeaponSlot 3, "SD2SonicShotgun", "SuperShotgun";
	}
	
	override void PostBeginPlay()
	{
		SD2SetAmmoCapacity("Clip", 100);
		SD2SetAmmoCapacity("Shell", 30);
		SD2SetAmmoCapacity("RocketAmmo", 30);
		SD2SetAmmoCapacity("Cell", 150);
	}
	
	States
	{
		Spawn:
			PLAY A -1;
			Loop;
		See:
			PLAY ABCD 4;
			Loop;
		Missile:
			PLAY E 12;
			Goto Spawn;
		Melee:
			PLAY F 6 BRIGHT;
			Goto Missile;
		Pain:
			PLAY G 4;
			PLAY G 4 A_Pain;
			Goto Spawn;
		Death:
		AltSkinDeath:
			PLAY H 10;
			PLAY I 10 A_PlayerScream;
			PLAY J 10 A_NoBlocking;
			PLAY KLM 10;
			PLAY N -1;
			Stop;
		XDeath:
		AltSkinXDeath:
			PLAY O 5;
			PLAY P 5 A_XScream;
			PLAY Q 5 A_NoBlocking;
			PLAY RSTUV 5;
			PLAY W -1;
			Stop;
	}
}

class SD2TailsPlayer : SD2Player
{
	Default
	{
		Speed 1.25;
		Player.DisplayName "Tails";
		Player.Face "TTF";
		Player.SoundClass "tails";
		Player.StartItem "SD2TailsPistol";
		Player.StartItem "Clip", 50;
		Player.StartItem "SD2TailsFist";
		Player.WeaponSlot 1, "SD2TailsFist", "SD2TailsChainsaw";
		Player.WeaponSlot 2, "SD2TailsPistol";
		Player.WeaponSlot 3, "Shotgun", "SuperShotgun";
	}

	States
	{
		Spawn:
			TAIL A -1;
			Loop;
		See:
			TAIL ABCD 4;
			Loop;
		Missile:
			TAIL E 12;
			Goto Spawn;
		Melee:
			TAIL F 6 BRIGHT;
			Goto Missile;
		Pain:
			TAIL G 4;
			TAIL G 4 A_Pain;
			Goto Spawn;
		Death:
		AltSkinDeath:
			TAIL H 10;
			TAIL I 10 A_PlayerScream;
			TAIL J 10 A_NoBlocking;
			TAIL KLM 10;
			TAIL N -1;
			Stop;
		XDeath:
		AltSkinXDeath:
			TAIL O 5;
			TAIL P 5 A_XScream;
			TAIL Q 5 A_NoBlocking;
			TAIL RSTUV 5;
			TAIL W -1;
			Stop;
	}
}

class SD2KnuxPlayer : SD2Player
{
	Default
	{
		Speed 1.50;
		Player.DisplayName "Knuckles";
		Player.Face "KTF";
		Player.SoundClass "Knuckles";
		Player.StartItem "SD2KnuxPistol";
		Player.StartItem "Clip", 50;
		Player.StartItem "SD2KnuxFist";
		Player.WeaponSlot 1, "SD2KnuxFist", "SD2KnuxChainsaw";
		Player.WeaponSlot 2, "SD2KnuxPistol";
		Player.WeaponSlot 3, "SD2KnuxShotgun", "SuperShotgun";
	}

	States
	{
		Spawn:
			KNUX A -1;
			Loop;
		See:
			KNUX ABCD 4;
			Loop;
		Missile:
			KNUX E 12;
			Goto Spawn;
		Melee:
			KNUX F 6 BRIGHT;
			Goto Missile;
		Pain:
			KNUX G 4;
			KNUX G 4 A_Pain;
			Goto Spawn;
		Death:
		AltSkinDeath:
			KNUX H 10;
			KNUX I 10 A_PlayerScream;
			KNUX J 10 A_NoBlocking;
			KNUX KLM 10;
			KNUX N -1;
			Stop;
		XDeath:
		AltSkinXDeath:
			KNUX O 5;
			KNUX P 5 A_XScream;
			KNUX Q 5 A_NoBlocking;
			KNUX RSTUV 5;
			KNUX W -1;
			Stop;
	}
}

class SD2MechaPlayer : SD2Player
{
	Default
	{
		Speed 1.75;
		Player.DisplayName "Mecha Sonic";
		Player.Face "MTF";
	}
	
	override void PostBeginPlay()
	{
		SD2SetAmmoCapacity("Clip", 300);
		SD2SetAmmoCapacity("Shell", 75);
		SD2SetAmmoCapacity("RocketAmmo", 75);
		SD2SetAmmoCapacity("Cell", 450);
	}

	States
	{
		Spawn:
			METL A -1;
			Loop;
		See:
			METL ABCD 4;
			Loop;
		Missile:
			METL E 12;
			Goto Spawn;
		Melee:
			METL F 6 BRIGHT;
			Goto Missile;
		Pain:
			METL G 4;
			METL G 4 A_Pain;
			Goto Spawn;
		Death:
		AltSkinDeath:
			METL H 10;
			METL I 10 A_PlayerScream;
			METL J 10 A_NoBlocking;
			METL KLM 10;
			METL N -1;
			Stop;
		XDeath:
		AltSkinXDeath:
			METL O 5;
			METL P 5 A_XScream;
			METL Q 5 A_NoBlocking;
			METL RSTUV 5;
			METL W -1;
			Stop;
	}
}
