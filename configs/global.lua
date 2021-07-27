SCREEN_SCALE_FACTOR = 2

VIRTUAL_WIDTH = 384
VIRTUAL_HEIGHT = 270

WINDOW_WIDTH = VIRTUAL_WIDTH * SCREEN_SCALE_FACTOR
WINDOW_HEIGHT = VIRTUAL_HEIGHT * SCREEN_SCALE_FACTOR

SCREENAREA_WIDTH = 320
SCREENAREA_HEIGHT = 200
SCREENAREA_OFFSET_LEFT = 34
SCREENAREA_OFFSET_TOP = 41

PLAYAREA_WIDTH = 296
PLAYAREA_HEIGHT = 177
PLAYAREA_OFFSET_TOP = 50
PLAYAREA_OFFSET_LEFT = 48

GUTTER_WIDTH = 16
GUTTER_HEIGHT = 16
TILE_SIZE = 16

TOMB_WIDTH = 40
TOMB_HEIGHT = 24

gTitleFont = love.graphics.newFont('amstrad_cpc464.ttf', 8)
gTitleFont:setFilter( "nearest", "nearest" )

gTombColours = {
    { primary = "Orange", secondary = "Bright Yellow" },
    { primary = "Black", secondary = "Bright Yellow" },
    { primary = "Sea Green", secondary = "Bright Yellow" },
    { primary = "Black", secondary = "Sea Green" },
    { primary = "Bright Yellow", secondary = "Black" },
    { primary = "Sea Green", secondary = "Black" },
}

gColours = {
    ["Black"] = {0,0,0},
    ["Blue"] = {0,0,128},
    ["Bright Blue"] = {0,0,255},
    ["Red"] = {128,0,0},
    ["Magenta"] = {128,0,128},
    ["Mauve"] = {128,0,255},
    ["Bright Red"] = {255,0,0},
    ["Purple"] = {255,0,128},
    ["Bright Magenta"] = {255,0,255},
    ["Green"] = {0,128,0},
    ["Cyan"] = {0,128,128},
    ["Sky Blue"] = {0,128,255},
    ["Yellow"] = {128,128,0},
    ["White"] = {128,128,128},
    ["Pastel Blue"] = {128,128,255},
    ["Orange"] = {255,128,0},
    ["Pink"] = {255,128,128},
    ["Pastel Magenta"] = {255,128,255},
    ["Bright Green"] = {0,255,0},
    ["Sea Green"] = {"000",255,128},
    ["Bright Cyan"] = {"000",255,255},
    ["Lime"] = {128,255,0},
    ["Pastel Green"] = {128,255,128},
    ["Pastel Cyan"] = {128,255,255},
    ["Bright Yellow"] = {255,255,0},
    ["Pastel Yellow"] = {255,255,128},
    ["Bright White"] = {255,255,255}
}