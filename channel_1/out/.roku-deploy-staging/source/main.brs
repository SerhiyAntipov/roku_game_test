sub Main()

	' ###
	' ### Initializes the game engine
	game = new_game(1280, 720, true) ' This initializes the game engine
	m.game = game
	
	' ###
	' ### load bitmap
	game.loadBitmap("room_start_bg", "pkg:/sprites/wolf_start.png")
	game.loadBitmap("game_bg", "pkg:/sprites/game_bg.png")
	game.loadBitmap("wolf_right", "pkg:/sprites/wolf_right.png")
	game.loadBitmap("wolf_left", "pkg:/sprites/wolf_left.png")
	game.loadBitmap("basket_right_top", "pkg:/sprites/basket_right_top.png")
	game.loadBitmap("basket_right_bottom", "pkg:/sprites/basket_right_bottom.png")
	game.loadBitmap("basket_left_top", "pkg:/sprites/basket_left_top.png")
	game.loadBitmap("basket_left_bottom", "pkg:/sprites/basket_left_bottom.png")
	game.loadBitmap("egg", "pkg:/sprites/egg.png")
	game.loadBitmap("loss", "pkg:/sprites/loss.png")
	game.loadBitmap("numbers", "pkg:/sprites/numbers.png")
	game.loadBitmap("number_bg", "pkg:/sprites/number_bg.png")
	
	' ###
	' ### load sound
	game.loadSound("button_press_wav", "pkg:/sounds/button_press.wav")
	game.loadSound("button_press_wav", "pkg:/sounds/button_press.wav")
	game.loadSound("button_press_wav", "pkg:/sounds/button_press.wav")

	' ###
	' ### load font 
	game.loadFont("font_WORKSHOP_Brush", "WORKSHOP Brush", 40, false, false)
	game.loadFont("font_SF_Digital_Readout", "SF Digital Readout", 36, false, false)
	
	' ###
	' ### load room
	game.defineRoom("room_game", room_game)
	game.defineRoom("room_start", room_start)

	' ###
	' ### load object
	game.defineObject("pause_handler", obj_pause_handler)
	game.defineObject("score_handler", obj_score_handler)
	game.defineObject("eggs_coordinates", obj_eggs_coordinates)
	game.defineObject("wolf_position", obj_wolf_position)
	game.defineObject("eggs_position", obj_eggs_position)
	game.defineObject("clock", obj_clock)
	game.defineObject("libTweener", tweener)
	game.defineObject("catch_game_event", obj_catch_game_event)

	' ###
	' ### initialize tools and controllers
	game.tweener = game.createInstance("libTweener",{persistent:true})

	' ###
	' ### sellect room
	game.changeRoom("room_start")

	' ###
	' ### start game
	game.Play()
	
end sub