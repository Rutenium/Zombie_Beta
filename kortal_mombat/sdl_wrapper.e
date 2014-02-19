note
	description: "Summary description for {IMAGE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SDL_WRAPPER
inherit
	ARGUMENTS
feature {NONE} -- Initialization
--SCREAN_CREATE
	Screen_Create(w,h:INTEGER):POINTER
	local
		screen:POINTER
	do
		Screen:= SDL_SetVideoMode(w,h,32,SDL_SWSURFACE)
		result:=Screen
	end
	frozen SDL_FreeSurface(surface:POINTER)
		external
			"C (SDL_Surface *)| <SDL.h>"
		alias
			"SDL_FreeSurface"
		end
	frozen SDL_DisplayFormat(surface:POINTER):POINTER
		external
			"C (SDL_Surface *) : SDL_Surface *| <SDL.h>"
		alias
			"SDL_DisplayFormat"
		end
	frozen SDL_GetTicks:NATURAL_32
		external
			"C inline use <SDL.h>"
		alias
			"SDL_GetTicks()"
		end
	frozen SDLK_RETURN:INTEGER
		external
			"C inline use <SDL.h>"
		alias
			"SDLK_RETURN"
		end
	frozen SDLK_ESCAPE:INTEGER
		external
			"C inline use <SDL.h>"
		alias
			"SDLK_ESCAPE"
		end
	frozen SDLK_SPACE:INTEGER
		external
			"C inline use <SDL.h>"
		alias
			"SDLK_SPACE"
		end
	frozen SDLK_RIGHT:INTEGER
		external
			"C inline use <SDL.h>"
		alias
			"SDLK_RIGHT"
		end
	frozen SDLK_UP:INTEGER
		external
			"C inline use <SDL.h>"
		alias
			"SDLK_UP"
		end
	frozen SDLK_DOWN:INTEGER
		external
			"C inline use <SDL.h>"
		alias
			"SDLK_DOWN"
		end
	frozen SDLK_LEFT:INTEGER
		external
			"C inline use <SDL.h>"
		alias
			"SDLK_LEFT"
		end
--SDL_INIT
	frozen SDL_Init(flags:NATURAL_32):INTEGER
		external
			"C (Uint32): int | <SDL.h>"
		alias
			"SDL_Init"
		end
	frozen SDL_MOUSEMOTION:NATURAL_8
		external
			"C inline use <SDL.h>"
		alias
			"	SDL_MOUSEMOTION"
		end
	frozen SDL_MOUSEBUTTONDOWN:NATURAL_8
		external
			"C inline use <SDL.h>"
		alias
			"SDL_MOUSEBUTTONDOWN"
		end
	frozen SDL_MOUSEBUTTONUP:NATURAL_8
		external
			"C inline use <SDL.h>"
		alias
			"SDL_MOUSEBUTTONUP"
		end
	frozen SDL_KEYDOWN:NATURAL_8
		external
			"C inline use <SDL.h>"
		alias
			"SDL_KEYDOWN"
		end
	frozen SDL_KEYUP:NATURAL_8
		external
			"C inline use <SDL.h>"
		alias
			"SDL_KEYUP"
		end
	frozen SDL_QUIT:NATURAL_8
		external
			"C inline use <SDL.h>"
		alias
			"SDL_QUIT"
		end
--SDL_INIT_VIDEO
	frozen SDL_INIT_VIDEO:NATURAL_32
		external
			"C inline use <SDL.h>"
		alias
			"SDL_INIT_VIDEO"
		end
	frozen SDL_INIT_VIDEO_TIMER:NATURAL_32
		external
			"C inline use <SDL.h>"
		alias
			"SDL_INIT_VIDEO|SDL_INIT_TIMER"
		end
--SDL_SWSURFACE
	frozen SDL_FULLSCREEN:NATURAL_32
		external
			"C inline use <SDL.h>"
		alias
			"SDL_FULLSCREEN"
		end
	frozen SDL_SWSURFACE:NATURAL_32
		external
			"C inline use <SDL.h>"
		alias
			"SDL_SWSURFACE"
		end
--SDL_SRCCOLORKEY
	frozen SDL_SRCCOLORKEY:NATURAL_32
		external
			"C inline use <SDL.h>"
		alias
			"SDL_SRCCOLORKEY"
		end
--SDL_LOADBMP
	frozen SDL_LoadBMP(file:POINTER):POINTER
		external
			"C (const char *) : SDL_Surface *| <SDL.h>"
		alias
			"SDL_LoadBMP"
		end
--SIZEOF
	frozen sizeofrect:INTEGER
		external
			"C inline use <SDL.h>"
		alias
			"sizeof(SDL_Rect)"
		end
	frozen sizeofevent:INTEGER
		external
			"C inline use <SDL.h>"
		alias
			"sizeof(SDL_Event)"
		end
--SET_X
	frozen Set_x (SDL_Rect:POINTER;value:INTEGER_16)
				-- Modifie le champ err la structure C `jpeg_decompress_struct' par la valeur `value'.
		external
			"C [struct <SDL.h>] (SDL_Rect, Sint16)"
		alias
			"x"
		end
--SET_Y
	frozen Set_y (SDL_Rect:POINTER;value:INTEGER_16)
				-- Modifie le champ err la structure C `jpeg_decompress_struct' par la valeur `value'.
		external
			"C [struct <SDL.h>] (SDL_Rect, Sint16)"
		alias
			"y"
	end
