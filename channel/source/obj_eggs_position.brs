function obj_eggs_position(object)

    object.onCreate = function(args)     
        ' ### Array eggs position
        ' m.game.eggs_position_array =  CreateObject("roAssociativeArray ")
        m.game.eggs_position_array = {
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

            for each item in m.game.eggs_position_array.Items()
                ' print item.key
                ' print item.value

                if m.game.random_slide = item.key then
                    m.game.eggs_position_array.[item.key].Unshift(1)
                    m.game.eggs_position_array.[item.key].Pop()
                else
                    m.game.eggs_position_array.[item.key].Unshift(0)
                    m.game.eggs_position_array.[item.key].Pop()
                end if
            end for  
        end function
        m.addRandomEgg(object)
        m.addRandomEgg(object)
        m.addRandomEgg(object)
        m.addRandomEgg(object)
        m.addRandomEgg(object)
        m.addRandomEgg(object)
        
        m.game.speed = 1000  ' game speed

        ' ###
        ' ### SetTimeout
        ' queue = Sequence(m)
        '     queue.addAction(DelayTime(m, delay))
        '     queue.addAction(CallFunc(m,{evt:"evt_name"},function(host,data)
        '         'host - is your calling object


        '         'example of scope processing
        '         globalm = GetGlobalAA()
        '         globalm.game.postGameEvent(data.evt, {foo:"bar"})

        '     end function))
        ' queue.Run()

        ' ###
        ' ### eggs img position 
        egg = m.game.getBitmap("egg")
        width = egg.GetWidth()
        height = egg.GetHeight()
        region = CreateObject("roRegion", egg, 0, 0, width, height)

        m.game.eggs_position_img = {}
        m.game.eggs_position_img.slide_left_top = []
        m.game.eggs_position_img.slide_left_top[0] = { offset_x:(1280-width)/2-245, offset_y:(720-height)/2-50, rotation: 0 }
        m.game.eggs_position_img.slide_left_top[1] = { offset_x:(1280-width)/2-217, offset_y:(720-height)/2-42, rotation: 45 }
        m.game.eggs_position_img.slide_left_top[2] = { offset_x:(1280-width)/2-193, offset_y:(720-height)/2-28, rotation: 90 }
        m.game.eggs_position_img.slide_left_top[3] = { offset_x:(1280-width)/2-173, offset_y:(720-height)/2-10, rotation: 135 }
        m.game.eggs_position_img.slide_left_top[4] = { offset_x:(1280-width)/2-158, offset_y:(720-height)/2 + 8, rotation: 180 }
       
        ' ###
        ' ### Render Eggs 
        for i = 0 to m.game.eggs_position_img.slide_left_top.Count()-1 step +1

            ' if array data = 1 alpha_value =  50
            
            alpha_value =  255
            offset_x_value = ""
            offset_y_value = ""
            rotation_value = ""
            for each item in m.game.eggs_position_img.slide_left_top[i].Items()
                if item.key = "offset_x" then
                    offset_x_value = item.value
                elseif item.key = "offset_y" then
                    offset_y_value = item.value
                elseif item.key = "rotation" then
                    rotation_value = item.value
                end if
            end for 
            m.addImage( "egg_lt_" + i.ToStr(), region,{ offset_x: offset_x_value, offset_y: offset_y_value, alpha: alpha_value, rotation: rotation_value, class: "egg"})
        end for    
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