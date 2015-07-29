ENT.Type 		= "anim"
ENT.Base 		= "base_entity"

ENT.PrintName	= "NPC Beacon"
ENT.Author		= "jpz"
ENT.Contact		= "N/A"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false
ENT.RenderGroup 		= RENDERGROUP_OPAQUE

MNS_NPCS = {
	{ mns_name = 'Zombie', mns_string = 'npc_zombie' },
	{ mns_name = 'Poison Zombie', mns_string = 'npc_poisonzombie' },
	{ mns_name = 'Combine Soldier (Pulsegun)', mns_string = 'npc_combine_s', weapons = { 'ai_weapon_ar2' } },
	{ mns_name = 'Combine Soldier (Shotgun', mns_string = 'npc_combine_s', weapons = { 'ai_weapon_shotgun' } },
	{ mns_name = 'Manhack', mns_string = 'npc_manhack' }
}

function ENT:SetupDataTables()
	self:NetworkVar( "Bool", 0, "Triggered" )
	self:NetworkVar( "Int", 0, "State" )
	self:NetworkVar( "Int", 0, "LastThink" )
	self:NetworkVar( "Int", 0, "IdleLimit" )
	self:NetworkVar( "Int", 0, "SpawnLimit" )
	self:NetworkVar( "Int", 0, "WarningLimit" )
	self:NetworkVar( "Int", 0, "HasteLimit" )
end


