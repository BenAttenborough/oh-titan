push = require 'libs.push'
Class = require 'libs.class'
Timer = require 'libs.timer'
M = require('libs.Moses.moses')

require 'StateMachine'
require 'states.BaseState'
require 'states.TitleState'
require 'states.ColourState'
require 'states.PlayState'
require 'states.PreState'
require 'states.InstructionsState'
require 'states.OptionsState'
require 'states.StoryState'

require 'configs.global'

require 'helpers.helpers'
require 'helpers.input'
require 'helpers.render'

require 'items.key'
require 'items.sarcophagus'
require 'items.coffin'
require 'items.scroll'
require 'map.map'
require 'items.player.player'
require 'items.footsteps.footstepsSprite'

function love.update(dt)
    gStateMachine:update(dt)
end

function addHighScore(name, amount)
    local score = {}
    score['amount'] = amount
    score['name'] = name
    table.insert(highScores, score)
end

function resetGame()
    score = 0
    lives = 5
    numberOfMummies = 1
    level = 1
    playerName = ""
    mummyIntelligence = 50
end

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.window.setTitle('Oh Mummy!')
    movementInterval = 0.10
    score = 0
    lives = 0
    numberOfMummies = 0
    level = 0
    scoreInput = false
    playerName = ""
    resetGame()
    highScores = {}
    mummyIntelligence = 25
    addHighScore('Stupendous !', 02500)
    addHighScore('Excellent !', 02000)
    addHighScore('Very Good !', 01500)
    addHighScore('Quite Good', 01000)
    addHighScore('Not Bad', 00500)
    mummyPositions = {{1,23},{36,23},{3,23},{34,23},{5,23},{32,23}}
    
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = true,
        vsync = true
    })

    currentMap = deepcopy(map)

    gStateMachine = StateMachine {
        ['title'] = function() return TitleState() end,
        ['colour'] = function() return ColourState() end,
        ['play'] = function() return PlayState() end,
        ['pre'] = function() return PreState() end,
        ['instructions'] = function() return InstructionsState() end,
        ['options'] = function() return OptionsState() end,
        ['story'] = function() return StoryState() end,
    }
    gStateMachine:change('title', {})
end

function love.draw()
    push:apply('start')
    gStateMachine:render()
    push:apply('end')
end

function love.textinput(t)
    if scoreInput and #playerName < 14 then
        playerName = playerName .. t
    end
end