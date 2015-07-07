GM.Name 	= "Monstrosity"
GM.Author 	= "roflwaffle"
GM.Email 	= "N/A"
GM.Website 	= "N/A"

function GM:Initialize()
	self.BaseClass.Initialize( self )
end
//Teams
team.SetUp( 0, "Black", Color(0, 0, 0) )
team.SetUp( 1, "White", Color(255, 255, 255) )
team.SetUp( 2, "Waiting", Color(50, 50, 50) )

util.PrecacheModel( "models/player/phoenix.mdl" )
util.PrecacheModel( "models/player/odessa.mdl" )
util.PrecacheModel( "models/player/arctic.mdl" )
util.PrecacheModel( "models/props_combine/combinethumper002.mdl" )

beacons = {}

teams = {}
teams[0] = { name = "Black", 
			 color = Vector( 0, 0, 0 ),
			 model = "models/player/phoenix.mdl",
			 weapons = { 
				"weapon_crowbar",
				"weapon_pistol"
			 } 
		   }
teams[1] = { name = "White", 
			 color = Vector( 255, 255, 255 ),
			 model = "models/player/odessa.mdl",
			 weapons = { 
				"weapon_crowbar",
				"weapon_pistol"
			 } 
		   }
		   




