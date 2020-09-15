function obj_catch_game_event(object)

	object.onCreate = function(args)
		
		for each item in m.game.eggs_position_array.Items()
			item_key = item.key
			item_value = item.value

			lastArrayEllement = m.game.eggs_position_array[item_key].Count()-1

			if m.game.eggs_position_array[item_key][lastArrayEllement] = 1 then
				   
				if item_key = "slide_left_top" and m.game.wolf_position["position_left"] = true and m.game.wolf_position["position_top"] = true then
					m.game.postGameEvent("score")
				elseif item_key = "slide_left_bottom" and m.game.wolf_position["position_left"] = true and m.game.wolf_position["position_bottom"] = true then
					m.game.postGameEvent("score")
				elseif item_key = "slide_right_top"  and m.game.wolf_position["position_right"] = true and m.game.wolf_position["position_top"] = true then
					m.game.postGameEvent("score")
				elseif item_key = "slide_right_bottom"  and m.game.wolf_position["position_right"] = true and m.game.wolf_position["position_bottom"] = true then
					m.game.postGameEvent("score")
				elseif  item_key = "slide_left_top"  or item_key = "slide_left_bottom" and m.game.wolf_position["position_left"] = false then
					m.game.postGameEvent("lose", {side: "left"})
				elseif  item_key = "slide_right_top"  or item_key = "slide_right_bottom" and m.game.wolf_position["position_right"] = false then
					m.game.postGameEvent("lose", {side: "right"})
				end if
				
			end if

		end for

	end function

	object.onUpdate = function(dt)		
	end function

	object.onDrawBegin = function(canvas)	

	end function

	object.onDrawEnd = function(canvas)
	end function
	
	object.onButton = function(button)
	end function

end function