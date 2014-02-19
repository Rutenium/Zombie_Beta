note
	description : "kortal_mombat application root class"
	date        : "$Date$"
	revision    : "$Revision$"

class
	APPLICATION

inherit
	SDL_WRAPPER
create
	make

feature {NONE} -- Initialization

	make
		local
			Screen:POINTER
			Screen_width,Screen_height,i,trash:INTEGER
			Error:BOOLEAN
			Event_Handler:EVENT
			Background:IMAGE
			Wave:WAVE
			affichage:AFFICHAGE
			Zombie_list:LINKED_LIST[TUPLE[x,y,orientation:INTEGER]]
			timer:RANDOM
			--TIME RELATED
			time:INTEGER
			personnage:PERSONNAGE
			menu_start:MENU_START
			liste_balle:BALLE
			collision:COLLISION
			image_background,image_personnage,background_menu:POINTER
			path_c:C_STRING
		do
			trash:=SDL_init(SDL_INIT_VIDEO_TIMER)
			Event_Handler:=create{EVENT}.event_handler
			Screen_width:=1386
			Screen_height:=792
			Screen:=screen_create(Screen_width,Screen_height)

			create path_c.make ("background.bmp")
			image_background:=SDL_LoadBMP(path_c.item)
			create background.image_create_default (Screen,image_background,0,0)

			create affichage.make_affichage (Screen)
			affichage.allocate_memmory
			create wave.make_wave (1,screen)

			create path_c.make ("personnage.bmp")
			image_personnage:=SDL_LoadBMP(path_c.item)
			create personnage.make_personnage(Screen,image_personnage)

			create path_c.make ("background_menu.bmp")
			background_menu:=SDL_LoadBMP(path_c.item)
			create menu_start.make_menu_start (Screen,background_menu)

			wave.spawn
			create timer.make
			create liste_balle.make_balle (Screen)
			create collision.make_collision
			menu_start.menu_spawn(Event_Handler)
			time:=SDL_GetTicks.to_integer_32
			timer.set_seed (time)
			wave.set_initial_position (timer)
			personnage.set_position (300, 300)
			from
				i:=0
			until
				error=true
			loop
				error:=event_handler.handle
				if event_handler.up_pressed or event_handler.down_pressed or event_handler.right_pressed or event_handler.left_pressed then
					personnage.move (event_handler)
				end
				if event_handler.space_pressed then
					personnage.shoot(liste_balle)
				end
				if event_Handler.escape_pressed then
					error:=true
				end
				background.blitsurface
				liste_balle.move
				wave.move (personnage)
				collision.zombie_balle (wave, liste_balle)
				Affichage.zombie (wave.wave)
				Affichage.balle (liste_balle.balle_list)
				affichage.ammunition (liste_balle)
				personnage.blitsurface_personnage
				trash:=SDL_Flip(Screen)
				SDL_Delay(1)
			end
			affichage.allocated_memmory.memory_free
			Background.destroy
			SDL_Quit_bye
		end

end