--SET_W_RECT
	frozen Set_w_rect (SDL_Rect:POINTER;value:NATURAL_16)
		external
			"C [struct <SDL.h>] (SDL_Rect, Uint16)"
		alias
			"w"
	end
--SET_H_RECT
	frozen Set_h_rect (SDL_Rect:POINTER;value:NATURAL_16)
		external
			"C [struct <SDL.h>] (SDL_Rect, Uint16)"
		alias
			"h"
	end
	frozen sdl_get_x (SDL_Rect:POINTER):INTEGER_16
		external
			"C [struct <SDL.h>] (SDL_Rect):Sint16"
		alias
			"x"
		end
	frozen sdl_get_y (SDL_Rect:POINTER):INTEGER_16
		external
			"C [struct <SDL.h>] (SDL_Rect):Sint16"
		alias
			"y"
		end
--GET_W_BMP
	frozen get_w_rect (SDL_Rect:POINTER):NATURAL_16
		external
				"C [struct <SDL.h>] (SDL_Rect):Uint16"
			alias
				"w"
			end

	frozen get_w_image (SDL_Surface:POINTER):INTEGER
		external
			"C [struct <SDL.h>] (SDL_Surface):int"
		alias
			"w"
		end
--GET_H_BMP
	frozen get_h_image (SDL_Surface:POINTER):INTEGER
		external
			"C [struct <SDL.h>] (SDL_Surface):int"
		alias
			"h"
		end
	frozen get_sdl_format (SDL_Surface:POINTER):POINTER
		external
			"C [struct <SDL.h>] (SDL_Surface): SDL_PixelFormat *"
		alias
			"format"
	end
	frozen get_sdl_type (event:POINTER):NATURAL_8
		external
			"C [struct <SDL.h>] (SDL_Event): Uint8"
		alias
			"type"
		end
	frozen SDL_Get_State (event:POINTER):NATURAL_8
		external
			"C [struct <SDL.h>] (SDL_KeyboardEvent ): Uint8"
		alias
			"state"
		end
	frozen SDL_GetKey(event:POINTER):POINTER
		external
			"C [struct <SDL.h>] (SDL_Event):SDL_KeyboardEvent"
		alias
			"&key"
		end

	frozen SDL_GetKeySym(event:POINTER):INTEGER
		external
			"C inline use <SDL.h>"
		alias
			"((SDL_KeyboardEvent *)$event)->keysym.sym"
		end
	frozen SDL_GetMouse(event:POINTER):POINTER
		external
			"C [struct <SDL.h>] (SDL_Event):SDL_MouseButtonEvent"
		alias
			"&button"
		end
	frozen SDL_GetMouseX(mouse:POINTER):NATURAL_16
		external
			"C [struct <SDL.h>] (SDL_MouseButtonEvent):Uint16"
		alias
			"x"
		end
	frozen SDL_GetMouseY(mouse:POINTER):NATURAL_16
		external
			"C [struct <SDL.h>] (SDL_MouseButtonEvent):Uint16"
		alias
			"y"
		end
--SDL_SETVIDEOMODE
	frozen SDL_SetVideoMode (Width,Height,bpp:INTEGER;Flags:NATURAL_32):POINTER
		external
			"C (int,int,int,Uint32) : SDL_Surface * | <SDL.h>"
		alias
			"SDL_SetVideoMode"
		end
--SDL_SetColorKey
	frozen SDL_SetColorKey (surface:POINTER;flags,key:NATURAL_32):INTEGER
		external
			"C (SDL_Surface *,Uint32,Uint32) : int | <SDL.h>"
		alias
			"SDL_SetColorKey"
		end
	frozen SDL_MapRGB (format:POINTER;r,g,b:NATURAL_8):NATURAL_32
		external
			"C (const SDL_PixelFormat* ,Uint8, Uint8,Uint8) : Unt32 | <SDL.h>"
		alias
			"SDL_MapRGB"
		end
--SDL_BLITSURFACE
	frozen SDL_BlitSurface (src,srcrect,dst,dstrect:POINTER):INTEGER
		external
			"C (SDL_Surface *,SDL_Rect *,SDL_Surface *,SDL_Rect *) : int | <SDL.h>"
		alias
			"SDL_BlitSurface"
		end
--SDL_FILLRECT
	frozen SDL_FillRect (dst,dstrect:POINTER;color:NATURAL_32):INTEGER
		external
			"C (SDL_Surface *,SDL_Rect *,Uint32) : int | <SDL.h>"
		alias
			"SDL_FillRect"
		end
--SDL_FLIP
	frozen SDL_Flip(SDL_Surface:POINTER):INTEGER
		external
			"C (SDL_Surface *) : int | <SDL.h>"
		alias
			"SDL_Flip"
		end
--SDL_DELAY
	frozen SDL_Delay(ms:NATURAL_32)
		external
			"C (Uint32) | <SDL.h>"
		alias
			"SDL_Delay"
		end
--SDL_PollEvent
	frozen SDL_PollEvent(event:POINTER):INTEGER
	 external
	 	"C (SDL_Event*): int | <SDL.h>"
	 alias
	 	"SDL_PollEvent"
	 end

	frozen SDL_Quit_bye
		external
			"C | <SDL.h>"
		alias
			"SDL_Quit"
		end

end

