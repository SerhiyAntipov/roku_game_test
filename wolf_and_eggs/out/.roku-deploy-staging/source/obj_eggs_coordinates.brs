function obj_eggs_coordinates(object)

    object.onCreate = function(args)

        ' ###
        ' ### Eggs img position 
        egg = m.game.getBitmap("egg") 'only for ofset
        width = egg.GetWidth() 'only for ofset width
        height = egg.GetHeight() 'only for ofset height

        ' ### Eggs position array 
        m.game.eggs_position_img = {}
        m.game.eggs_position_img.slide_left_top = [
                { offset_x:(1280-width)/2-248, offset_y:(720-height)/2-52, rotation: 0 }
                { offset_x:(1280-width)/2-221, offset_y:(720-height)/2-44, rotation: 45 }
                { offset_x:(1280-width)/2-195, offset_y:(720-height)/2-30, rotation: 90 }
                { offset_x:(1280-width)/2-173, offset_y:(720-height)/2-10, rotation: 135 }
                { offset_x:(1280-width)/2-158, offset_y:(720-height)/2+12, rotation: 180 }
                { offset_x:(1280-width)/2-138, offset_y:(720-height)/2+26, rotation: 0 }
            ]
        m.game.eggs_position_img.slide_left_bottom = [
                { offset_x:(1280-width)/2-248, offset_y:(720-height)/2+28, rotation: 0 }
                { offset_x:(1280-width)/2-221, offset_y:(720-height)/2+34, rotation: 45 }
                { offset_x:(1280-width)/2-195, offset_y:(720-height)/2+48, rotation: 90 }
                { offset_x:(1280-width)/2-173, offset_y:(720-height)/2+68, rotation: 135 }
                { offset_x:(1280-width)/2-158, offset_y:(720-height)/2+90, rotation: 180 }
                { offset_x:(1280-width)/2-138, offset_y:(720-height)/2+112, rotation: 0 }
        ]
        m.game.eggs_position_img.slide_right_top = [
            { offset_x:(1280-width)/2+257, offset_y:(720-height)/2-53, rotation: 65 }
            { offset_x:(1280-width)/2+231, offset_y:(720-height)/2-44, rotation: 20 }
            { offset_x:(1280-width)/2+207, offset_y:(720-height)/2-28, rotation: -25 }
            { offset_x:(1280-width)/2+187, offset_y:(720-height)/2-8, rotation: -70 }
            { offset_x:(1280-width)/2+178, offset_y:(720-height)/2 + 15, rotation: -135 }
            { offset_x:(1280-width)/2+148, offset_y:(720-height)/2 + 23, rotation: 0 }
        ]
        m.game.eggs_position_img.slide_right_bottom = [
            { offset_x:(1280-width)/2+255, offset_y:(720-height)/2+27, rotation: 65 }
            { offset_x:(1280-width)/2+229, offset_y:(720-height)/2+36, rotation: 20 }
            { offset_x:(1280-width)/2+205, offset_y:(720-height)/2+52, rotation: -25 }
            { offset_x:(1280-width)/2+186, offset_y:(720-height)/2+71, rotation: -70 }
            { offset_x:(1280-width)/2+180, offset_y:(720-height)/2 + 92, rotation: -135 }
            { offset_x:(1280-width)/2+151, offset_y:(720-height)/2 + 101, rotation: 0 }
        ]
    end function

end function