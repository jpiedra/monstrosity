AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( 'shared.lua' )
include( 'cl_init.lua' )

function ENT:Initialize()
	local w=20  
    local l=20  
    local h=20 
 
    local min=Vector(0-(w/2),0-(l/2),0-(h/2))
    local max=Vector(w/2,l/2,h/2)
 
	//self:SetModel( "models/props_combine/combine_binocular01.mdl" )
	//self:SetModel( "models/props_combine/combine_light001b.mdl" )
	//self:SetModel( "models/props_rooftop/roof_vent004.mdl" )
  	self:SetModel( "models/props_combine/combine_binocular01.mdl" )
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
	local isTriggered = self:GetTriggered()

	//&& !isTriggered
	
	if activator:IsPlayer() then 
		//activator:Kill()
		//self:SetTriggered( true )
		self:SpawnNPCS()
	end
end

function ENT:SpawnNPCS() 
	//local keyToRemove = table.KeyFromValue( beacons, self:EntIndex() )
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
	
	/*print( table.remove( beacons, keyToRemove ) )
	self:Remove()*/ -- move these two lines after the spawning routine
end 

function ENT:Think()
	
end