function obj_wolf_position(object)

    object.onCreate = function(args)
        
        '###
        '### Create game bg 
        game_bg = m.game.getBitmap("game_bg")
        width = game_bg.GetWidth()
        height = game_bg.GetHeight()
        region = CreateObject("roRegion", game_bg, 0, 0, width, height)
        m.addImage("game_bg", region,{ offset_x:(1280-width)/2, offset_y:(720-height)/2})
        
        '###
        '### Create array wolf posistion
        m.wolf_position = {
			position_left: true
			position_right: false
			position_up: false
			position_down: true
        }
        
        '###    
        '### Create img  wolf + basket
        wolf_left = m.game.getBitmap("wolf_left")
        width = wolf_left.GetWidth()
        height = wolf_left.GetHeight()
        region = CreateObject("roRegion", wolf_left, 0, 0, width, height)
        m.addImage("wolf_left_image", region,{ offset_x:(1280-width)/2 - 55, offset_y:(720-height)/2 + 70, alpha: 0, class: "wolf"})

        wolf_right = m.game.getBitmap("wolf_right")
        width = wolf_right.GetWidth()
        height = wolf_right.GetHeight()
        region = CreateObject("roRegion", wolf_right, 0, 0, width, height)
        m.addImage("wolf_right_image", region,{ offset_x:(1280-width)/2 + 62, offset_y:(720-height)/2 + 67, alpha: 0, class: "wolf"})

        basket_left_top = m.game.getBitmap("basket_left_top")
        width = basket_left_top.GetWidth()
        height = basket_left_top.GetHeight()
        region = CreateObject("roRegion", basket_left_top, 0, 0, width, height)
        m.addImage("basket_left_top_image", region,{ offset_x:(1280-width)/2 - 125, offset_y:(720-height)/2 + 20, alpha: 0, class: "basket"})
        
        basket_left_bottom = m.game.getBitmap("basket_left_bottom")
        width = basket_left_bottom.GetWidth()
        height = basket_left_bottom.GetHeight()
        region = CreateObject("roRegion", basket_left_bottom, 0, 0, width, height)
        m.addImage("basket_left_bottom_image", region,{ offset_x:(1280-width)/2 - 125, offset_y:(720-height)/2 + 98, alpha: 0, class: "basket"})

        basket_right_top = m.game.getBitmap("basket_right_top")
        width = basket_right_top.GetWidth()
        height = basket_right_top.GetHeight()
        region = CreateObject("roRegion", basket_right_top, 0, 0, width, height)
        m.addImage("basket_right_top_image", region,{ offset_x:(1280-width)/2 + 130, offset_y:(720-height)/2 + 30, alpha: 0, class: "basket"})

        basket_right_bottom = m.game.getBitmap("basket_right_bottom")
        width = basket_right_bottom.GetWidth()
        height = basket_right_bottom.GetHeight()
        region = CreateObject("roRegion", basket_right_bottom, 0, 0, width, height)
        m.addImage("basket_right_bottom_image", region,{ offset_x:(1280-width)/2 + 125, offset_y:(720-height)/2 + 105, alpha: 0, class: "basket"})

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
        
        '###
        '### Create bg Rect
        bg_rect = canvas.DrawRect(0, 0, 1280, 720, &hc3c2bfFF)
    end function  

    object.onDrawEnd = function(canvas)
        
        '###
        '### wolf left position
        if m.wolf_position.position_left = true then
            wolf_left_image = m.getImage("wolf_left_image")
            wolf_left_image.alpha = 255
            wolf_right_image = m.getImage("wolf_right_image")
            wolf_right_image.alpha = 0
            ' print text 
            DrawText(canvas, "wolf left", canvas.GetWidth()/2, canvas.GetHeight()-50,  m.game.getFont("font_WORKSHOP_Brush"), "center", &hec4016FF)
           
            '###
            '### wolf left + left top basket position
            if m.wolf_position.position_up = true then                 
                basket_left_top = m.getImage("basket_left_top_image")
                basket_left_top.alpha = 255
                basket_left_bottom = m.getImage("basket_left_bottom_image")
                basket_left_bottom.alpha = 0
                basket_right_top = m.getImage("basket_right_top_image")
                basket_right_top.alpha = 0
                basket_right_bottom = m.getImage("basket_right_bottom_image")
                basket_right_bottom.alpha = 0
                'print text
                DrawText(canvas, "wolf up", canvas.GetWidth()/2, canvas.GetHeight()-100, m.game.getFont("font_WORKSHOP_Brush"), "center", &hec4016FF)
            
            '###
            '### wolf left + left bottom basket position 
            elseif m.wolf_position.position_down = true then
                basket_left_top = m.getImage("basket_left_top_image")
                basket_left_top.alpha = 0
                basket_left_bottom = m.getImage("basket_left_bottom_image")
                basket_left_bottom.alpha = 255
                basket_right_top = m.getImage("basket_right_top_image")
                basket_right_top.alpha = 0
                basket_right_bottom = m.getImage("basket_right_bottom_image")
                basket_right_bottom.alpha = 0
                'print text
                DrawText(canvas, "wolf down", canvas.GetWidth()/2, canvas.GetHeight()-100, m.game.getFont("font_WORKSHOP_Brush"), "center", &hec4016FF)
            endif
        '###
        '### wolf right position
        elseif m.wolf_position.position_right = true then           
            wolf_right_image = m.getImage("wolf_right_image")
            wolf_right_image.alpha = 255
            wolf_left_image = m.getImage("wolf_left_image")
            wolf_left_image.alpha = 0
            'print text
            DrawText(canvas, "wolf right", canvas.GetWidth()/2, canvas.GetHeight()-50, m.game.getFont("font_WORKSHOP_Brush"), "center", &hec4016FF)
            
            '###
            '### wolf right + right top basket position
            if m.wolf_position.position_up = true then
                basket_left_top = m.getImage("basket_left_top_image")
                basket_left_top.alpha = 0
                basket_left_bottom = m.getImage("basket_left_bottom_image")
                basket_left_bottom.alpha = 0
                basket_right_top = m.getImage("basket_right_top_image")
                basket_right_top.alpha = 255
                basket_right_bottom = m.getImage("basket_right_bottom_image")
                basket_right_bottom.alpha = 0
                'print text
                DrawText(canvas, "wolf up", canvas.GetWidth()/2, canvas.GetHeight()-100, m.game.getFont("font_WORKSHOP_Brush"), "center", &hec4016FF)

            '###
            '### wolf right + right bottom basket position 
            elseif m.wolf_position.position_down = true then
                basket_left_top = m.getImage("basket_left_top_image")
                basket_left_top.alpha = 0
                basket_left_bottom = m.getImage("basket_left_bottom_image")
                basket_left_bottom.alpha = 0
                basket_right_top = m.getImage("basket_right_top_image")
                basket_right_top.alpha = 0
                basket_right_bottom = m.getImage("basket_right_bottom_image")
                basket_right_bottom.alpha = 255
                'print text
                DrawText(canvas, "wolf down", canvas.GetWidth()/2, canvas.GetHeight()-100, m.game.getFont("font_WORKSHOP_Brush"), "center", &hec4016FF)
            end if
        end if
    end function

end function