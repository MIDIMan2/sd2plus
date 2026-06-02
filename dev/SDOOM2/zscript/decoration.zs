// Sonic Doom 2 - Decoration

class SSZBDecoA : Actor
{
    Default
    {
        Height 40;
        Radius 20;
        -SOLID;
    }

	States
	{
		Spawn:
			SSBA A 10;
			Loop;
	}
}

class SSZBDecoB : Actor
{
    Default
    {
        Height 40;
        Radius 20;
        -SOLID;
    }

	States
	{
		Spawn:
		    SSBB A 10;
		    Loop;
	}
}

class GHZDecoA : Actor
{
    Default
    {
        Height 40;
        Radius 20;
        -SOLID;
    }

	States
	{
		Spawn:
		    GHZA A 10;
		    Loop;
	}
}
