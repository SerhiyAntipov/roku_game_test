function obj_wolf_position(object)

    object.onCreate = function(args)
        'game bg 
        game_bg = m.game.getBitmap("game_bg")
        width = game_bg.GetWidth()
        height = game_bg.GetHeight()
        region = CreateObject("roRegion", game_bg, 0, 0, width, height)
        m.addImage("game_bg", region,{ offset_x:(1280-width)/2, offset_y:(720-height)/2})

        ' array wolf posistion
        m.wolf_position = {
			position_left: true
			position_right: false
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
        bg_rect = canvas.DrawRect(0, 0, 1280, 720, &hc3c2bfFF)
    end function  

    object.onDrawEnd = function(canvas)
        ' ########### wolf left 
        if m.wolf_position.position_left = true then
            ' img 
            wolf_left = m.game.getBitmap("wolf_left")
            width = wolf_left.GetWidth()
            height = wolf_left.GetHeight()
            region = CreateObject("roRegion", wolf_left, 0, 0, width, height)
            m.addImage("wolf_left_image", region,{ offset_x:(1280-width)/2 - 55, offset_y:(720-height)/2 + 70})
            ' m.getImage("wolf_left_image")
            ' text 
            DrawText(canvas, "wolf left", canvas.GetWidth()/2, canvas.GetHeight()-50, m.game.getFont("default"), "center")
 
            ' ########### wolf left + left top basket 
            if m.wolf_position.position_up = true then
                ' img 
                basket_left_top = m.game.getBitmap("basket_left_top")
                width = basket_left_top.GetWidth()
                height = basket_left_top.GetHeight()
                region = CreateObject("roRegion", basket_left_top, 0, 0, width, height)
                m.addImage("basket_left_top_image", region,{ offset_x:(1280-width)/2 - 125, offset_y:(720-height)/2 + 20})
                'text + rect
                DrawText(canvas, "wolf up", canvas.GetWidth()/2, canvas.GetHeight()-100, m.game.getFont("default"), "center")
                backet = canvas.DrawRect(400, 350, 50, 50, &hb007127FF)

            ' ########### wolf left + left bottom basket     
            elseif m.wolf_position.position_down = true then
                ' img             
                basket_left_bottom = m.game.getBitmap("basket_left_bottom")
                width = basket_left_bottom.GetWidth()
                height = basket_left_bottom.GetHeight()
                region = CreateObject("roRegion", basket_left_bottom, 0, 0, width, height)
                m.addImage("basket_left_bottom_image", region,{ offset_x:(1280-width)/2 - 125, offset_y:(720-height)/2 + 98})
                 'text + rect
                DrawText(canvas, "wolf down", canvas.GetWidth()/2, canvas.GetHeight()-100, m.game.getFont("default"), "center")
                backet = canvas.DrawRect(400, 450, 50, 50, &hb007127FF)
            
            endif

        ' ########### wolf right
        elseif m.wolf_position.position_right = true then
            'img 
            wolf_right = m.game.getBitmap("wolf_right")
            width = wolf_right.GetWidth()
            height = wolf_right.GetHeight()
            region = CreateObject("roRegion", wolf_right, 0, 0, width, height)
            m.addImage("wolf_right_image", region,{ offset_x:(1280-width)/2 + 62, offset_y:(720-height)/2 + 67})
            'text + rect
            DrawText(canvas, "wolf right", canvas.GetWidth()/2, canvas.GetHeight()-50, m.game.getFont("default"), "center")
            ' wolf = canvas.DrawRect(620, 260, 100, 300, &hbd4223FF)
            'removeImage("wolf_left")
            
            ' ########### wolf right + right top basket   
            if m.wolf_position.position_up = true then
                'img     
                basket_right_top = m.game.getBitmap("basket_right_top")
                width = basket_right_top.GetWidth()
                height = basket_right_top.GetHeight()
                region = CreateObject("roRegion", basket_right_top, 0, 0, width, height)
                m.addImage("basket_right_top_image", region,{ offset_x:(1280-width)/2 + 130, offset_y:(720-height)/2 + 30})
                'text + rect
                DrawText(canvas, "wolf up", canvas.GetWidth()/2, canvas.GetHeight()-100, m.game.getFont("default"), "center")
                backet = canvas.DrawRect(830, 350, 50, 50, &hb007127FF)

            ' ########### wolf right + right bottom basket 
            elseif m.wolf_position.position_down = true then
                ' img
                basket_right_bottom = m.game.getBitmap("basket_right_bottom")
                width = basket_right_bottom.GetWidth()
                height = basket_right_bottom.GetHeight()
                region = CreateObject("roRegion", basket_right_bottom, 0, 0, width, height)
                m.addImage("basket_right_bottom_image", region,{ offset_x:(1280-width)/2 + 125, offset_y:(720-height)/2 + 105})
                ' text + rect
                DrawText(canvas, "wolf down", canvas.GetWidth()/2, canvas.GetHeight()-100, m.game.getFont("default"), "center")
                backet = canvas.DrawRect(830, 450, 50, 50, &hb007127FF)
            end if
        end if
    end function

end function