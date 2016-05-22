#import "SDL"
#import "Basic"

//Core SDL Types
SDL_bool :: enum #foreign {
	SDL_TRUE,
	SDL_FALSE
};

//Initialisation
SDL_Init :: (flags : u32) -> int #foreign;
SDL_InitSubSystem :: (flags : u32) -> int #foreign;
SDL_Quit :: () -> void #foreign;
SDL_QuitSubSystem :: (flags : u32) -> void #foreign;
SDL_SetMainReady :: () -> void #foreign;
SDL_WasInit :: (flags : u32) -> u32 #foreign;

//Error handling
SDL_ClearError :: () -> void #foreign;
SDL_GetError :: () -> string #foreign;
SDL_SetError :: (fmt : string, args: ...) -> int #foreign;

//Video

/*
Display and window management
*/

SDL_BlendMode :: enum #foreign {
	SDL_BLENDMODE_NONE,
	SDL_BLENDMODE_BLEND,
	SDL_BLENDMODE_ADD,
	SDL_BLENDMODE_MOD
};

SDL_GLattr :: enum #foreign {
	SDL_GL_RED_SIZE,
	SDL_GL_GREEN_SIZE,
	SDL_GL_BLUE_SIZE,
	SDL_GL_ALPHA_SIZE,
	SDL_GL_BUFFER_SIZE,
	SDL_GL_DOUBLEBUFFER,
	SDL_GL_DEPTH_SIZE,
	SDL_GL_STENCIL_SIZE,
	SDL_GL_ACCUM_RED_SIZE,
	SDL_GL_ACCUM_GREEN_SIZE,
	SDL_GL_ACCUM_BLUE_SIZE,
	SDL_GL_ACCUM_ALPHA_SIZE,
	SDL_GL_STEREO,
	SDL_GL_MULTISAMPLEBUFFERS,
	SDL_GL_MULTISAMPLESAMPLES,
	SDL_GL_ACCELERATED_VISUAL,
	SDL_GL_CONTEXT_MAJOR_VERSION,
	SDL_GL_CONTEXT_MINOR_VERSION,
	SDL_GL_CONTEXT_FLAGS,
	SDL_GL_CONTEXT_PROFILE_MASK,
	SDL_GL_SHARE_WITH_CURRENT_CONTEXT,
	SDL_GL_FRAMEBUFFER_SRGB_CAPABLE,
	SDL_GL_CONTEXT_RELEASE_BEHAVIOR
};

SDL_GLcontextFlag :: enum #foreign {
	SDL_GL_CONTEXT_DEBUG_FLAG,
	SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG,
	SDL_GL_CONTEXT_ROBUST_ACCESS_FLAG,
	SDL_GL_CONTEXT_RESET_ISOLATION_FLAG
};

SDL_GLprofile :: enum #foreign {
	SDL_GL_CONTEXT_PROFILE_CORE,
	SDL_GL_CONTEXT_PROFILE_COMPATIBILITY,
	SDL_GL_CONTEXT_PROFILE_ES
};

SDL_HitTestResult :: enum #foreign {
	SDL_HITTEST_NORMAL,
	SDL_HITTEST_DRAGGABLE,
	SDL_HITTEST_RESIZE_TOPLEFT,
	SDL_HITTEST_RESIZE_TOP,
	SDL_HITTEST_RESIZE_TOPRIGHT,
	SDL_HITTEST_RESIZE_RIGHT,
	SDL_HITTEST_RESIZE_BOTTOMRIGHT,
	SDL_HITTEST_RESIZE_BOTTOM,
	SDL_HITTEST_RESIZE_BOTTOMLEFT,
	SDL_HITTEST_RESIZE_LEFT
};

SDL_MessageBoxButtonFlags :: enum #foreign {
	SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT,
	SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT
};

SDL_MessageBoxColorType :: enum #foreign {
	SDL_MESSAGEBOX_COLOR_BACKGROUND,
	SDL_MESSAGEBOX_COLOR_TEXT,
	SDL_MESSAGEBOX_COLOR_BUTTON_BORDER,
	SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND,
	SDL_MESSAGEBOX_COLOR_BUTTON_SELECTED,
	SDL_MESSAGEBOX_COLOR_MAX
};

