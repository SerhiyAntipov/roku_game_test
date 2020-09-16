sub Main()

	' ###
	' ### Initializes the game engine
	game = new_game(1280, 720, true) ' This initializes the game engine
	m.game = game
	
	' ###
	' ### load bitmap
	game.loadBitmap("basket_left_bottom", "pkg:/sprites/basket_left_bottom.png")
	game.loadBitmap("basket_left_top", "pkg:/sprites/basket_left_top.png")
	game.loadBitmap("basket_right_bottom", "pkg:/sprites/basket_right_bottom.png")
	game.loadBitmap("basket_right_top", "pkg:/sprites/basket_right_top.png")

	game.loadBitmap("chick_01", "pkg:/sprites/chick_01.png")
	game.loadBitmap("chick_02", "pkg:/sprites/chick_02.png")

	game.loadBitmap("egg", "pkg:/sprites/egg.png")
	game.loadBitmap("egg_broken", "pkg:/sprites/egg_broken.png")
	
	game.loadBitmap("game_bg", "pkg:/sprites/game_bg.png")
	game.loadBitmap("lose", "pkg:/sprites/lose.png")

	game.loadBitmap("rabbit_body", "pkg:/sprites/rabbit_body.png")
	game.loadBitmap("rabbit_hend", "pkg:/sprites/rabbit_hend.png")

	game.loadBitmap("wolf_left", "pkg:/sprites/wolf_left.png")
	game.loadBitmap("wolf_right", "pkg:/sprites/wolf_right.png")
	
	game.loadBitmap("room_start_bg", "pkg:/sprites/wolf_start.png")

	' ###
	' ### load sound
	game.loadSound("egg_basket_wav", "pkg:/sounds/egg_basket.wav")
	game.loadSound("egg_chip_wav", "pkg:/sounds/egg_chip.wav")
	game.loadSound("egg_lose_wav", "pkg:/sounds/egg_lose.wav")
	game.loadSound("egg_move_wav", "pkg:/sounds/egg_move.wav")
	game.loadSound("pause_off_wav", "pkg:/sounds/pause_off.wav")
	game.loadSound("pause_on_wav", "pkg:/sounds/pause_on.wav")

	' ###
	' ### load font 
	game.loadFont("font_WORKSHOP_Brush", "WORKSHOP Brush", 40, false, false)
	game.loadFont("font_SF_Digital_Readout", "SF Digital Readout", 36, false, false)
	
	' ###
	' ### load room
	game.defineRoom("room_game", room_game)
	game.defineRoom("room_game_over", room_game_over)
	game.defineRoom("room_start", room_start)
	
	' ###
	' ### load object
	game.defineObject("pause_handler", obj_pause_handler)
	game.defineObject("score_handler", obj_score_handler)
	game.defineObject("eggs_coordinates", obj_eggs_coordinates)
	game.defineObject("wolf_position", obj_wolf_position)
	game.defineObject("eggs_position", obj_eggs_position)
	game.defineObject("libTweener", tweener)
	game.defineObject("catch_game_event", obj_catch_game_event)

	' ###
	' ### initialize tools and controllers
	game.tweener = game.createInstance("libTweener",{persistent:true})

	' ###
	' ### sellect room
	game.changeRoom("room_start")
	' ### ------------------------------------------
	' ### For test
	' game.changeRoom("room_game") 
	' game.changeRoom("room_game_over") 
	' ### ------------------------------------------

	' ###
	' ### start game
	game.Play()
	
end sub