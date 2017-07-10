Event.register(-1, function()
if global.scenario.variables == nil then global.scenario.variables = {} end
global.scenario.variables.mods = {
	sanctorio = "",
}
global.scenario.variables.regulars = {
	helpower2 = "",
}
end)


function is_mod(player_name)
	return not (global.scenario.variables.mods[player_name] == nil)
end

function is_regular(player_name)
	return not (global.scenario.variables.regulars[player_name] == nil)
end

function add_regular(player_name)
	if is_regular(player_name) then game.player.print(player_name .. " was already a regular.")
	else
		game.print(game.player.name .. " promoted " .. player_name .. " to regular.")
	end
	global.scenario.variables.regulars[player_name] = ""
end

function add_mod(player_name)
	if is_mod(player_name) then game.player.print(player_name .. " was already a moderator.")
	else
		game.print(game.player.name .. " promoted " .. player_name .. " to moderator.")
	end
	global.scenario.variables.mods[player_name] = ""
end

function remove_regular(player_name)
	if is_regular(player_name) then game.print(player_name .. " was demoted from regular by " .. game.player.name .. ".") end
	global.scenario.variables.regulars[player_name] = nil
end

function remove_mod(player_name)
	if is_mod(player_name) then game.print(player_name .. " was demoted from mod by " .. game.player.name .. ".") end
	global.scenario.variables.mods[player_name] = nil
end

function print_regulars()
	for k,_ in pairs(global.scenario.variables.regulars) do
		game.player.print(k)
	end
end

function print_mods()
	for k,_ in pairs(global.scenario.variables.mods) do
		game.player.print(k)
	end
end
