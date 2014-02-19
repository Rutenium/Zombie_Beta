note
	description: "Summary description for {BALLE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	IMAGE_BALLE
inherit
	SDL_WRAPPER
create
	make_balle
feature
	orientation,damage:INTEGER
	balle:IMAGE
	Screen:POINTER
	make_balle(Screen_make:POINTER;balle_make,targetarea_make:POINTER)
	do
		damage:=1
		Screen:=Screen_make
		create balle.image_create (Screen, balle_make, -100,-100,targetarea_make)
		orientation:=1
	end
	blitsurface
	local
		trash:INTEGER
		memmory_manager,area:POINTER
	do
		if orientation=1 or orientation=3 then
			area:=memmory_manager.memory_calloc (1, sizeofrect)
			set_x(area,(0).to_integer_16)
			set_y(area,0)
			set_w_rect(area,(6).to_natural_16)
			set_h_rect(area,(23).to_natural_16)
		end
		if orientation=2 or orientation=4 then
			area:=memmory_manager.memory_calloc (1, sizeofrect)
			set_x(area,6)
			set_y(area,8)
			set_w_rect(area,(23).to_natural_16)
			set_h_rect(area,(6).to_natural_16)
		end
	    trash:=SDL_BlitSurface(balle.image,area,balle.Targetscreen,balle.Targetarea)
	    area.memory_free
	end
	set_orientation(x:INTEGER)
	do
		orientation:=x
	end
	set_position(x,y:INTEGER)
	do
		set_x(balle.Targetarea,x.to_integer_16)
		set_y(balle.Targetarea,y.to_integer_16)
	end

end
