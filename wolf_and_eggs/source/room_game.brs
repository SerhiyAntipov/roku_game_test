function room_game(object)

	object.onCreate = function(args)
		
		'### 
		'### Get fonts 
		m.game.font_SF_Digital_Readout = m.game.getFont("font_SF_Digital_Readout") 
			
		m.game_started = true
		
		m.game.createInstance("pause_handler")
		m.game.createInstance("eggs_position")
		m.game.createInstance("score_handler")
		m.game.createInstance("wolf_position")

		
		' color_bg = m.game.getBitmap("color_bg")
        ' width = color_bg.GetWidth()
        ' height = color_bg.GetHeight()
        ' region = CreateObject("roRegion", color_bg, 0, 0, width, height)
        ' m.addImage("color_bg", region,{ offset_x: 0, offset_y: 0})

	end function

	object.onUpdate = function(dt)		
	end function

	object.onDrawBegin = function(canvas)
	end function

	object.onDrawEnd = function(canvas)
	end function
	
	'###
	'###  click button "<-"" 
	object.onButton = function(button)
		if button = 0 then
			m.game.End()
		end if
	end function

end function