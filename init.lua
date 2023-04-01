local nom = function(user)
	local hp = user:get_hp()
	if hp < 20 then
		user:set_hp(hp+1)
	end
end

minetest.register_tool("breadpick:diamondpick", {
	description = "Diamond Breadpickaxe",
	inventory_image = "diamond_breadpick.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=2.0, [2]=1.0, [3]=0.50}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1},
	
	on_secondary_use = function(itemstack, user, pointed_thing)
		nom(user)
	end,
	
	on_place = function(itemstack, placer, pointed_thing)
		nom(placer)
	end
})

minetest.register_craft({
	output = "breadpick:diamondpick",
	recipe = {
		{"default:pick_diamond", "farming:bread"}
	}
})