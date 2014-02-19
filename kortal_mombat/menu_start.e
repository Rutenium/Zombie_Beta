note
	description: "Summary description for {MENU_START}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MENU_START

inherit

	SDL_WRAPPER

create
	make_menu_start

feature

	background_menu: IMAGE

	screen: POINTER

	make_menu_start (Screen_make: POINTER;background:POINTER)
		do
			screen := screen_make
			create background_menu.image_create_default (Screen,background, 0, 0)
		end

	menu_spawn (Event_Handler: EVENT)
		local
			ErrorMenu: BOOLEAN
			Trash: INTEGER
		do
			from
				ErrorMenu := false
			until
				ErrorMenu = true
			loop
				from
					Event_Handler.fetch_next
				until
					Event_handler.exhausted
				loop
					If Event_Handler.is_keyboard_down then
						ErrorMenu := true
					end
					Event_Handler.fetch_next
				end
				background_menu.blitsurface
				trash := SDL_Flip (Screen)
			end
		end

end
