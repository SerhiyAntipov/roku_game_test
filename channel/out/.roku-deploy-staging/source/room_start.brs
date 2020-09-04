function room_start(object)

	object.onCreate = function(args)
		m.game_started = false

		' m.backgroundURI = ""
		' m.backgroundColor = "6cff00"
	end function

	object.onUpdate = function(dt)
	end function

	' ####  button OK
	object.onDrawBegin = function(canvas)
		if not m.game_started then
			DrawText(canvas, "Press OK", canvas.GetWidth() / 2, canvas.GetHeight() - 50, m.game.getFont("default"), "center")
		end if
	end function

	
	' ####  button <- 
	object.onButton = function(button)
		if button = 0 then
			m.game.End()
		end if
		if not m.game_started and button = 6 then
			m.game_started = true
			m.game.changeRoom("room_game")
		end if
		
	end function

end function