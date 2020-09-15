function obj_clock(object)

    ' object.timerColor =  &h00FF00FF
    ' m.timerColor = &h0000FFFF
    ' m.stats.timer = "00:00"
    ' m.stats.seconds = 0
    ' m._started = true
    
    ' object.onDrawEnd = function(canvas as object)
    '     font = m.game.getFont("default")
    '     DrawText(canvas,  m.stats.timer, 140, 3, font, "left", m.timerColor)
    ' end function
    
    ' object.onUpdate = function(dt)
    '     m._dt = dt
    '     if m._started 
    '         m.stats.timer = m.game_timer.GetFormattedTime()
    '         m.stats.seconds = m.game_timer.TotalSeconds()
    '     end if
    ' end function
    
    
    ' object.onPause = function()
    '     m.timerColor = &h0000FFFF
    ' end function
    
    ' object.onResume = function(paused_time)
    '     m.timerColor = &h00FF00FF
    '     m.game_timer.RemoveTime(paused_time)
    ' end function


    object.onCreate = function(args)
        m.clock = "00:00"
    end function

    object.onUpdate = function(dt)
    end function
  
    object.onButton = function(code as integer)
	end function

    object.onDrawBegin = function(canvas)
        ' timer = CreateObject("roTimespan")
        ' timer = timer.Mark()
        ' timerData = timer.TotalMilliseconds()
        ' timer.GetSecondsToISO8601Date(str)
        ' timer = timer.ToStr()
        ' Print timer
       
        DrawText(canvas, m.clock, canvas.GetWidth()/2, 230, m.game.font_SF_Digital_Readout, "center", &h2d2d2dFF)
    end function  

    object.onDrawEnd = function(canvas)
        
    end function

end function