SDL_MessageBoxFlags :: enum #foreign {
	SDL_MESSAGEBOX_ERROR,
	SDL_MESSAGEBOX_WARNING,
	SDL_MESSAGEBOX_INFORMATION
};

SDL_WindowEventID :: enum #foreign {
	SDL_WINDOWEVENT_SHOWN,
	SDL_WINDOWEVENT_HIDDEN,
	SDL_WINDOWEVENT_EXPOSED,
	SDL_WINDOWEVENT_MOVED,
	SDL_WINDOWEVENT_RESIZED,
	SDL_WINDOWEVENT_SIZE_CHANGED,
	SDL_WINDOWEVENT_MINIMIZED,
	SDL_WINDOWEVENT_MAXIMIZED,
	SDL_WINDOWEVENT_RESTORED,
	SDL_WINDOWEVENT_ENTER,
	SDL_WINDOWEVENT_LEAVE,
	SDL_WINDOWEVENT_FOCUS_GAINED,
	SDL_WINDOWEVENT_FOCUS_LOST,
	SDL_WINDOWEVENT_CLOSE
};

SDL_WindowFlags :: enum #foreign {
	SDL_WINDOW_FULLSCREEN,
	SDL_WINDOW_FULLSCREEN_DESKTOP,
	SDL_WINDOW_OPENGL,
	SDL_WINDOW_SHOWN,
	SDL_WINDOW_HIDDEN,
	SDL_WINDOW_BORDERLESS,
	SDL_WINDOW_RESIZABLE,
	SDL_WINDOW_MINIMIZED,
	SDL_WINDOW_MAXIMIZED,
	SDL_WINDOW_INPUT_GRABBED,
	SDL_WINDOW_INPUT_FOCUS,
	SDL_WINDOW_MOUSE_FOCUS,
	SDL_WINDOW_FOREIGN,
	SDL_WINDOW_ALLOW_HIGHDPI,
	SDL_WINDOW_MOUSE_CAPTURE
};

SDL_DisplayMode :: struct #foreign {
	format : u32;
	w : int;
	h : int;
	refresh_rate : int;
	driverdata : *void;
};

SDL_MessageBoxButtonData :: struct #foreign {
	flags : u32;
	buttonid : int;
	text : string;
};

SDL_MessageBoxColor :: struct #foreign {
	r : u8;
	g : u8;
	b : u8;
};

SDL_MessageBoxColorScheme :: struct #foreign {
	colors : [5] SDL_MessageBoxColor;
};

SDL_MessageBoxData :: struct #foreign {
	flags : u32;
	window : *SDL_Window;
	title : string;
	message : string;
	numbuttons : int;
	buttons : *SDL_MessageBoxButtonData;
	colorScheme : *SDL_MessageBoxColorScheme;
};

SDL_WindowEvent :: struct #foreign {
	type : u32;
	timestamp : u32;
	windowID : u32;
	event : u8;
	data1 : int;
	data2 : int;
};

SDL_CreateWindow :: (title : string, x : int, y : int, w : int, h : int, flags : u32) -> *SDL_Window #foreign;
SDL_CreateWindowAndRenderer :: (width : int, height : int, window_flags : u32, window : **SDL_Window, render : **SDL_Renderer) -> int #foreign;
SDL_CreateWindowFrom :: (data : *void) -> *SDL_Window #foreign;
SDL_DestroyWindow :: (window : *SDL_Window) -> void #foreign;
SDL_DisableScreenSaver :: () -> void #foreign;
SDL_EnableScreenSaver :: () -> void #foreign;
SDL_GL_CreateContext :: (window : *SDL_Window) -> SDL_GLContext #foreign;
SDL_GL_DeleteContext :: (context : SDL_GLContext) -> void #foreign;
SDL_GL_ExtensionSupported :: (extension : string) -> SDL_bool #foreign;
SDL_GL_GetAttribute :: (attr : SDL_GLattr, value : *int) -> int #foreign;
SDL_GL_GetCurrentContext :: () -> SDL_GLContext #foreign;
SDL_GL_GetCurrentWindow :: () -> *SDL_Window #foreign;
SDL_GL_GetDrawableSize :: (window : *SDL_Window, w : *int, h : *int) -> void #foreign;
SDL_GL_GetDrawableSize :: (window : *SDL_Window) -> int, int
{
	width : *int;
	height : *int;
	SDL_GL_GetDrawableSize(window, width, height);
	return <<width, <<height;
}

