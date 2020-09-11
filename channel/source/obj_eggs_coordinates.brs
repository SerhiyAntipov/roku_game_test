function obj_eggs_coordinates(object)

    object.onCreate = function(args)

        ' ###
        ' ### Eggs img position 
        egg = m.game.getBitmap("egg")
        width = egg.GetWidth() 'only for ofset width
        height = egg.GetHeight() 'only for ofset height

        ' ### Eggs position array 
        m.game.eggs_position_img = {}
        m.game.eggs_position_img.slide_left_top = []
        m.game.eggs_position_img.slide_left_top[0] = { offset_x:(1280-width)/2-245, offset_y:(720-height)/2-50, rotation: 0 }
        m.game.eggs_position_img.slide_left_top[1] = { offset_x:(1280-width)/2-217, offset_y:(720-height)/2-42, rotation: 45 }
        m.game.eggs_position_img.slide_left_top[2] = { offset_x:(1280-width)/2-193, offset_y:(720-height)/2-28, rotation: 90 }
        m.game.eggs_position_img.slide_left_top[3] = { offset_x:(1280-width)/2-173, offset_y:(720-height)/2-10, rotation: 135 }
        m.game.eggs_position_img.slide_left_top[4] = { offset_x:(1280-width)/2-158, offset_y:(720-height)/2 + 8, rotation: 180 }
        m.game.eggs_position_img.slide_left_top[5] = { offset_x:(1280-width)/2-138, offset_y:(720-height)/2 + 23, rotation: 0 }
        m.game.eggs_position_img.slide_left_bottom = []
        m.game.eggs_position_img.slide_left_bottom[0] = { offset_x:(1280-width)/2-241, offset_y:(720-height)/2+30, rotation: 0 }
        m.game.eggs_position_img.slide_left_bottom[1] = { offset_x:(1280-width)/2-213, offset_y:(720-height)/2+38, rotation: 45 }
        m.game.eggs_position_img.slide_left_bottom[2] = { offset_x:(1280-width)/2-189, offset_y:(720-height)/2+52, rotation: 90 }
        m.game.eggs_position_img.slide_left_bottom[3] = { offset_x:(1280-width)/2-169, offset_y:(720-height)/2+70, rotation: 135 }
        m.game.eggs_position_img.slide_left_bottom[4] = { offset_x:(1280-width)/2-154, offset_y:(720-height)/2 + 88, rotation: 180 }
        m.game.eggs_position_img.slide_left_bottom[5] = { offset_x:(1280-width)/2-134, offset_y:(720-height)/2 + 103, rotation: 0 }
        m.game.eggs_position_img.slide_right_top = []
        m.game.eggs_position_img.slide_right_top[0] = { offset_x:(1280-width)/2+255, offset_y:(720-height)/2-50, rotation: 65 }
        m.game.eggs_position_img.slide_right_top[1] = { offset_x:(1280-width)/2+227, offset_y:(720-height)/2-42, rotation: 20 }
        m.game.eggs_position_img.slide_right_top[2] = { offset_x:(1280-width)/2+203, offset_y:(720-height)/2-26, rotation: -25 }
        m.game.eggs_position_img.slide_right_top[3] = { offset_x:(1280-width)/2+183, offset_y:(720-height)/2-7, rotation: -70 }
        m.game.eggs_position_img.slide_right_top[4] = { offset_x:(1280-width)/2+175, offset_y:(720-height)/2 + 16, rotation: -135 }
        m.game.eggs_position_img.slide_right_top[5] = { offset_x:(1280-width)/2+148, offset_y:(720-height)/2 + 23, rotation: 0 }
        m.game.eggs_position_img.slide_right_bottom = []
        m.game.eggs_position_img.slide_right_bottom[0] = { offset_x:(1280-width)/2+251, offset_y:(720-height)/2+30, rotation: 65 }
        m.game.eggs_position_img.slide_right_bottom[1] = { offset_x:(1280-width)/2+223, offset_y:(720-height)/2+38, rotation: 20 }
        m.game.eggs_position_img.slide_right_bottom[2] = { offset_x:(1280-width)/2+199, offset_y:(720-height)/2+55, rotation: -25 }
        m.game.eggs_position_img.slide_right_bottom[3] = { offset_x:(1280-width)/2+179, offset_y:(720-height)/2+75, rotation: -70 }
        m.game.eggs_position_img.slide_right_bottom[4] = { offset_x:(1280-width)/2+170, offset_y:(720-height)/2 + 98, rotation: -135 }
        m.game.eggs_position_img.slide_right_bottom[5] = { offset_x:(1280-width)/2+144, offset_y:(720-height)/2 + 103, rotation: 0 }
    end function

end function