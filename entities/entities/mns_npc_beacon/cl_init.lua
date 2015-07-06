include( 'shared.lua' )

function ENT:Draw()
	-- self.BaseClass.Draw(self) -- overrides draw
	//self:DrawEntityOutline( 1.0 )
	self:DrawModel()
	
	//AddWorldTip( self:EntIndex(), "NPC Beacon", 0.5, self:GetPos, self )
end

function ENT:SpawnNPCS() 
	local keyToRemove = table.KeyFromValue( beacons, self:EntIndex() )
	print( "I should only appear once" )
	
	local ent = ents.Create( "npc_zombie" )
	if ( !IsValid( ent ) ) then return end
	
	local rndX = math.random(100, 300)
	local rndY = math.random(100, 300)
	
	ent:SetPos( self:GetPos() + Vector(rndX, rndY, 10) )
	//ent:SetAngles( self.Owner:EyeAngles() )
	ent:Spawn()
	
	/*print( table.remove( beacons, keyToRemove ) )
	self:Remove()*/ -- move these two lines after the spawning routine
end 