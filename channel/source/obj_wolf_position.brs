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
            ' wolf = canvas.DrawRect(520, 260, 100, 300, &hbd4223FF) 
            wolf_left = m.game.getBitmap("wolf_left")
            width = wolf_left.GetWidth()
            height = wolf_left.GetHeight()
            region = CreateObject("roRegion", wolf_left, 0, 0, width, height)
            m.addImage("wolf_left", region,{ offset_x:(1280-width)/2 - 45, offset_y:(720-height)/2 + 80})
            'removeImage("wolf_right")
           
            if m.wolf_position.position_up = true then
                    DrawText(canvas, "wolf up", canvas.GetWidth()/2, canvas.GetHeight()-100, m.game.getFont("default"), "center")
                    backet = canvas.DrawRect(420, 310, 100, 100, &hb007127FF)

                    basket_left_top = m.game.getBitmap("basket_left_top")
                    width = basket_left_top.GetWidth()
                    height = basket_left_top.GetHeight()
                    region = CreateObject("roRegion", basket_left_top, 0, 0, width, height)
                    m.addImage("basket_left_top", region,{ offset_x:(1280-width)/2 - 120, offset_y:(720-height)/2 + 40})

                
                else if m.wolf_position.position_down = true then
                    DrawText(canvas, "wolf down", canvas.GetWidth()/2, canvas.GetHeight()-100, m.game.getFont("default"), "center")
                    backet = canvas.DrawRect(420, 410, 100, 100, &hb007127FF)

                    basket_left_bottom = m.game.getBitmap("basket_left_bottom")
                    width = basket_left_bottom.GetWidth()
                    height = basket_left_bottom.GetHeight()
                    region = CreateObject("roRegion", basket_left_bottom, 0, 0, width, height)
                    m.addImage("basket_left_bottom", region,{ offset_x:(1280-width)/2 - 120, offset_y:(720-height)/2 + 115})
            end if

            ' RIGHT +++++++++++++++++++++++++++++++++++
        else if m.wolf_position.position_right = true then
            DrawText(canvas, "wolf right", canvas.GetWidth()/2, canvas.GetHeight()-50, m.game.getFont("default"), "center")
            
            ' wolf = canvas.DrawRect(620, 260, 100, 300, &hbd4223FF)
            wolf_right = m.game.getBitmap("wolf_right")
            width = wolf_right.GetWidth()
            height = wolf_right.GetHeight()
            region = CreateObject("roRegion", wolf_right, 0, 0, width, height)
            m.addImage("wolf_right", region,{ offset_x:(1280-width)/2 + 55, offset_y:(720-height)/2 + 80})
            'removeImage("wolf_left")
            
                    ' UP ++++++++++++++++++++++++
            if m.wolf_position.position_up = true then
                DrawText(canvas, "wolf up", canvas.GetWidth()/2, canvas.GetHeight()-100, m.game.getFont("default"), "center")
                backet = canvas.DrawRect(720, 310, 100, 100, &hb007127FF)

                basket_right_top = m.game.getBitmap("basket_right_top")
                width = basket_right_top.GetWidth()
                height = basket_right_top.GetHeight()
                region = CreateObject("roRegion", basket_right_top, 0, 0, width, height)
                m.addImage("basket_right_top", region,{ offset_x:(1280-width)/2 + 120, offset_y:(720-height)/2 + 40})

                    ' DOWN ++++++++++++++++++
            else if m.wolf_position.position_down = true then
                DrawText(canvas, "wolf down", canvas.GetWidth()/2, canvas.GetHeight()-100, m.game.getFont("default"), "center")
                backet = canvas.DrawRect(720, 410, 100, 100, &hb007127FF)

                basket_right_bottom = m.game.getBitmap("basket_right_bottom")
                width = basket_right_bottom.GetWidth()
                height = basket_right_bottom.GetHeight()
                region = CreateObject("roRegion", basket_right_bottom, 0, 0, width, height)
                m.addImage("basket_right_bottom", region,{ offset_x:(1280-width)/2 + 120, offset_y:(720-height)/2 + 115})

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