function obj_eggs_position(object)

    object.onCreate = function(args)
      
        ' ### Array eggs position
        ' m.game.eggs_position =  CreateObject("roAssociativeArray ")
        m.game.eggs_position = {
            slide_left_top: [0, 0, 0, 0, 0, 0]
            slide_left_bottom: [0, 0, 0, 0, 0, 0]
            slide_right_top: [0, 0, 0, 0, 0, 0]
            slide_right_bottom: [0, 0, 0, 0, 0, 0]
        }


        ' ### Function add random egg 
        m.addRandomEgg = function (object)
            m.game.random_number = RND(3)

            ' random number  = slide position
            if m.game.random_number = 0 then
                m.game.random_slide = "slide_left_top"
            else if m.game.random_number = 1 then
                m.game.random_slide = "slide_left_bottom"
            else if m.game.random_number = 2 then
                m.game.random_slide = "slide_right_top"
            else if m.game.random_number = 3 then
                m.game.random_slide = "slide_right_bottom"
            else
                print "ERROR" 
            end if

            for each item in m.game.eggs_position.Items()
                ' print item.key
                ' print item.value

                if m.game.random_slide = item.key then
                    m.game.eggs_position.[item.key].Unshift(1)
                    m.game.eggs_position.[item.key].Pop()
                else
                    m.game.eggs_position.[item.key].Unshift(0)
                    m.game.eggs_position.[item.key].Pop()
                end if
            end for  
        end function

        ' ### SetInterval & run function addRandomEgg
       
        ' clock = CreateObject("roTimespan")
        ' next_call = clock.TotalMilliseconds() + 1000
        ' while true
        '     msg = wait(250, port) ' wait for a message
        '     if type(msg) = "roSpringboardScreenEvent" then
        '         if msg.isScreenClosed() then
        '             return -1
        '         elseif msg.isButtonPressed()
        '             print "button pressed: ";msg.GetIndex()
        '         else
        '             ' ignore other unknown or uninteresting roSpringBoardScreenEvents
        '         endif
        '     else
        '         ' ignore other events, not type roSpringboardScreenEvent
        '     endif
        '     if clock.TotalMilliseconds() > next_call then
        '         DoSomething()
        '         next_call = clock.TotalMilliseconds() + 5000
        '     end if
        ' end while

        m.addRandomEgg(object)

    end function

    object.onUpdate = function(dt)
    end function

    object.onButton = function(code as integer)
    end function

    object.onDrawBegin = function(canvas)
    end function

    object.onDrawEnd = function(canvas)
    end function

end function