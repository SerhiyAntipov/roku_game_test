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
                { offset_x:(1280-width)/2-245, offset_y:(720-height)/2-50, rotation: 0 }
                { offset_x:(1280-width)/2-217, offset_y:(720-height)/2-42, rotation: 45 }
                { offset_x:(1280-width)/2-193, offset_y:(720-height)/2-28, rotation: 90 }
                { offset_x:(1280-width)/2-173, offset_y:(720-height)/2-10, rotation: 135 }
                { offset_x:(1280-width)/2-158, offset_y:(720-height)/2 + 8, rotation: 180 }
                { offset_x:(1280-width)/2-138, offset_y:(720-height)/2 + 23, rotation: 0 }
            ]
        m.game.eggs_position_img.slide_left_bottom = [
                { offset_x:(1280-width)/2-241, offset_y:(720-height)/2+30, rotation: 0 }
                { offset_x:(1280-width)/2-213, offset_y:(720-height)/2+38, rotation: 45 }
                { offset_x:(1280-width)/2-189, offset_y:(720-height)/2+52, rotation: 90 }
                { offset_x:(1280-width)/2-169, offset_y:(720-height)/2+70, rotation: 135 }
                { offset_x:(1280-width)/2-154, offset_y:(720-height)/2 + 88, rotation: 180 }
                { offset_x:(1280-width)/2-134, offset_y:(720-height)/2 + 103, rotation: 0 }
        ]
        m.game.eggs_position_img.slide_right_top = [
            { offset_x:(1280-width)/2+255, offset_y:(720-height)/2-50, rotation: 65 }
            { offset_x:(1280-width)/2+227, offset_y:(720-height)/2-42, rotation: 20 }
            { offset_x:(1280-width)/2+203, offset_y:(720-height)/2-26, rotation: -25 }
            { offset_x:(1280-width)/2+183, offset_y:(720-height)/2-7, rotation: -70 }
            { offset_x:(1280-width)/2+175, offset_y:(720-height)/2 + 16, rotation: -135 }
            { offset_x:(1280-width)/2+148, offset_y:(720-height)/2 + 23, rotation: 0 }
        ]
        m.game.eggs_position_img.slide_right_bottom = [
            { offset_x:(1280-width)/2+251, offset_y:(720-height)/2+30, rotation: 65 }
            { offset_x:(1280-width)/2+223, offset_y:(720-height)/2+38, rotation: 20 }
            { offset_x:(1280-width)/2+199, offset_y:(720-height)/2+55, rotation: -25 }
            { offset_x:(1280-width)/2+179, offset_y:(720-height)/2+75, rotation: -70 }
            { offset_x:(1280-width)/2+170, offset_y:(720-height)/2 + 98, rotation: -135 }
            { offset_x:(1280-width)/2+144, offset_y:(720-height)/2 + 103, rotation: 0 }
        ]
    end function

end function