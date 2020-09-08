function room_game(object)

	object.onCreate = function(args)
		
		m.game.createInstance("pause_handler")
		m.game.createInstance("score_handler")
		m.game.createInstance("wolf_position")

		m.game_started = true
	end function

	object.onUpdate = function(dt)		
	end function

	object.onDrawBegin = function(canvas)	
	end function

	object.onDrawEnd = function(canvas)
	
	end function
		
	' ####  button <- 
	object.onButton = function(button)
		if button = 0 then
			m.game.changeRoom("room_start")	
			' m.game.End()
		end if
	end function

		' Back	0	100	1000
		' Up	2	102	1002
		' Down	3	103	1003
		' Left	4	104	1004
		' Right	5	105	1005
		' Select	6	106	1006
		' Instant Replay	7	107	1007
		' Rewind	8	108	1008
		' Fast Forward	9	109	1009
		' Info	10	110	1010
		' Play	13	113	1013
end function