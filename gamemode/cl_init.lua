include( 'shared.lua' )

hook.Add("PreDrawHalos", "glowMyBeacons", function()
	//Entity:GetColor()
	
	for k, v in pairs ( ents.FindByClass( 'mns_npc_beacon' ) ) do
		halo.Add( {v}, v:GetColor(), 0, 0, 1, true, true )
	end
	
	//halo.Add( ents.FindByClass( 'mns_npc_beacon' ), Color( 0, 255, 0 ), 0, 0, 2, true, true )
end) 


/*
function HUDHide( myhud )
	for k, v in pairs{ "CHudHealth", "CHudBattery" }
		if myhud == v then return false end
	end
end
hook.Add( "HUDShouldDraw", "HUDHide", HUDHide )

function GM:HUDPaint()
	self.BaseClass:HUDPaint()
	local ply = LocalPlayer()
	local HP  = LocalPlayer():Health()
	local ARM = LocalPlayer():Armor()

	surface.CreateFont( "ScoreboardText", 40, 250, false, false, "Arial" )
	surface.SetTextColor( 20, 180, 50, 255 )
	surface.SetTextPos( 20, 20 )	
	surface.SetFont( "Arial" )
	surface.DrawText( HP ) 
	
end */
	

// Clientside only stuff goes here