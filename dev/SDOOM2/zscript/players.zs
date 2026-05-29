// Sonic Doom 2 - Player Classes
// Coded by MIDIMan

class SD2Player : DoomPlayer
{
	uint ClipCapacity;
	property ClipCapacity: ClipCapacity;
	uint ShellCapacity;
	property ShellCapacity: ShellCapacity;
	uint RocketCapacity;
	property RocketCapacity: RocketCapacity;
	uint CellCapacity;
	property CellCapacity: CellCapacity;
	
	virtual void SD2SetAmmoCapacity(uint mul = 1)
	{
		self.SetAmmoCapacity("Clip", ClipCapacity * mul);
		self.SetAmmoCapacity("Shell", ShellCapacity * mul);
		self.SetAmmoCapacity("RocketAmmo", RocketCapacity * mul);
		self.SetAmmoCapacity("Cell", CellCapacity * mul);
	}
	
	override void PostBeginPlay()
	{
		Super.PostBeginPlay();
		SD2SetAmmoCapacity();
	}

	Default
	{
		Player.MaxHealth 200;
		Player.CrouchSprite "";
// 		Player.StartItem "SD2Pistol";
// 		Player.StartItem "Clip", 50;
// 		Player.StartItem "Fist";
		Player.WeaponSlot 1, "Fist", "SD2Chainsaw";
// 		Player.WeaponSlot 2, "SD2Pistol";
// 		Player.WeaponSlot 3, "SD2Shotgun", "SD2SuperShotgun";
// 		Player.WeaponSlot 4, "SD2Chaingun";
// 		Player.WeaponSlot 5, "SD2RocketLauncher";
// 		Player.WeaponSlot 6, "SD2PlasmaRifle";
// 		Player.WeaponSlot 7, "SD2BFG9000";
		SD2Player.ClipCapacity 200;
		SD2Player.ShellCapacity 50;
		SD2Player.RocketCapacity 50;
		SD2Player.CellCapacity 300;
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
		SD2Player.ClipCapacity 100;
		SD2Player.ShellCapacity 30;
		SD2Player.RocketCapacity 30;
		SD2Player.CellCapacity 100;
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

class SD2MetalPlayer : SD2Player
{
	Default
	{
		Speed 1.75;
		Player.DisplayName "Mecha Sonic";
		Player.Face "MTF";
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
