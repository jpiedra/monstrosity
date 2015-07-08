include( 'shared.lua' )

hook.Add("PreDrawHalos", "glowMyBeacons", function()
	for k, v in pairs ( ents.FindByClass( 'mns_npc_beacon' ) ) do
		halo.Add( {v}, v:GetColor(), 0, 0, 1, true, true )
	end
end) 