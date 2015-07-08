AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include( 'shared.lua' )

function GM:PlayerConnect( name, ip )
	MsgN( "Player ", name, " has joined the game." )
end

function GM:PlayerInitialSpawn( pl )
	pl:SetGravity( 1 )
	pl:SetWalkSpeed( 300 )
	pl:SetRunSpeed( 300 )
	pl:SetNoCollideWithTeammates( true )
	
	--[ FIX THE TEAM ASSIGNMENT, IT IS UNBALANCED ]--
	
	if team:NumPlayers( 0 ) == team:NumPlayers( 1 ) then 
		local rand = math.random( 0, 1 )
		pl:SetTeam( rand )
	elseif team:NumPlayers( 0 ) < team:NumPlayers( 1 ) then
		pl:SetTeam( 0 )
	else 
		pl:SetTeam( 1 )
	end 
end

function GM:PlayerSetModel( pl )
	local n = pl:Team()
	pl:SetModel( teams[n].model )
	pl:SetupHands()
end

function GM:PlayerSetHandsModel( ply, ent )

	local simplemodel = player_manager.TranslateToPlayerModelName( ply:GetModel() )
	local info = player_manager.TranslatePlayerHands( simplemodel )
	if ( info ) then
		ent:SetModel( info.model )
		ent:SetSkin( info.skin )
		ent:SetBodyGroups( info.body )
	end

end

function GM:PlayerLoadout( pl )
	pl:StripWeapons()
	
	local n = pl:Team()
	
	pl:SetPlayerColor( teams[n].color )
	
	for k, wep in pairs (teams[n].weapons) do
		pl:Give(wep)
	end
end

hook.Add( 'PlayerShouldTakeDamage', 'mns.ffire', function ( target, attacker ) 
	if ( attacker:IsPlayer() ) && ( attacker:Team() == target:Team() ) && ( attacker != target ) then	
		return false
	elseif ( attacker:IsNPC() ) then 
		return true
	end
	return true
end )

concommand.Add( "mns_spawnbeacon", function( pl )
	local ent = ents.Create( 'mns_npc_beacon' )
	
	local tr = {}
	tr.start = pl:EyePos()
	tr.endpos = pl:EyePos() + 95 * pl:GetAimVector()
	tr.filter = pl
	local trace = util.TraceLine(tr)

	ent:SetPos( trace.HitPos )
	ent:Spawn()
	ent:DropToFloor()
	if ( !ent:IsValid() ) then return end
		--table.insert( beacons, ent:EntIndex() )
		--print( "[" .. table.maxn( beacons ) .. "]: " .. beacons[table.maxn( beacons )] )
end )

concommand.Add( "mns_givechairlauncher", function( pl )
	pl:Give( 'mns_chairlauncher' )
end )

concommand.Add( "mns_switchteam", function( pl )
	if team:NumPlayers( 0 ) == team:NumPlayers( 1 ) then 
		MsgN( "Failed to switch teams: teams are balanced." )
		return 
	elseif pl:Team() == 0 then
		pl:Kill()
		pl:SetTeam( 1 )
		MsgN( "Player ", pl:Nick(), " was moved to the White team." )
	elseif pl:Team() == 1 then
		pl:Kill()
		pl:SetTeam( 0 )
		MsgN( "Player ", pl:Nick(), " was moved to the Black team." )
	end
end )
