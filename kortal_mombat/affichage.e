note
	description: "Summary description for {AFFICHAGE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	AFFICHAGE

inherit
	SDL_Wrapper

create
	make_affichage

feature

	screen: POINTER
	allocated_memmory:POINTER

	make_affichage (Screen_make: POINTER)
		do
			Screen := Screen_make
		end
	allocate_memmory
	local
		memory_manager:POINTER
	do
		allocated_memmory:= memory_manager.memory_calloc (1,sizeofrect)
	end

	zombie (wave: LINKED_LIST [TUPLE[x,y,orientation:INTEGER]])
		local
			i, error: INTEGER
			zombie_affichage:ZOMBIE
			path_c:C_STRING
			image_zombie_test:POINTER
		do
			create path_c.make ("zombie.bmp")
			image_zombie_test:=SDL_LoadBMP(Path_c.item)
			create zombie_affichage.make_zombie (Screen, 1, image_zombie_test,allocated_memmory)
			i := 1
			from
				wave.start
			until
				wave.exhausted
			loop
				zombie_affichage.set_position (wave.item.x,wave.item.y)
				zombie_affichage.set_orientation (wave.item.orientation)
				zombie_affichage.blitsurface_zombie
				wave.forth
				i := i + 1
			end
		end

	balle (liste_balle: LINKED_LIST [TUPLE[x,y,orientation:INTEGER]])
		local
			i, error: INTEGER
			image_balle_test:POINTER
			path_c:C_STRING
			balle_affichage:IMAGE_BALLE
		do
			create path_c.make ("balle.bmp")
			image_balle_test:=SDL_LoadBMP(Path_c.item)
			create balle_affichage.make_balle (Screen,image_balle_test,allocated_memmory)
			i := 1
			from
				liste_balle.start
			until
				liste_balle.exhausted
			loop
				balle_affichage.set_position (liste_balle.item.x,liste_balle.item.y)
				balle_affichage.set_orientation (liste_balle.item.orientation)
				balle_affichage.blitsurface
				liste_balle.forth
				i := i + 1
			end
		end
	ammunition (balle_affichage:BALLE)
	local
		trash:INTEGER
		memmory_manager,area:POINTER
		x:INTEGER
	do
		area:=memmory_manager.memory_calloc (1, sizeofrect)
		x:= 30*balle_affichage.ammunition
		set_x(area,0)
		set_y(area,0)
		set_w_rect(area,x.to_natural_16)
		set_h_rect(area,114)
	    trash:=SDL_BlitSurface(balle_affichage.ammunition_image.image,area,balle_affichage.ammunition_image.targetscreen,balle_affichage.ammunition_image.targetarea)
	    area.memory_free
	end

end
