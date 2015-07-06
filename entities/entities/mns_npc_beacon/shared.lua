ENT.Type 		= "anim"
ENT.Base 		= "base_entity"

ENT.PrintName	= "NPC Beacon"
ENT.Author		= "roflwaffle"
ENT.Contact		= "N/A"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false
ENT.RenderGroup 		= RENDERGROUP_OPAQUE

function ENT:SetupDataTables()
	self:NetworkVar( "Bool", 0, "Triggered" )
end

