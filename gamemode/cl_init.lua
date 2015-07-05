include( 'shared.lua' )

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