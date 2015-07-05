AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( 'shared.lua' )
include( 'cl_init.lua' )

function ENT:Initialize()
	self:SetModel( "models/props_combine/combinethumper002.mdl" )
	self:SetModelScale( self:GetModelScale() * 0.5, 0 )
	//self:SetCustomCollisionCheck( true ) ShouldCollideTestHook( ent1, ent2 ) in GM
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	
	local phys = self:GetPhysicsObject()
	if ( phys:IsValid() ) then
		phys:Wake()
	end
end

function ENT:Use( activator )
	if ( activator:IsPlayer() ) then 
		activator:Kill()
	end
	
	if ( !triggered ) then 
		self:SpawnNPCS()
	end
end

function ENT:Think()
	
end