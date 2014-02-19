note
	description: "Summary description for {BALLE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BALLE
inherit
	SDL_WRAPPER
create
	make_balle
feature
	balle_list:LINKED_LIST[TUPLE[x,y,orientation:INTEGER]]
	Screen,image_test,allocated_memmory:POINTER
	ammunition:INTEGER
	ammunition_load:POINTER
	ammunition_image:IMAGE
	make_balle(Screen_make:POINTER)
	local
		path_c:C_STRING
	do
		Screen:=screen_make
		create balle_list.make
		load_image("balle.bmp")
		allocate_memmory
		ammunition:=10
		create path_c.make ("ammunition.bmp")
		ammunition_load:=SDL_LoadBMP(path_c.item)
		create ammunition_image.image_create_default (Screen,ammunition_load, 1071,141)
	end
	allocate_memmory
	local
		memory_manager:POINTER
	do
		allocated_memmory:= memory_manager.memory_calloc (1,sizeofrect)
	end
	load_image(path:STRING)
	local
		path_c:C_STRING
	do
		create path_c.make (path)
		image_test:=SDL_LoadBMP(Path_c.item)
	end
	add(x,y,orientation:INTEGER)
	local
		local_tuple:TUPLE[x,y,orientation:INTEGER]
	do
		if ammunition>0 then
			balle_list.extend ([x,y,orientation])
			ammunition:=ammunition-1
		end
	end
	move
	local
		vitesse:INTEGER
	do
		vitesse:=30
		from
			balle_list.start
		until
			balle_list.exhausted
		loop
			if balle_list.item.orientation =4 then
				balle_list.item.x := balle_list.item.x-vitesse
			end
			if balle_list.item.orientation =3 then
				balle_list.item.y := balle_list.item.y+vitesse --SET_Y
			end
			if balle_list.item.orientation =2 then
				balle_list.item.x := balle_list.item.x+vitesse
			end
			if balle_list.item.orientation =1 then
				balle_list.item.y := balle_list.item.y-vitesse
			end
			balle_list.forth
		end
		from
			balle_list.start
		until
			balle_list.exhausted
		loop --- GROS WHAT THE FUCK TABARNAK CALISS
			if balle_list.item.x <0 or balle_list.item.x>1056 or balle_list.item.y>792 or balle_list.item.y<0
			then
			balle_list.remove
			end
			balle_list.forth
		end
	end
	check_delete
	do
		from
			balle_list.start
		until
			balle_list.exhausted
		loop --- GROS WHAT THE FUCK TABARNAK CALISS
			if balle_list.item.integer_item (0) <0 or (balle_list.item.integer_item (0))>1056 or (balle_list.item.integer_item (1))>792 or (balle_list.item.integer_item (1))<0
			then
			balle_list.remove
			end
			balle_list.forth
		end
	end


end
