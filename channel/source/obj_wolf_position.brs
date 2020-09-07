function obj_wolf_position(object)

    object.onCreate = function(args)
        m.wolf_position = {
			position_left: false
			position_right: true
			position_up: false
			position_down: true
        }
    end function

    object.onUpdate = function(dt)
    end function
  
    object.onButton = function(code as integer)
        if code = 2 then
            m.wolf_position.position_up = true
            m.wolf_position.position_down = false
        else if code = 3 then
            m.wolf_position.position_down = true
            m.wolf_position.position_up = false
        else if code = 4 then
            m.wolf_position.position_left = true
            m.wolf_position.position_right = false
        else if code = 5 then
            m.wolf_position.position_right = true
            m.wolf_position.position_left = false
		end if		
	end function


    object.onDrawBegin = function(canvas)
        
        if m.wolf_position.position_left = true then
            DrawText(canvas, "wolf left", canvas.GetWidth()/2, canvas.GetHeight()-50, m.game.getFont("default"), "center")
            wolf = canvas.DrawRect(520, 260, 100, 300, &hbd4223FF)

            if m.wolf_position.position_up = true then
                    DrawText(canvas, "wolf up", canvas.GetWidth()/2, canvas.GetHeight()-100, m.game.getFont("default"), "center")
                    backet = canvas.DrawRect(420, 160, 100, 100, &hb007127FF)
                
                else if m.wolf_position.position_down = true then
                    DrawText(canvas, "wolf down", canvas.GetWidth()/2, canvas.GetHeight()-100, m.game.getFont("default"), "center")
                    backet = canvas.DrawRect(420, 560, 100, 100, &hb007127FF)
            end if
        else if m.wolf_position.position_right = true then
            DrawText(canvas, "wolf right", canvas.GetWidth()/2, canvas.GetHeight()-50, m.game.getFont("default"), "center")
            wolf = canvas.DrawRect(620, 260, 100, 300, &hbd4223FF)

            if m.wolf_position.position_up = true then
                DrawText(canvas, "wolf up", canvas.GetWidth()/2, canvas.GetHeight()-100, m.game.getFont("default"), "center")
                backet = canvas.DrawRect(720, 160, 100, 100, &hb007127FF)
            else if m.wolf_position.position_down = true then
                DrawText(canvas, "wolf down", canvas.GetWidth()/2, canvas.GetHeight()-100, m.game.getFont("default"), "center")
                backet = canvas.DrawRect(720, 560, 100, 100, &hb007127FF)
            end if
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