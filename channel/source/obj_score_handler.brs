function obj_score_handler(object)

    object.scores = {
        player: 0
    }

    object.onCreate = function(args)
    end function

    object.onGameEvent = function(event as string, data as object)
        if event = "score"
            m.scores.player++
        end if
    end function

    object.onDrawEnd = function(canvas as object)
        font = m.game.getFont("default")
        DrawText(canvas, "score" + "  " + m.scores.player.ToStr(), 1280 - 100, 100, font, "center")
    end function

end function