function obj_score_handler(object)

    object.onCreate = function(args)
        m.game.scores = {
            eggs: 0
            lose: 0
        }
    end function

    object.onGameEvent = function(event as string, data as object)
        if event = "score"
            m.scores.eggs++
        else if event = "lose"
            m.scores.lose++
        end if
    end function

    object.onDrawEnd = function(canvas as object)
        font = m.game.font_SF_Digital_Readout
        DrawText(canvas, "Score" + "  " + m.game.scores.eggs.ToStr(), 1280 - 400, 200, font, "right", &h2d2d2dFF)
        DrawText(canvas, "Lose " + "  " + m.game.scores.lose.ToStr(), 1280 - 400, 230, font, "right", &h2d2d2dFF)
    end function

end function