// Sonic Doom 2 - Replacement Classes
// Ported to ZScript from SSNTails' DECORATE script

class Coconut : DoomImpBall replaces DoomImpBall
{
	Default
	{
		RenderStyle "Normal";
	}
}

class SpikeBall : BaronBall replaces BaronBall
{
	Default
	{
		RenderStyle "Normal";
	}
}

class KnucklesFist : RevenantTracer replaces RevenantTracer
{
	Default
	{
		RenderStyle "Normal";
	}
}

class GFZFlower : HeartColumn replaces HeartColumn
{
	Default
	{
		-SOLID;
	}
}
