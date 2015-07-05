include( 'shared.lua' )

function ENT:Draw()
	-- self.BaseClass.Draw(self) -- overrides draw
	//self:DrawEntityOutline( 1.0 )
	self:DrawModel()
	
	//AddWorldTip( self:EntIndex(), "NPC Beacon", 0.5, self:GetPos, self )
end

local triggered = false

function ENT:SpawnNPCS() 
	local keyToRemove = table.KeyFromValue( beacons, self:EntIndex() )

	triggered = true
	print( "I should only appear once" )
	print( table.remove( beacons, keyToRemove ) )
	self:Remove()
end 