function obj_wolf_position(object)

    object.onCreate = function(args)
       
        '###
        '### Create game bg 
        color_bg = m.game.getBitmap("color_bg")
        width = color_bg.GetWidth()
        height = color_bg.GetHeight()
        region = CreateObject("roRegion", color_bg, 0, 0, width, height)
        m.addImage("color_bg", region,{ offset_x: 0, offset_y: 0})


        game_bg = m.game.getBitmap("game_bg")
        width = game_bg.GetWidth()
        height = game_bg.GetHeight()
        region = CreateObject("roRegion", game_bg, 0, 0, width, height)
        m.addImage("game_bg", region,{ offset_x:(1280-width)/2, offset_y:(720-height)/2})
        
        '###
        '### Create array wolf posistion
        m.game.wolf_position = {
			position_left: true
			position_right: false
			position_top: false
			position_bottom: true
        }
        
        '###    
        '### Create img  wolf + basket
        wolf_left = m.game.getBitmap("wolf_left")
        width = wolf_left.GetWidth()
        height = wolf_left.GetHeight()
        region = CreateObject("roRegion", wolf_left, 0, 0, width, height)
        m.addImage("wolf_left_image", region,{ offset_x:(1280-width)/2 - 60, offset_y:(720-height)/2 + 67, alpha: 15, class: "wolf"})

        wolf_right = m.game.getBitmap("wolf_right")
        width = wolf_right.GetWidth()
        height = wolf_right.GetHeight()
        region = CreateObject("roRegion", wolf_right, 0, 0, width, height)
        m.addImage("wolf_right_image", region,{ offset_x:(1280-width)/2 + 60, offset_y:(720-height)/2 + 67, alpha: 15, class: "wolf"})

        basket_left_top = m.game.getBitmap("basket_left_top")
        width = basket_left_top.GetWidth()
        height = basket_left_top.GetHeight()
        region = CreateObject("roRegion", basket_left_top, 0, 0, width, height)
        m.addImage("basket_left_top_image", region,{ offset_x:(1280-width)/2 - 125, offset_y:(720-height)/2 + 15, alpha: 15, class: "basket"})
        
        basket_left_bottom = m.game.getBitmap("basket_left_bottom")
        width = basket_left_bottom.GetWidth()
        height = basket_left_bottom.GetHeight()
        region = CreateObject("roRegion", basket_left_bottom, 0, 0, width, height)
        m.addImage("basket_left_bottom_image", region,{ offset_x:(1280-width)/2 - 125, offset_y:(720-height)/2 + 90, alpha: 15, class: "basket"})

        basket_right_top = m.game.getBitmap("basket_right_top")
        width = basket_right_top.GetWidth()
        height = basket_right_top.GetHeight()
        region = CreateObject("roRegion", basket_right_top, 0, 0, width, height)
        m.addImage("basket_right_top_image", region,{ offset_x:(1280-width)/2 + 125, offset_y:(720-height)/2 + 15, alpha: 15, class: "basket"})

        basket_right_bottom = m.game.getBitmap("basket_right_bottom")
        width = basket_right_bottom.GetWidth()
        height = basket_right_bottom.GetHeight()
        region = CreateObject("roRegion", basket_right_bottom, 0, 0, width, height)
        m.addImage("basket_right_bottom_image", region,{ offset_x:(1280-width)/2 + 125, offset_y:(720-height)/2 + 90, alpha: 15, class: "basket"})

        '###    
        '### Create clone img
        m.wolf_left_image = m.getImage("wolf_left_image")
        m.wolf_right_image = m.getImage("wolf_right_image")
        m.basket_left_top = m.getImage("basket_left_top_image")
        m.basket_left_bottom = m.getImage("basket_left_bottom_image")
        m.basket_right_top = m.getImage("basket_right_top_image")
        m.basket_right_bottom = m.getImage("basket_right_bottom_image")

    end function
  
    object.onButton = function(code as integer)
        if code = 2 then
            m.game.wolf_position.position_top = true
            m.game.wolf_position.position_bottom = false
        else if code = 3 then
            m.game.wolf_position.position_bottom = true
            m.game.wolf_position.position_top = false
        else if code = 4 then
            m.game.wolf_position.position_left = true
            m.game.wolf_position.position_right = false
        else if code = 5 then
            m.game.wolf_position.position_right = true
            m.game.wolf_position.position_left = false
        end if
	end function

    object.onUpdate = function(dt) 
    end function

    object.onDrawBegin = function(canvas)      
    end function  

    object.onDrawEnd = function(canvas)
       
        '###
        '### wolf left position
        if m.game.wolf_position.position_left = true then
            m.wolf_left_image.alpha = 255
            m.wolf_right_image.alpha = 15
            ' print text 
            ' DrawText(canvas, "wolf left", canvas.GetWidth()/2, canvas.GetHeight()-70,  m.game.font_SF_Digital_Readout, "center", &h2d2d2dFF)
           
            '###
            '### wolf left + left top basket position
            if m.game.wolf_position.position_top = true then                 
                m.basket_left_top.alpha = 255
                m.basket_left_bottom.alpha = 15
                m.basket_right_top.alpha = 15
                m.basket_right_bottom.alpha = 15
                'print text
                ' DrawText(canvas, "basket top", canvas.GetWidth()/2, canvas.GetHeight()-100, m.game.font_SF_Digital_Readout, "center", &h2d2d2dFF)
            
            '###
            '### wolf left + left bottom basket position 
            elseif m.game.wolf_position.position_bottom = true then
                m.basket_left_top.alpha = 15
                m.basket_left_bottom.alpha = 255
                m.basket_right_top.alpha = 15
                m.basket_right_bottom.alpha = 15
                'print text
                ' DrawText(canvas, "basket bottom", canvas.GetWidth()/2, canvas.GetHeight()-100, m.game.font_SF_Digital_Readout, "center", &h2d2d2dFF)
            endif
        
        '###
        '### wolf right position
        elseif m.game.wolf_position.position_right = true then           
            m.wolf_right_image.alpha = 255
            m.wolf_left_image.alpha = 15
            'print text
            ' DrawText(canvas, "wolf right", canvas.GetWidth()/2, canvas.GetHeight()-70, m.game.font_SF_Digital_Readout, "center", &h2d2d2dFF)
            
            '###
            '### wolf right + right top basket position
            if m.game.wolf_position.position_top = true then
                m.basket_left_top.alpha = 15
                m.basket_left_bottom.alpha = 15
                m.basket_right_top.alpha = 255
                m.basket_right_bottom.alpha = 15
                'print text
                ' DrawText(canvas, "basket top", canvas.GetWidth()/2, canvas.GetHeight()-100, m.game.font_SF_Digital_Readout, "center", &h2d2d2dFF)

            '###
            '### wolf right + right bottom basket position 
            elseif m.game.wolf_position.position_bottom = true then
                m.basket_left_top.alpha = 15
                m.basket_left_bottom.alpha = 15
                m.basket_right_top.alpha = 15
                m.basket_right_bottom.alpha = 255
                'print text
                ' DrawText(canvas, "basket bottom", canvas.GetWidth()/2, canvas.GetHeight()-100, m.game.font_SF_Digital_Readout, "center", &h2d2d2dFF)
            end if
        end if

    end function

end function