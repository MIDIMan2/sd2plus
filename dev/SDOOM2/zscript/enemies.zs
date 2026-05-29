// Sonic Doom 2 - Enemies

// Ported from sonic.deh
class SD2MetalSonic : Archvile replaces Archvile
{
	Default
	{
		+FLOAT
		+NOGRAVITY
	}
}

// Ported from sonic.deh
class SD2Mario : WolfensteinSS replaces WolfensteinSS
{
	Default
	{
		Speed 30;
	}
	
	States
	{
		Missile:
			Goto See;
		Melee:
			SSWV E 10 A_FaceTarget;
			SSWV F 10 A_FaceTarget;
			SSWV G 4 BRIGHT A_CPosAttack;
			SSWV F 6 A_FaceTarget;
			SSWV G 4 BRIGHT A_CPosAttack;
			SSWV F 1 A_CPosRefire;
			Goto Melee+1;
		XDeath:
			Goto Death;
	}
}

// Ported from sonic.deh
class SD2PseudoSuper : Arachnotron replaces Arachnotron
{
	States
	{
		Spawn:
			BSPI A 10 A_Look;
			BSPI A 3;
		See:
			BSPI A 3 A_BabyMetal;
			BSPI A 3 A_Chase;
			BSPI A 3;
			Loop;
		Pain:
			BSPI I 3;
			BSPI I 3 A_Pain;
			BSPI A 3;
			Goto See;
	}
}
