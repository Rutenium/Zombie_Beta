note
	description: "Summary description for {WAVE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	WAVE
inherit
	SDL_WRAPPER
create
	make_wave
feature

	Dificulty: INTEGER

	Actual_Wave: INTEGER

	Screen,image_zombie_test,allocated_memmory: POINTER

	not_spawned: LINKED_LIST [ZOMBIE]

	wave:LINKED_LIST[TUPLE[x,y,orientation:INTEGER]]

	make_wave (Dificulty_make: INTEGER; Screen_make: POINTER) -- 1-easy 2-medium 3-hard
		local
		do
			wave := create {LINKED_LIST [TUPLE[x,y,orientation:INTEGER]]}.make
			Dificulty := Dificulty_make
			Actual_wave := 9
			Screen := Screen_Make
			create not_spawned.make
		end

	load_image(path:STRING)
	local
		path_c:C_STRING
	do
		create path_c.make (path)
		image_zombie_test:=SDL_LoadBMP(Path_c.item)
	end
	allocate_memmory
	local
		memory_manager:POINTER
	do
		allocated_memmory:= memory_manager.memory_calloc (1,sizeofrect)
	end

	spawn
		local
			i: INTEGER
		do
			load_image("zombie.bmp")
			from
				i := 0
			until
				i = Actual_Wave
			loop
				wave.extend ([-100,-100,1])
				i := i + 1
			end
		end

	next
		do
			Actual_Wave := Actual_Wave + 1
		end

	set_initial_position (random: RANDOM)
		local
			x, y: INTEGER
			pos0, pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8, pos9, error, placed,full: BOOLEAN
		do
			x := 100
			y := 100
			pos0 := false
			pos1 := false
			pos2 := false
			pos3 := false
			pos4 := false
			pos5 := false
			pos6 := false
			pos7 := false
			pos8 := false
			pos9 := false
			from
				wave.start
			until
				wave.exhausted or error
			loop
				if full then
					wave.item.put_integer (-100,0)
					wave.item.put_integer (-100,1)
				else
				from
					placed := false
				until
					placed = true or error = true
				loop
					random.forth
					if random.item \\ 10 = 0 then
						if pos0 then
							random.forth
						else
							wave.item.x:= 231 --SET_X
							wave.item.y:= 0 --SET_Y
							wave.item.orientation:= 3 --SET_ORIENTATION
							pos0 := true
							placed := true
						end
					end
					if random.item \\ 10 = 1 then
						if pos1 then
							random.forth
						else
							wave.item.x:= 495 --SET_X
							wave.item.y:= 0 --SET_Y
							wave.item.orientation:= 3 --SET_ORIENTATION
							pos1 := true
							placed := true
						end
					end
					if random.item \\ 10 = 2 then
						if pos2 then
							random.forth
						else
							wave.item.x:=779 --SET_X
							wave.item.y:= 0 --SET_Y
							wave.item.orientation :=3--SET_ORIENTATION
							pos2 := true
							placed := true
						end
					end
					if random.item \\ 10 = 3 then
						if pos3 then
							random.forth
						else
							wave.item.x:= 0 --SET_X
							wave.item.y:=165  --SET_Y
							wave.item.orientation:=2 --SET_ORIENTATION
							pos3 := true
							placed := true
						end
					end
					if random.item \\ 10 = 4 then
						if pos4 then
							random.forth
						else
							wave.item.x := 0 --SET_X
							wave.item.y := 561 --SET_Y
							wave.item.orientation :=2 --SET_ORIENTATION
							pos4 := true
							placed := true
						end
					end
					if random.item \\ 10 = 5 then
						if pos5 then
							random.forth
						else
							wave.item.x := 990 --SET_X
							wave.item.y := 165 --SET_Y
							wave.item.orientation:= 4 --SET_ORIENTATION
							pos5 := true
							placed := true
						end
					end
					if random.item \\ 10 = 6 then
						if pos6 then
							random.forth
						else
							wave.item.x := 990 --SET_X
							wave.item.y :=561 --SET_Y
							wave.item.orientation := 4 --SET_ORIENTATION
							pos6 := true
							placed := true
						end
					end
					if random.item \\ 10 = 7 then
						if pos7 then
							random.forth
						else
							wave.item.x := 231 --SET_X
							wave.item.y := 726 --SET_Y
							wave.item.orientation := 1 --SET_ORIENTATION
							pos7 := true
							placed := true
						end
					end
					if random.item \\ 10 = 8 then
						if pos8 then
							random.forth
						else
							wave.item.x := 495 --SET_X
							wave.item.y := 726 --SET_Y
							wave.item.orientation := 1 --SET_ORIENTATION
							pos8 := true
							placed := true
						end
					end
					if random.item \\ 10 = 9 then
						if pos9 then
							random.forth
						else
							wave.item.x := 779 --SET_X
							wave.item.y := 726--SET_Y
							wave.item.orientation:=1 --SET_ORIENTATION
							pos9 := true
							placed := true
						end
					end
				end
				end
				wave.forth
			end
		end
		move(personnage:PERSONNAGE)
		local
			vitesse,ecartx,ecarty:INTEGER
		do
			vitesse:=2
			from
				wave.start
			until
				wave.exhausted
			loop
				if wave.item.x<= personnage.image_personnage.get_x then -- IF ZOMBIE.X < PERSONNAGE.X
					ecartx:= personnage.image_personnage.get_x-wave.item.x -- ECART X = PERSONNAGE.X-ZOMBIE.X
				else
					ecartx:= wave.item.x-personnage.image_personnage.get_x -- ECART X = ZOMBIE.X - PERSONNAGE.X
				end
				if wave.item.y <= personnage.image_personnage.get_y then
					ecarty:= personnage.image_personnage.get_y-wave.item.y
				else
					ecarty:= wave.item.y-personnage.image_personnage.get_y
				end

				if ecartx>=ecarty then
					if wave.item.x <personnage.image_personnage.get_x then
						wave.item.x := wave.item.x+vitesse
						wave.item.orientation := 2
					else
						wave.item.x:= wave.item.x-vitesse -- set_x
						wave.item.orientation := 4
					end
				else
					if wave.item.y <personnage.image_personnage.get_y then
						wave.item.y := wave.item.y+vitesse
						wave.item.orientation := 3
					else
						wave.item.put_integer (wave.item.integer_item (0),0)
						wave.item.y:=wave.item.y -vitesse
						wave.item.orientation := 1
					end
				end
				wave.forth
			end
		end

end
