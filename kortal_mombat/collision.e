note
	description: "Summary description for {COLLISION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	COLLISION
create
	make_collision
feature
	make_collision
	do
	end

	zombie_balle(wave:WAVE;balle:BALLE)
	local
		collision:BOOLEAN
	do
		from
			balle.balle_list.start
		until
			balle.balle_list.exhausted
		loop
			from
				wave.wave.start
			until
				wave.wave.exhausted or collision
			loop
				if  balle.balle_list.item.x > wave.wave.item.x and
				  balle.balle_list.item.x < wave.wave.item.x+66 and
				  balle.balle_list.item.y > wave.wave.item.y and
				  balle.balle_list.item.y < wave.wave.item.y+66  then
				 	balle.balle_list.remove
				   	wave.wave.remove
				   	collision:=true
				end
				if wave.wave.exhausted=false then
					wave.wave.forth
				end
			end
			if balle.balle_list.exhausted=false then
				balle.balle_list.forth
			end
		end
	end
end
