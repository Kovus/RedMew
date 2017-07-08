require "util"
require "locale/utils/event"
require "config"
require "locale/utils/utils"
require "base_data"
require "chatlog"
require "info"
require "player_list"
require "poll"
require "band"
require "fish_market"
require "train_station_names"
require "score"
require "map_layout"
require "custom_commands"
require "nuke_control"



function player_joined(event)
	local player = game.players[event.player_index]
		player.insert { name = "raw-fish", count = 4 }
	    player.insert { name = "iron-gear-wheel", count = 8 }
	    player.insert { name = "iron-plate", count = 16 }
	    --player.insert { name = "pistol", count = 1 }
	    --player.insert { name = "firearm-magazine", count = 8 }
		--player.insert { name = "train-stop", count = 16 }
		--player.insert { name = "roboport", count = 16 }
		--player.insert { name = "construction-robot", count = 16 }
		--player.insert { name = "solar-panel", count = 16 }
		--player.insert { name = "substation", count = 16 }
		--player.insert { name = "logistic-chest-passive-provider", count = 16 }
		--player.insert { name = "power-armor", count = 1 }
		player.print("Welcome to our Server. You can join our Discord at: discord.me/redmew")
		player.print("And remember.. Keep Calm And Spaghetti!")
end

function walkabout(player_name, distance)
		game.player.print("This command moved to /walkabout.")
end
--function player_respawned(event)
	--local player = game.players[event.player_index]
	--player.insert { name = "pistol", count = 1 }
	--player.insert { name = "firearm-magazine", count = 10 }
--end

Event.register(defines.events.on_research_finished, function (event)
	local research = event.research
	if global.scenario.config.logistic_research_enabled then
		research.force.technologies["logistic-system"].enabled=true
	else
	    research.force.technologies["logistic-system"].enabled=false
	end
end)

Event.register(defines.events.on_player_created, player_joined)
Event.register(defines.events.on_player_respawned, player_respawned)
