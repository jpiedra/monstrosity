AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( 'shared.lua' )
include( 'cl_init.lua' )

function ENT:Initialize()
	--[ Possible model alternatives, kept here for quick reference ]--
	-- self:SetModel( "models/props_combine/combine_binocular01.mdl" )
	-- self:SetModel( "models/props_combine/combine_light001b.mdl" )
	-- self:SetModel( "models/props_rooftop/roof_vent004.mdl" ) 
  	self:SetModel( "models/props_combine/combine_binocular01.mdl" )
	self:SetColor( Color( 0, 255, 0, 255 ) )
	self:SetRenderMode( RENDERMODE_WORLDGLOW )
	
	--[ TO-DO: Change collision to BSP-Only, NPCs and Players don't collide ]--
	-- self:SetCustomCollisionCheck( true ) ShouldCollideTestHook( ent1, ent2 ) in GM
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_NONE )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetTriggered( false )
	
	local phys = self:GetPhysicsObject()
	if ( phys:IsValid() ) then
		phys:Wake()
		table.insert( beacons, self:EntIndex() )
	end
	
	--[ 0:idle[green] / 1:haste[blue] / 2:spawning[yellow] / 3:warning[red] ]--
	self.state = 0
	self.lastThink = 0
	self.idleLimit = 10
	self.spawnLimit = 20
	self.warningLimit = 10
	self.hasteLimit = 10
	
	--[ my key ]--
	self.myKey = table.KeyFromValue( beacons, self:EntIndex() )
end

function ENT:Use( activator )
	--local keyToRemove = table.KeyFromValue( beacons, self:EntIndex() )
	local isTriggered = self:GetTriggered()
	
	if activator:IsPlayer() then 
		if ( !isTriggered ) then 
			self:SetTriggered( true )
			--self:SetColor( Color( 255, 0, 0, 255 ) )
		end 
		self:SetTriggered( true )
		--self:SpawnNPCS()
		--timer.Simple( 5, function() 
		--	SafeRemoveEntity( self, self.myKey )
		--end )
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
	--
	-- On every tick: 	If I have not been triggered, count down as normal - state[green]
	-- 					If I have been triggered, we need to reset my lastThink var;
	--						then, from 0 onward, state[yellow] - spawn baddies until 
	--						I reach endTime for state[yellow] and move to state[red]
	--
	--[ while I'm not activated ]--
	local isTriggered = self:GetTriggered()
	
	if  self.lastThink <= CurTime() then
		if ( !isTriggered ) then 
			if self.state == 0 then
				if self.lastThink >= self.idleLimit then 
					self.lastThink = 0
					self:SetColor( Color( 0, 0, 255, 255 ) )
					self.state = 1
				end
			elseif self.state == 1 then 
				if self.lastThink >= self.hasteLimit then 
					self.lastThink = 0
					SafeRemoveEntity( self, keyToRemove )
				end 
			end
		else
			if self.state == 0 || self.state == 1 then
				--if self.lastThink <= self.idleLimit then 
				self.lastThink = 0
				self:SetColor( Color( 255, 255, 0, 255 ) )
				self.state = 2
				--end
			elseif self.state == 2 then
				if self.lastThink < self.spawnLimit then 
					self:SpawnNPCS()
				else 
					self.lastThink = 0
					self:SetColor( Color( 255, 0, 0, 255 ) )
					self.state = 3
				end
			elseif self.state == 3 then 
				if self.lastThink >= self.warningLimit then
					SafeRemoveEntity( self, self.myKey )
				end
			end
		end
		
		self.lastThink = CurTime() + 1.00
	end
	
end

/*

*/