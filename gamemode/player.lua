/*local pl = FindMetaTable( "player" )

local teams = {}
teams[0] = { name = "Black", 
			 color = Vector( 0, 0, 0 ),
			 model = "models/player/phoenix.mdl"
			 weapons = { 
				"weapon_crowbar",
				"weapon_pistol"
			 } 
		   }
teams[1] = { name = "White", 
			 color = Vector( 255, 255, 255 ),
			 model = "models/player/arctic.mdl",
			 weapons = { 
				"weapon_crowbar",
				"weapon_pistol"
			 } 
		   }
*/

/*function pl:PlayerJoinTeam( n )
	if n < 0 or n > 1 then return false end 
	
	self:SetTeam( n )
	
	if n == 0 then 
		self:SetPlayerColor( Vector( 0, 0, 0 ) )
	elseif n == 1 then 
		self:SetPlayerColor( Vector( 255, 255, 255 ) )
	end 
	
	return true 
end*/