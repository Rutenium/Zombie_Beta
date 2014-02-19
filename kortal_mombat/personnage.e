note
	description: "Summary description for {PERSONNAGE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PERSONNAGE
inherit
	IMAGE
	redefine set_position end
create
	make_personnage
feature
	image_personnage:IMAGE
	position,vitesse:INTEGER
	make_personnage(Screen:POINTER;personnage:POINTER)
	do
		image_personnage:=create{IMAGE}.image_create_default (Screen,personnage,-100,-100)
		position:=1
		vitesse:=10
	end
	blitsurface_personnage-- 1-haut 2-droit 3-bas 4-gauche
	local
		trash,oriented:INTEGER
		memmory_manager,orientation:POINTER
	do
		if position=1 then
			oriented:=0
		end
		if position=2 then
			oriented:=100
		end
		if position=3 then
			oriented:=200
		end
		if position=4 then
			oriented:=300
		end
		orientation:=memmory_manager.memory_calloc (1, sizeofrect)
		set_x(orientation,oriented.to_integer_16)
		set_y(orientation,0)
		set_w_rect(orientation,(100).to_natural_16)
		set_h_rect(orientation,(100).to_natural_16)
	    trash:=SDL_BlitSurface(image_personnage.image,orientation,image_personnage.Targetscreen,image_personnage.Targetarea)
	end
	move(event_handler:EVENT)
	do
		if event_handler.left_pressed then
			set_position(image_personnage.get_x-vitesse,image_personnage.get_y)
			position:=4
		end
		if event_handler.right_pressed then
			set_position(image_personnage.get_x+vitesse,image_personnage.get_y)
			position:=2
		end
		if event_handler.up_pressed then
			set_position(image_personnage.get_x,image_personnage.get_y-vitesse)
			position:=1
		end
		if event_handler.down_pressed then
			set_position(image_personnage.get_x,image_personnage.get_y+vitesse)
			position:=3
		end
	end
	shoot(balle:BALLE)
	local
		x,y:INTEGER
	do
		if position=1 then
			x:=image_personnage.get_x+71
			y:=image_personnage.get_y
		end
		if position=2 then
			x:=image_personnage.get_x+64
			y:=image_personnage.get_y+71
		end
		if position=3 then
			x:=image_personnage.get_x+23
			y:=image_personnage.get_y+64
			end
		if position=4 then
			x:=image_personnage.get_x
			y:=image_personnage.get_y+23
			end
		balle.add (x,y,position)
	end
	set_position(x,y:INTEGER)
	do
		set_x(image_personnage.Targetarea,x.to_integer_16)
		set_y(image_personnage.Targetarea,y.to_integer_16)
	end


end
