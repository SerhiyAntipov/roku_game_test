function obj_score_handler(object)

    object.onCreate = function(args)
        m.game.scores = {
            eggs: 0
            lose: 0
        }
    end function

    object.onGameEvent = function(event as string, data as object)
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
            m.game.speed = 1000
        elseif m.game.scores.eggs > 200 then
            m.game.speed = 1100
        elseif m.game.scores.eggs > 150 then
            m.game.speed = 1200
        elseif m.game.scores.eggs > 100 then
            m.game.speed = 1300
        elseif m.game.scores.eggs > 50 then
            m.game.speed = 1400
        end if    
    end function

    object.onDrawEnd = function(canvas as object)
        font = m.game.font_SF_Digital_Readout
        DrawText(canvas, "Score" + "  " + m.game.scores.eggs.ToStr(), 1280 - 400, 200, font, "right", &h2d2d2dFF)
        DrawText(canvas, "Lose " + "  " + m.game.scores.lose.ToStr(), 1280 - 400, 230, font, "right", &h2d2d2dFF)
    end function

end function