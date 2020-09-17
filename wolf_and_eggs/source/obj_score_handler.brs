function obj_score_handler(object)

    object.onCreate = function(args)
        
        m.game.createInstance("egg_animated_image")

        m.game.scores = {
            eggs: 0
            lose: 0
        }


        ' ### 
        ' ### Creation egg loss image
        lose_bg = m.game.getBitmap("lose")
        width = lose_bg.GetWidth()
        height = lose_bg.GetHeight()
        region = CreateObject("roRegion", lose_bg, 0, 0, width, height)
        m.addImage("lose_00", region,{ offset_x:(1280-width)/2 + 60, offset_y:(720-height)/2 - 70, alpha: 30, class: "lose"})
        m.addImage("lose_01", region,{ offset_x:(1280-width)/2 + 95, offset_y:(720-height)/2 - 70, alpha: 30, class: "lose"})
        m.addImage("lose_02", region,{ offset_x:(1280-width)/2 + 130, offset_y:(720-height)/2 - 70, alpha: 30, class: "lose"})
    end function

    object.onGameEvent = function(event as string, data as object)
        
        ' ### 
        ' ### If event "lose" global variable entry "m.game.data_side"
        if event = "lose"
            m.game.data_side = data.side
            print m.game.data_side
        end if    

        if event = "score"    
            m.game.scores.eggs =  m.game.scores.eggs + 1
            m.game.playSound("egg_basket_wav", 100)
        elseif event = "lose"
            if data.side = "left" then
                m.game.scores.lose = m.game.scores.lose + 1
                m.game.playSound("egg_lose_wav", 100)
            elseif data.side = "right" then
                m.game.scores.lose = m.game.scores.lose + 1
                m.game.playSound("egg_lose_wav", 100)
            end if   
        end if

        ' ### 
        ' ### Rewriting game speed
        if m.game.scores.eggs > 250 then
            m.game.speed = 500
        elseif m.game.scores.eggs > 225 then
            m.game.speed = 600
        elseif m.game.scores.eggs > 200 then
            m.game.speed = 700
        elseif m.game.scores.eggs > 175 then
            m.game.speed = 800
        elseif m.game.scores.eggs > 150 then
            m.game.speed = 900
        elseif m.game.scores.eggs > 125 then
            m.game.speed = 1000
        elseif m.game.scores.eggs > 100 then
            m.game.speed = 1100
        elseif m.game.scores.eggs > 80 then
            m.game.speed = 1200
        elseif m.game.scores.eggs > 60 then
            m.game.speed = 1300
        elseif m.game.scores.eggs > 40 then
            m.game.speed = 1400
        elseif m.game.scores.eggs <= 20 then
            m.game.speed = 1500
        end if 

        ' ### 
        ' ### Mini pause after egg loss
        if event = "lose" then
            m.game.speed += 1000
        end if 

        ' ### 
        ' ### Drawing egg loss image
        if m.game.scores["lose"] = 1 then
            m.images[0]["alpha"] = 255
        else if m.game.scores["lose"] = 2 then
            m.images[1]["alpha"] = 255
        else if m.game.scores["lose"] = 3 then 
            m.images[2]["alpha"] = 255
        end if

    end function

    object.onUpdate = function(dt)	
	end function

    object.onDrawEnd = function(canvas as object)

        font = m.game.font_SF_Digital_Readout
    
        DrawText(canvas, "Score" + "  " + m.game.scores.eggs.ToStr(), 1280 - 400, 200, font, "right", &h2d2d2dFF)
        ' DrawText(canvas, "Lose " + "  " + m.game.scores.lose.ToStr(), 1280 - 400, 230, font, "right", &h2d2d2dFF)
        
    end function

end function