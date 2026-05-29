// Sonic Doom 2 - Projectiles

// Ported from sonic.deh
class SD2Rocket : Rocket replaces Rocket
{
	Default
	{
		-ROCKETTRAIL;
	}
	
	States
	{
		Spawn:
			BAL2 AB 4 Bright;
			Loop;
		Death:
			BAL2 CDE 6 Bright;
			Stop;
	}
}

// Ported from sonic.deh
class SD2PlasmaBall : PlasmaBall replaces PlasmaBall
{
	States
	{
		Spawn:
			APLS AB 5 Bright;
			Loop;
		Death:
			APBX ABCDE 5 Bright;
			Stop;
	}
}

// Ported from sonic.deh
class SD2BFGExtra : BFGExtra replaces BFGExtra
{
	States
	{
		Spawn:
			FIRE A 2 Bright A_StartFire;
			FIRE BAB 2 Bright A_Fire;
			FIRE C 2 Bright A_FireCrackle;
			FIRE BCBCDCDCDEDED 2 Bright A_Fire;
			FIRE E 2 Bright A_FireCrackle;
			FIRE FEFEFGHGHGH 2 Bright A_Fire;
			Stop;
	}
}
