AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( 'shared.lua' )
include( 'cl_init.lua' )

function ENT:Initialize()
	//self:SetModel( "models/props_combine/combine_binocular01.mdl" )
	//self:SetModel( "models/props_combine/combine_light001b.mdl" )
	//self:SetModel( "models/props_rooftop/roof_vent004.mdl" )
  	self:SetModel( "models/props_combine/combine_binocular01.mdl" )
	self:SetColor( Color( 0, 255, 0, 255 ) )
	self:SetRenderMode( RENDERMODE_WORLDGLOW )
	//self:SetCollisionBounds(min,max)
	//self:SetModelScale( self:GetModelScale() * 0.5, 0 )
	//self:SetCustomCollisionCheck( true ) ShouldCollideTestHook( ent1, ent2 ) in GM
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_NONE )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetTriggered( false )
	
	local phys = self:GetPhysicsObject()
	if ( phys:IsValid() ) then
		phys:Wake()
	end
end

function ENT:Use( activator )
	local keyToRemove = table.KeyFromValue( beacons, self:EntIndex() )
	local isTriggered = self:GetTriggered()
	//self:SetColor( Color( 255, 0, 0, 255 ) )
	//&& !isTriggered
	
	if activator:IsPlayer() then 
		//activator:Kill()
		if ( !isTriggered ) then 
			self:SetColor( Color( 255, 0, 0, 255 ) )
		end 
		self:SetTriggered( true )
		self:SpawnNPCS()
		timer.Simple( 5, function() 
			SafeRemoveEntity( self, keyToRemove )
		end )
	end
end

function SafeRemoveEntity( ent, keyToRemove )
    if ( !ent || !ent:IsValid() || ent:IsPlayer() ) then return end
    print( table.remove( beacons, keyToRemove ) )
    ent:Remove()   
end


function ENT:SpawnNPCS() 
	local rndNPC_key = math.random(1, 5)
	
	local rndX = math.random(-200, 200)
	local rndY = math.random(-200, 200)
	
	local spawnLoc = Vector(rndX, rndY, 25)
	
	if ( util.PointContents( self:GetPos() + spawnLoc ) != 0 || 
		 util.PointContents( self:GetPos() + spawnLoc ) == 64 ||
		 util.PointContents( self:GetPos() + spawnLoc ) == 128 ) then return end
	/*	MsgN( "Unable to spawn at location " .. rndX .. ", " .. rndY .. ", 10." )
		return 
	end*/
		
	local ent = ents.Create( MNS_NPCS[rndNPC_key].mns_string )
	if ( !IsValid( ent ) ) then return end
	
	ent:SetPos( self:GetPos() + spawnLoc )
	ent:Spawn()
	
	if MNS_NPCS[rndNPC_key].mns_string == 'npc_combine_s' then
		for k, wep in pairs ( MNS_NPCS[rndNPC_key].weapons ) do
			ent:Give(wep)
		end
	end
end 

function ENT:Think()
	
end