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
		start_field = canvas.DrawRect(240, 160, 800, 400, &hbd4223FF)
	
		if m.game_started = false then
			DrawText(canvas, "Press OK to Play", canvas.GetWidth()/2, canvas.GetHeight()-50, m.game.getFont("default"), "center")
		end if
	end function

	
	' ####  button <- 
	object.onButton = function(code as integer)
		if code = 0 then
			m.game.End()
		end if
		if  code = 6 then
			m.game.changeRoom("room_game")
			m.game_started = true
		end if
		
	end function

end function