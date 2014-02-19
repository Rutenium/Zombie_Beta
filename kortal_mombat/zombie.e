note
	description: "Summary description for {ZOMBIE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ZOMBIE
inherit
	SDL_WRAPPER
	IMAGE
	redefine set_position end
create
	make_zombie
feature
	image_zombie:IMAGE
	hit_points:INTEGER
	position:INTEGER
	make_zombie(Screen:POINTER;hit_points_make:INTEGER;image_zombie_test:POINTER;targetarea_make:POINTER)
	do
		image_zombie:=create{IMAGE}.image_create (Screen, image_zombie_test,-100,-100,targetarea_make)
		hit_points:=hit_points_make
	end

	blitsurface_zombie-- 1-haut 2-droit 3-bas 4-gauche
	local
		trash,oriented:INTEGER
		memmory_manager,orientation:POINTER
	do
		if position=1 then
			oriented:=0
		end
		if position=2 then
			oriented:=66
		end
		if position=3 then
			oriented:=132
		end
		if position=4 then
			oriented:=198
		end
		orientation:=memmory_manager.memory_calloc (1, sizeofrect)
		set_x(orientation,oriented.to_integer_16)
		set_y(orientation,0)
		set_w_rect(orientation,(66).to_natural_16)
		set_h_rect(orientation,(66).to_natural_16)
	    trash:=SDL_BlitSurface(image_zombie.image,orientation,image_zombie.Targetscreen,image_zombie.Targetarea)
	    orientation.memory_free
	end

	set_position(x,y:INTEGER)
	do
		set_x(image_zombie.Targetarea,x.to_integer_16)
		set_y(image_zombie.Targetarea,y.to_integer_16)
	end
	set_orientation(x:INTEGER)
	do
		position:=x
	end

end
