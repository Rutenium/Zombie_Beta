note
	description: "Summary description for {EVENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	EVENT

inherit

	SDL_WRAPPER

create
	event_handler

feature

	SDL_Event: POINTER

	Erreur: INTEGER

	Right_Pressed, Left_Pressed, Down_Pressed, Up_Pressed, Space_Pressed, Escape_Pressed, Return_Pressed: BOOLEAN

	event_handler ()
		local
			memmory_manager: POINTER
		do
			SDL_Event := memmory_manager.memory_calloc (1, sizeofevent)
		end

	handle: BOOLEAN
		local
			Error: BOOLEAN
		do
			from
				error := false
				fetch_next
			until
				exhausted
			loop
				if is_keyboard_up then
					key_up
				end
				if is_keyboard_down then
					key_down --(SDL_GetKey(Event_Handler.get_event))
				end
				if is_quit then
					Error := true
				end
				fetch_next
			end
			result := Error
		end

	set_escaped_pressed (yo: BOOLEAN)
		do
			Escape_Pressed := yo
		end

	fetch_next
		do
			return_value := SDL_PollEvent (SDL_event)
		end

	exhausted: BOOLEAN
		do
			result := return_value = 0
		end

	mouse_event (mouse: POINTER)
		local
		do
			io.put_natural_16 (SDL_GetMouseX (mouse))
			io.new_line
			io.put_natural_16 (SDL_GetMouseY (mouse))
			io.new_line
		end

	key_down
		local
			key: POINTER
		do
			key := SDL_GetKey (SDL_event)
			if SDL_GetKeySym (key) = SDLK_RETURN then
				Return_Pressed := true
			end
			if SDL_GetKeySym (key) = SDLK_ESCAPE then
				Escape_Pressed := true
			end
			if SDL_GetKeySym (key) = SDLK_SPACE then
				Space_Pressed := true
			end
			if SDL_GetKeySym (key) = SDLK_RIGHT then
				Right_Pressed := true
				Up_pressed := false
				left_pressed := false
				down_pressed := false
			end
			if SDL_GetKeySym (Key) = SDLK_UP then
				Up_Pressed := true
				Right_Pressed := false
				left_pressed := false
				down_pressed := false
			end
			if SDL_GetKeySym (Key) = SDLK_DOWN then
				Down_Pressed := true
				Right_Pressed := false
				Up_pressed := false
				left_pressed := false
			end
			if SDL_GetKeySym (Key) = SDLK_LEFT then
				Left_Pressed := true
				Right_Pressed := false
				Up_pressed := false
				down_pressed := false
			end
		end

	key_up
		local
			key: POINTER
		do
			key := SDL_GetKey (SDL_event)
			if SDL_GetKeySym (key) = SDLK_RETURN then
				Return_Pressed := false
			end
			if SDL_GetKeySym (key) = SDLK_SPACE then
				Space_Pressed := false
			end
			if SDL_GetKeySym (key) = SDLK_RIGHT then
				Right_Pressed := false
			end
			if SDL_GetKeySym (Key) = SDLK_UP then
				Up_Pressed := false
			end
			if SDL_GetKeySym (Key) = SDLK_DOWN then
				Down_Pressed := false
			end
			if SDL_GetKeySym (Key) = SDLK_LEFT then
				Left_Pressed := false
			end
			if SDL_GetKeySym (key) = SDLK_ESCAPE then
				Escape_Pressed := false
			end
		end

	is_keyboard_down: BOOLEAN
		local
		do
			if type = SDL_KEYDOWN then
				Result := true
			else
				Result := false
			end
		end

	is_keyboard_up: BOOLEAN
		local
		do
			if type = SDL_KEYUP then
				Result := true
			else
				Result := false
			end
		end

	is_mouse_button_down: BOOLEAN
		local
		do
			if type = SDL_MOUSEBUTTONDOWN then
				Result := true
			else
				Result := false
			end
		end

	is_mouse_button_up: BOOLEAN
		local
		do
			if type = SDL_MOUSEBUTTONUP then
				Result := true
			else
				Result := false
			end
		end

	is_quit: BOOLEAN
		do
			if type = SDL_QUIT then
				Result := true
			else
				result := false
			end
		end

	get_event: POINTER
		do
			result := SDL_event
		end

	type: NATURAL_8
		do
			result := get_sdl_type (SDL_Event)
		end

	return_value: INTEGER

end
