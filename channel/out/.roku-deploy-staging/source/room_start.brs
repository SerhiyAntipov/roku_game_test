function room_start(object)

	object.onCreate = function(args)
		m.game_started = false
		
		'####
		'#### create static backgroung and UI in room
		room_start_bg = m.game.getBitmap("room_start_bg")
		from_x = 0
		from_y = 0
		width = room_start_bg.GetWidth()
		height = room_start_bg.GetHeight()
		region = CreateObject("roRegion", room_start_bg, from_x, from_y, width, height)
		m.addImage("bg", region,{ offset_x:(1280-width)/2, offset_y:(720-height)/2})
	end function

	object.onUpdate = function(dt)
	end function

	' draw lowest layer in game  (below any static sprites)
	object.onDrawBegin = function(canvas)
	end function

	' draw top layer in game  (above any static sprites)
	object.onDrawEnd = function(canvas)
		if m.game_started = false then

			'### 
			'### get fonts 
			m.game.font_WORKSHOP_Brush = m.game.getFont("font_WORKSHOP_Brush")
			m.game.font_SF_Digital_Readout = m.game.getFont("font_SF_Digital_Readout")
			DrawText(canvas, "Press OK to Play", canvas.GetWidth() / 2 - 2, canvas.GetHeight() - 98, m.game.font_WORKSHOP_Brush, "center", &h541b0cFF)
			DrawText(canvas, "Press OK to Play", canvas.GetWidth() / 2, canvas.GetHeight() - 100, m.game.font_WORKSHOP_Brush, "center", &hec4016FF)	
		end if
	end function

	' ####
	' ####  button click "OK" "<-"
	object.onButton = function(code as integer)
		if code = 0 then
			m.game.End()
		end if
		if code = 6 then
			m.game.changeRoom("room_game")
			m.game_started = true
		end if
	end function

end function