SDL_GL_GetProcAddress :: (proc : string) -> *void #foreign;
SDL_GL_GetSwapInterval :: () -> int #foreign;
SDL_GL_LoadLibrary :: (path : string) -> int #foreign;
SDL_GL_MakeCurrent :: (window : *SDL_Window, context : SDL_GLContext) -> int #foreign;
SDL_GL_ResetAttributes :: () -> void #foreign;
SDL_GL_SetAttribute :: (attr : SDL_GLattr, value : int) -> int #foreign;
SDL_GL_SetSwapInterval :: (interval : int) -> int #foreign;
SDL_GL_SwapWindow :: (window : *SDL_Window) -> void #foreign;
SDL_GL_UnloadLibrary :: () -> void #foreign;
SDL_GetClosestDisplayMode :: (displayIndex : int, mode : *SDL_DisplayMode, closest : SDL_DisplayMode) -> *SDL_DisplayMode #foreign;
SDL_GetCurrentDisplayMode :: (displayIndex : int, mode : *SDL_DisplayMode) -> int #foreign;
SDL_GetCurrentVideoDriver :: () -> string #foreign;
SDL_GetDesktopDisplayMode :: (displayIndex : int, mode : *SDL_DisplayMode) -> int #foreign;
SDL_GetDisplayBounds :: (displayIndex : int, rect : *SDL_Rect) -> int #foreign;
SDL_GetDisplayDPI :: (displayIndex : int, ddpi : *float, hdpi : *float, vdpi : *float) -> int #foreign;
SDL_GetDisplayMode :: (displayIndex : int, modeIndex : int, mode : *SDL_DisplayMode) -> int #foreign;
SDL_GetDisplayName :: (displayIndex : int) -> string #foreign;
SDL_GetDisplayUsableBounds :: (displayIndex : int, rect : *SDL_Rect) -> int #foreign;
SDL_GetGrabbedWindow :: () -> *SDL_Window #foreign;
SDL_GetNumDisplayModes :: (displayIndex : int) -> int #foreign;
SDL_GetNumVideoDisplays :: () -> int #foreign;
SDL_GetNumVideoDrivers :: () -> int #foreign;
SDL_GetVideoDriver :: (index : int) -> string #foreign;
SDL_GetWindowBordersSize :: (window : *SDL_Window, top : *int, left : *int, bottom : *int, right : *int) -> int #foreign;
SDL_GetWindowBordersSize :: (window : *SDL_Window) -> SDL_Size
{
	top : *int;
	left : *int;
	bottom : *int;
	right : *int;
	SDL_GetWindowBordersSize(window, top, left, bottom, right);
	size : SDL_Size;
	size.w = right - left;
	size.h = bottom - top;
	return size;
}

SDL_GetWindowBrightness :: (window : *SDL_Window) -> float #foreign;
SDL_GetWindowData :: (window : *SDL_Window, name : string) -> *void #foreign;
SDL_GetWindowDisplayIndex :: (window : *SDL_Window) -> int #foreign;
SDL_GetWindowDisplayMode :: (window : *SDL_Window, mode : *SDL_DisplayMode) -> int #foreign;
SDL_GetWindowFlags :: (window : *SDL_Window) -> u32 #foreign;
SDL_GetWindowFromID :: (id : u32) -> *SDL_Window #foreign;
SDL_GetWindowGammaRamp :: (window : *SDL_Window, red : *u16, green : *u16, blue : *u16) -> int #foreign;
SDL_GetWindowGrab :: (window : *SDL_Window) -> SDL_bool #foreign;
SDL_GetWindowID :: (window : *SDL_Window) -> u32 #foreign;
SDL_GetWindowMaximumSize :: (window : *SDL_Window, w : *int, h : *int) -> void #foreign;
SDL_GetWindowMinimumSize :: (window : *SDL_Window, w : *int, h : *int) -> void #foreign;
SDL_GetWindowOpacity :: (window : *SDL_Window, opacity : *float) -> int #foreign;
SDL_GetWindowPixelFormat :: (window : *SDL_Window) -> u32 #foreign;
SDL_GetWindowPosition :: (window : *SDL_Window, x : *int, y : *int) -> void #foreign;
SDL_GetWindowPosition :: (window : *SDL_Window) -> SDL_Point
{
	x : *int;
	y : *int;
	SDL_GetWindowPosition(window, x, y);
	position : SDL_Point;
	position.x = x;
	position.y = y;
	return position;
}

