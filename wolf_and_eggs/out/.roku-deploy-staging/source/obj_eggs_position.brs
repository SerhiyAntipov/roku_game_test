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
        ' ### Parse JSON and add to num array
        eggs_position_link_json = "pkg:/config/eggs_coordinates.json"
		m.game.eggs_position_img = ParseJSON(ReadAsciiFile(eggs_position_link_json))

        ' ### 
        ' ### Variable for the sounds of the first 5 egg addition cycles
        m.cycle = 0

        ' ###
        ' ### Render eggs 
        m.renderEggs = function ()

            ' ### Create egg img object 
            egg = m.game.getBitmap("egg")
            region = CreateObject("roRegion", egg, 0, 0, egg.GetWidth(), egg.GetHeight())

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
                for i = 0 to item_value.Count()-1 step i + 1  
                    if item_key = "slide_left_top" then
                        name_img = "slide_left_top"
                    elseif item_key = "slide_left_bottom" then
                        name_img = "slide_left_bottom"
                    elseif item_key = "slide_right_top" then
                        name_img = "slide_right_top"
                    elseif item_key = "slide_right_bottom" then
                        name_img = "slide_right_bottom"
                    end if

                    alpha_value =  30
                       
                    ' ### Last eggs unvisible - only for triggering en event 
                    if i = item_value.Count() - 1  then
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
        m.renderEggs()
 
        ' ### 
        ' ### Create clon all eggs img
        m.cloneEggsImg = function ()      
            m.allEggsImg = {}
            m.allEggsImg.slide_left_top = []
            m.allEggsImg.slide_left_bottom = []
            m.allEggsImg.slide_right_top = []
            m.allEggsImg.slide_right_bottom = []
        
            for i = 0 to  m.images.Count()-1 step i + 1 
                if m.images[i]["class"] = "slide_left_top" then
                    m.allEggsImg.slide_left_top.push(m.images[i])
                elseif m.images[i]["class"] = "slide_left_bottom"  then
                    m.allEggsImg.slide_left_bottom.push(m.images[i])
                elseif m.images[i]["class"] = "slide_right_top"  then
                    m.allEggsImg.slide_right_top.push(m.images[i])
                elseif m.images[i]["class"] = "slide_right_bottom"  then
                    m.allEggsImg.slide_right_bottom.push(m.images[i])
                end if
            end for

        end function
        m.cloneEggsImg()


        ' ### 
        ' ### Draw active eggs
        m.drawActiveEggs = function ()

            ' ### For each 1 leyer 
            for each item in m.game.eggs_position_array.Items() 
   
                item_key = item.key
                item_value = item.value
                
                ' ### For 2 leyer 
                for  i = 0 to m.game.eggs_position_array[item_key].Count()-1 step i + 1 
                                       
                    ' ### Visuble eggs equal "1" in array "m.game.eggs_position_array"
                    if m.game.eggs_position_array[item_key][i] = 1 then
                        m.allEggsImg[item_key][i]["alpha"] = 255
                    else 
                        m.allEggsImg[item_key][i]["alpha"] = 30
                    end if

                    ' ### Last eggs unvisible - only for triggering en event 
                    if i = m.game.eggs_position_array[item_key].Count()-1  then
                        m.allEggsImg[item_key][i]["alpha"] = 0
                    end if
                end for

            end for    

        end function

        ' ### Note --------------------------------
        ' ### SetTimeout
        ' m.game.speed = 1000  ' game speed

        ' ###
        ' ### option 1 - using custom acltions
        ' queue = Sequence(m)
		' queue.addAction(DelayTime(m, m.game.speed))
        ' queue.addAction(CallFunc(m, {param:"optional data"}, function(host,data)
        '     host.addRandomEgg()
        '     host.drawActiveEggs()
        ' end function))

        ' LoopAction(m,queue).Run()
        ' ### Note -------------------------------- 
    
        ' ###
        ' ### Using roTimeSpan
        m.game.speed = 1500
        m.game.timer=createobject("roTimeSpan")
        m.game.timer.mark()
        
    end function

    object.onUpdate = function(dt)

        ' ### 
        ' ### Function starts up to 3 lost eggs 
        ' ### If there are more than 3 lost eggs go to the "room_game_over" page
        if m.game.scores["lose"] <= 3 then  
            if m.game.timer.TotalMilliseconds() >= m.game.speed
                m.timerFunc(m.game.timer.TotalMilliseconds())
                m.game.timer.mark()
            end if
        else 
            m.game.started = false        
            m.game.changeRoom("room_game_over")    
        end if 
    end function

    object.timerFunc = function(elapsed)
        ' print "call timerFunc after: " ; elapsed
        m.addRandomEgg()
        m.drawActiveEggs()
       
        ' ### 
        ' ### For the sounds of the first 5 egg addition cycles
        if m.cycle < 5 then
            m.game.playSound("egg_move_wav", 100)
            m.cycle++
        endif

        ' ### 
        ' ### Catch game event
        m.game.createInstance("catch_game_event")
    end function
     
    object.onButton = function(code as integer)
    end function

    object.onDrawBegin = function(canvas)
    end function

    object.onDrawEnd = function(canvas)
    end function

end function