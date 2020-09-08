function room_start(object)

	object.onCreate = function(args)
		m.game_started = false
		'#### create static backgroung and UI in room

		'1 - get reference to texture (loaded png, jpeg, etc)
		room_start_bg = m.game.getBitmap("room_start_bg")
		'2 - define area left top corner, width and height in texture to draw
		' in thise case - whole image
		from_x = 0
		from_y = 0
		width = room_start_bg.GetWidth()
		height = room_start_bg.GetHeight()
		'3 - create region from texture for render in game
		region = CreateObject("roRegion", room_start_bg, from_x, from_y, width, height)
		'4 - add image to current object (room stage)
		'more: https://github.com/Romans-I-XVI/Roku-gameEngine#addimageimage_name-as-string-region-as-object-args-as-object-insert_position-as-integer
		m.addImage("bg", region,{ 	offset_x:(1280-width)/2, 
									offset_y:(720-height)/2})
	end function

	object.onUpdate = function(dt)
	end function

	' ####  button OK
	' draw lowest layer in game  (below any static sprites)
	object.onDrawBegin = function(canvas)
		canvas.DrawRect(240, 160, 800, 400, &hbd4223FF)
	end function

	' draw top layer in game  (above any static sprites)
	object.onDrawEnd = function(canvas)
		if m.game_started = false then
			DrawText(canvas, "Press OK to Play", canvas.GetWidth() / 2, canvas.GetHeight() - 50, m.game.getFont("default"), "center")
		end if
	end function


	' ####  button <-
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