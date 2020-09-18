function obj_score_handler(object)

    object.onCreate = function(args)
    
        ' m.game.createInstance("egg_animated_image")
            
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
        
        if event = "score"    
            m.game.scores.eggs =  m.game.scores.eggs + 1
            m.game.playSound("egg_basket_wav", 100)
        elseif event = "lose"
            if data.side = "left" then
' ##########################################
' ###
		' ### Add animated image left
		egg_broken_left = m.game.getBitmap("egg_broken_left")
		chick_left_01 = m.game.getBitmap("chick_left_01")
		chick_left_02 = m.game.getBitmap("chick_left_02")
		chick_left_03 = m.game.getBitmap("chick_left_03")
		chick_left_04 = m.game.getBitmap("chick_left_04")

		egg_broken_region_0 = CreateObject("roRegion", egg_broken_left, 0, 0, egg_broken_left.GetWidth(), egg_broken_left.GetHeight())
		egg_broken_region_1 = CreateObject("roRegion", chick_left_01, 0, 0, chick_left_01.GetWidth(), chick_left_01.GetHeight())
		egg_broken_region_2 = CreateObject("roRegion", chick_left_02, 0, 0, chick_left_02.GetWidth(), chick_left_02.GetHeight())
		egg_broken_region_3 = CreateObject("roRegion", chick_left_03, 0, 0, chick_left_03.GetWidth(), chick_left_03.GetHeight())
		egg_broken_region_4 = CreateObject("roRegion", chick_left_04, 0, 0, chick_left_04.GetWidth(), chick_left_04.GetHeight())
	
		m.game.animatedImage_left_egg = m.addAnimatedImage("animated_left_egg_image", [
			egg_broken_region_0,
			egg_broken_region_1, 
			egg_broken_region_2, 
			egg_broken_region_3, 
			egg_broken_region_4 
			],{
                index: 0
				offset_x: 1280/2 - 282,
				offset_y: 470, 
				animation_speed: 1500,
				animation_tween: "LinearTween",
				alpha: 255,
                ' enabled: false,
                loopAnimation: false
			})
' ##########################################
                m.game.scores.lose = m.game.scores.lose + 1
                m.game.playSound("egg_lose_wav", 100)
                ' m.game.animatedimage_left_egg.enabled = true
            elseif data.side = "right" then
' ##########################################
  ' ###
		' ### Add animated image right
		egg_broken_right = m.game.getBitmap("egg_broken_right")
		chick_right_01 = m.game.getBitmap("chick_right_01")
		chick_right_02 = m.game.getBitmap("chick_right_02")
		chick_right_03 = m.game.getBitmap("chick_right_03")
		chick_right_04 = m.game.getBitmap("chick_right_04")

		egg_broken_region_0 = CreateObject("roRegion", egg_broken_right, 0, 0, egg_broken_right.GetWidth(), egg_broken_right.GetHeight())
		egg_broken_region_1 = CreateObject("roRegion", chick_right_01, 0, 0, chick_right_01.GetWidth(), chick_right_01.GetHeight())
		egg_broken_region_2 = CreateObject("roRegion", chick_right_02, 0, 0, chick_right_02.GetWidth(), chick_right_02.GetHeight())
		egg_broken_region_3 = CreateObject("roRegion", chick_right_03, 0, 0, chick_right_03.GetWidth(), chick_right_03.GetHeight())
		egg_broken_region_4 = CreateObject("roRegion", chick_right_04, 0, 0, chick_right_04.GetWidth(), chick_right_04.GetHeight())
	
		m.game.animatedImage_right_egg = m.addAnimatedImage("animated_right_egg_image", [
			egg_broken_region_0,
			egg_broken_region_1, 
			egg_broken_region_2, 
			egg_broken_region_3,
			egg_broken_region_4
			],{ 
                index: 0
				offset_x: 1280/2 + 135,
				offset_y: 470, 
				animation_speed: 1500,
				animation_tween: "LinearTween",
				alpha: 255,
                ' enabled: false,
                loopAnimation: false
			})
' ##########################################
                m.game.scores.lose = m.game.scores.lose + 1
                m.game.playSound("egg_lose_wav", 100)
                ' m.game.animatedimage_right_egg.enabled = true
            end if   
        end if

        ' ### 
        ' ### If event "lose" global variable entry "m.game.data_side"
        if event = "lose"
            m.game.data_side = data.side
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
        ' ### Mini pause after egg lose
        if event = "lose" then
            m.game.speed += 1000
        end if 

        ' ### 
        ' ### Drawing egg lose image
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