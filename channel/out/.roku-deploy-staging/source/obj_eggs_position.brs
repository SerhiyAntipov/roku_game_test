function obj_eggs_position(object)

    object.onCreate = function(args)  

        ' ###   
        ' ### Create array eggs position
        m.game.eggs_position_array = {
            slide_left_top: [0, 0, 0, 0, 0, 0]
            slide_left_bottom: [0, 0, 0, 0, 0, 0]
            slide_right_top: [0, 0, 0, 0, 0, 0]
            slide_right_bottom: [0, 0, 0, 0, 0, 0]
        }

        ' ###
        ' ### Function add random egg 
        m.addRandomEgg = function ()
            m.game.random_number = RND(4)
            m.game.random_number = m.game.random_number-1

            ' ###
            ' ### Random number = slide position
            if m.game.random_number = 0 then
                m.game.random_slide = "slide_left_top"
            else if m.game.random_number = 1 then
                m.game.random_slide = "slide_left_bottom"
            else if m.game.random_number = 2 then
                m.game.random_slide = "slide_right_top"
            else if m.game.random_number = 3 then
                m.game.random_slide = "slide_right_bottom"
            end if

            for each item in m.game.eggs_position_array.Items()
                 if m.game.random_slide = item.key then
                    m.game.eggs_position_array.[item.key].Unshift(1)
                    m.game.eggs_position_array.[item.key].Pop()
                else
                    m.game.eggs_position_array.[item.key].Unshift(0)
                    m.game.eggs_position_array.[item.key].Pop()
                end if
            end for  
           
        end function

        ' ### 
        ' ### Get eggs coordinates 
        m.game.createInstance("eggs_coordinates")

        ' ###
        ' ### Render eggs 
        m.renderEggs = function ()

            ' ### Create egg img object 
            egg = m.game.getBitmap("egg")
            width = egg.GetWidth()
            height = egg.GetHeight()
            region = CreateObject("roRegion", egg, 0, 0, width, height)

            ' ### Default offset value 
            offset_x_value = ""
            offset_y_value = ""
            rotation_value = ""

            ' ### For each 1 layer "m.game.eggs_position_img"
            for each item in m.game.eggs_position_img.Items() 
   
                item_key = item.key
                item_value = item.value

                name_img = ""                

                ' ### For 2 layer
                for i = 0 to item_value.Count()-1 step +1  
                    if item_key = "slide_left_top" then
                        name_img = "slide_left_top"
                    elseif item_key = "slide_left_bottom" then
                        name_img = "slide_left_bottom"
                    elseif item_key = "slide_right_top" then
                        name_img = "slide_right_top"
                    elseif item_key = "slide_right_bottom" then
                        name_img = "slide_right_bottom"
                    end if

                    alpha_value =  255
                    ' ### Visuble eggs equal "1" in array "m.game.eggs_position_array"
                    if m.game.eggs_position_array[item_key][i] = 0 then
                        alpha_value =  50
                    elseif m.game.eggs_position_array[item_key][i] = 1 then
                        alpha_value =  255
                    end if
    
                    ' ### Last eggs unvisible - only for triggering en event 
                    if i = item_value.Count()-1  then
                        alpha_value =  0
                    end if
                   
                    ' ### For each 3 layer
                    for each item in m.game.eggs_position_img.[item_key][i].Items()
                        if item.key = "offset_x" then
                            offset_x_value = item.value
                        elseif item.key = "offset_y" then
                            offset_y_value = item.value
                        elseif item.key = "rotation" then
                            rotation_value = item.value
                        end if
                    end for

                    m.addImage( name_img.ToStr() + "_" + i.ToStr(), region,{ offset_x: offset_x_value, offset_y: offset_y_value, alpha: alpha_value, rotation: rotation_value, class: name_img.ToStr(), img_id: i})

                end for 
            end for

        end function
        
        m.addRandomEgg()
        m.addRandomEgg()
        m.addRandomEgg()
        m.addRandomEgg()
        m.addRandomEgg()
        m.renderEggs()

        ' ###
        ' ### SetTimeout
        m.game.speed = 1000  ' game speed
        ' queue = Sequence(m)
        '     queue.addAction(DelayTime(m, delay))
        '     queue.addAction(CallFunc(m,{evt:"evt_name"},function(host,data)
        '         'host - is your calling object


        '         'example of scope processing
        '         globalm = GetGlobalAA()
        '         globalm.game.postGameEvent(data.evt, {foo:"bar"})

        '     end function))
        ' queue.Run()
    
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