SDL_GetWindowSize :: (window : *SDL_Window, w : *int, h : *int) -> void #foreign;
SDL_GetWindowSize :: (window : *SDL_Window) -> SDL_Size
{
	w : *int;
	h : *int;
	SDL_GetWindowSize(window, w, h);
	size : SDL_Size;
	size.w = w;
	size.h = h;
	return size;
}

SDL_GetWindowSurface :: (window : *SDL_Window) -> *SDL_Surface #foreign;
SDL_GetWindowTitle :: (window : *SDL_Window) -> string #foreign;
SDL_HideWindow :: (window : *SDL_Window) -> void #foreign;
SDL_IsScreenSaverEnabled :: () -> SDL_bool #foreign;
SDL_MaximizeWindow :: (window : *SDL_Window) -> void #foreign;
SDL_MinimizeWindow :: (window : *SDL_Window) -> void #foreign;
SDL_RaiseWindow :: (window : *SDL_Window) -> void #foreign;
SDL_RestoreWindow :: (window : *SDL_Window) -> void #foreign;
SDL_SetWindowBordered :: (window : *SDL_Window, bordered : SDL_bool) -> void #foreign;
SDL_SetWindowBrightness :: (window : *SDL_Window, brightness : float) -> int #foreign;
SDL_SetWindowData :: (window : *SDL_Window, name : string, userdata : *void) -> *void #foreign;
SDL_SetWindowDisplayMode :: (window : *SDL_Window, mode : *SDL_DisplayMode) -> int #foreign;
SDL_SetWindowFullscreen :: (window : *SDL_Window, flags : u32) -> int #foreign;
SDL_SetWindowGammaRamp :: (window : *SDL_Window, red : *u16, green : *u16, blue : *u16) -> int #foreign;
SDL_SetWindowGrab :: (window : *SDL_Window, grabbed : SDL_bool) -> void #foreign;
SDL_SetWindowIcon :: (window : *SDL_Window, icon : *SDL_Surface) -> void #foreign;
SDL_SetWindowInputFocus :: (window : *SDL_Window) -> int #foreign;
SDL_SetWindowMaximumSize :: (window : *SDL_Window, max_w : int, max_h : int) -> void #foreign;
SDL_SetWindowMinimumSize :: (window : *SDL_Window, max_w : int, max_h : int) -> void #foreign;
SDL_SetWindowModalFor :: (window : *SDL_Window, parent : *SDL_Window) -> int #foreign;
SDL_SetWindowOpacity :: (window : *SDL_Window, opacity : float) -> int #foreign;
SDL_SetWindowPosition :: (window : *SDL_Window, x : int, y : int) -> void #foreign;
SDL_SetWindowSize :: (window : *SDL_Window, w : int, h : int) -> void #foreign;
SDL_SetWindowTitle :: (window : *SDL_Window, title : string) -> void #foreign;
SDL_ShowMessageBox :: (messageboxdata : *SDL_MessageBoxData, buttonid : *int) -> int #foreign;
SDL_ShowSimpleMessageBox :: (flags : u32, title : string, message : string, window : *SDL_Window) -> int #foreign;
SDL_ShowWindow :: (window : *SDL_Window) -> void #foreign;
SDL_UpdateWindowSurface :: (window : *SDL_Window) -> int #foreign;
SDL_UpdateWindowSurfaceRects :: (window : *SDL_Window, rects : *SDL_Rect, numrects : int) -> int #foreign;
SDL_VideoInit :: (driver_name : string) : int #foreign;
SDL_VideoQuit :: () -> void #foreign;