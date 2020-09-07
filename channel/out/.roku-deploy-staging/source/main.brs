sub Main()
	game = new_game(1280, 720, true) ' This initializes the game engine
	game.loadBitmap("bg_game", "pkg:/sprites/bg_game.png")
	game.loadBitmap("room_start_bg", "pkg:/sprites/wolf_start.png")

	game.loadSound("button_press_mp3", "pkg:/sounds/button_press.wav")
	game.loadSound("button_press_mp3", "pkg:/sounds/button_press.wav")
	game.loadSound("button_press_mp3", "pkg:/sounds/button_press.wav")
	
	game.defineRoom("room_game", room_game)
	game.defineRoom("room_start", room_start)

	
	game.defineObject("pause_handler", obj_pause_handler)
	game.defineObject("score_handler", obj_score_handler)
	game.defineObject("wolf_position", obj_wolf_position)
	
	game.changeRoom("room_start")
	game.Play()
end sub