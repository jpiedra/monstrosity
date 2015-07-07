AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( 'shared.lua' )
include( 'cl_init.lua' )

function ENT:Initialize()
	self:SetModel( "models/props_combine/combinethumper002.mdl" )
	self:SetModelScale( self:GetModelScale() * 0.5, 0 )
	//self:SetCustomCollisionCheck( true ) ShouldCollideTestHook( ent1, ent2 ) in GM
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_NONE ) -- MOVETYPE_NONE to disable pushing, but then floats in air!
	self:SetSolid( SOLID_VPHYSICS )
	self:SetTriggered( false )
	
	local phys = self:GetPhysicsObject()
	if ( phys:IsValid() ) then
		phys:Wake()
	end
end

function ENT:Use( activator )
	local isTriggered = self:GetTriggered()

	if ( activator:IsPlayer() && !isTriggered ) then 
		//activator:Kill()
		//self:SetTriggered( true )
		self:SpawnNPCS()
	end
end

function ENT:Think()
	
end