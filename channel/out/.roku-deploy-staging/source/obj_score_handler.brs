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
        font = m.game.getFont("default")
        DrawText(canvas, "Score" + "  " + m.game.scores.eggs.ToStr(), 1280 - 500, 200, font, "left", &hec4016FF)
        DrawText(canvas, "Lose  " + "  " + m.game.scores.lose.ToStr(), 1280 - 500, 230, font, "left", &hec4016FF)
    end function

end function