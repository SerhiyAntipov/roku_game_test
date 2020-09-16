function room_game(object)

	object.onCreate = function(args)
		'### 
		'### get fonts 
		m.game.font_SF_Digital_Readout = m.game.getFont("font_SF_Digital_Readout") 
			
		m.game_started = true
		
		m.game.createInstance("pause_handler")
		m.game.createInstance("score_handler")
		m.game.createInstance("eggs_position")
		m.game.createInstance("wolf_position")

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
			' m.game.changeRoom("room_start")	
			m.game.End()
		end if
	end function

end function