include( 'shared.lua' )

function ENT:Draw()
	self:DrawModel()
end

function ENT:SpawnNPCS() 
	local keyToRemove = table.KeyFromValue( beacons, self:EntIndex() )
	local rndNPC_key = math.random(0, 5)
	
	local rndX = math.random(-200, 200)
	local rndY = math.random(-200, 200)
	
	local spawnLoc = Vector(rndX, rndY, 25)
	
	if ( util.PointContents( self:GetPos() + spawnLoc ) != 0 ) then return end
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