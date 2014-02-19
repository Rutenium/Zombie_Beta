note
	description: "Summary description for {IMAGE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	IMAGE
inherit
	SDL_WRAPPER
create
	image_create,
	image_create_default
feature
	image,Targetarea,TargetScreen:POINTER
	Erreur:INTEGER
--IMAGE_CREATE
	image_create_default(Screen:POINTER;image_make:POINTER;x,y:INTEGER)
	local
		memory_manager:POINTER
	do
		image:=image_make
		targetscreen:=screen
		Targetarea:= memory_manager.memory_calloc (1,sizeofrect)
		set_position(x,y)
		set_w_rect(Targetarea,get_w_image(image).to_natural_16)
		set_h_rect(Targetarea,get_h_image(image).to_natural_16)
		set_color_key
	end
	image_create(Screen:POINTER;image_make:POINTER;x,y:INTEGER;targetarea_make:POINTER) -- SCREAN SUR LEQUEL AFFICHER///PATH DE L'IMAGE///POSITION X///POSITION Y
	local
		local_image:POINTER
		memory_manager:POINTER
	do
		image:=image_make
		targetscreen:=screen
		targetarea:=targetarea_make
		set_w_rect(Targetarea,(66).to_natural_16)
		set_h_rect(Targetarea,(66).to_natural_16)
		set_color_key
	end
	BlitSurface
	local
		test:INTEGER
	do
	    test:=SDL_BlitSurface(image,Create{POINTER},Targetscreen,Targetarea)
	end
	set_color_key
	do
		Erreur:=SDL_SetColorKey(image,SDL_SRCCOLORKEY,SDL_MapRGB(get_sdl_format(targetscreen),0,255,255))
	end
--NEW_POSITION
	set_position(x,y:INTEGER)
	do
		set_x(Targetarea,x.to_integer_16)
		set_y(Targetarea,y.to_integer_16)
	end

	set_x_image(x:INTEGER)
	do
		Set_x(Targetarea,x.to_integer_16)
	end

	set_y_image(y:INTEGER)
	do
		Set_y(Targetarea,y.to_integer_16)
	end
	get_x:INTEGER
	do
		result:= sdl_get_x(Targetarea).to_integer
	end

	get_y:INTEGER
	do
		Result:= sdl_get_y(Targetarea).to_integer
	end

	get_w:INTEGER
	do
		Result:=get_w_image(Image).to_integer
	end

	get_h:INTEGER
	do
		Result:=get_h_image(Image).to_integer
	end
	destroy
	do
		Targetarea.memory_free
	end
end
