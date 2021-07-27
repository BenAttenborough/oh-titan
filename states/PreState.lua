PreState = Class{__includes = BaseState}

local utf8 = require("utf8")
require 'items.player.playerSprite'

function PreState:init()
    if scoreInput then
        playerName = ""
        position = #highScores + 1
        local i = #highScores
        for i = 5, 1, -1 do
            if score >= highScores[i].amount then
                position = position - 1
            else
                break
            end
        end
        if position < 6 then
            table.insert(highScores, position, {name = "", amount = score})
            table.remove(highScores, #highScores)
        else
            scoreInput = false
        end
    end
end

function PreState:update(dt)
    if scoreInput then
        if love.keyboard.wasPressed('return') then
            scoreInput = false
            highScores[position].name = playerName
            love.keyboard.reset()
        end
        if love.keyboard.wasPressed('backspace') then
            -- get the byte offset to the last UTF-8 character in the string.
            local byteoffset = utf8.offset(playerName, -1)
    
            if byteoffset then
                -- remove the last UTF-8 character.
                -- string.sub operates on bytes rather than UTF-8 characters, so we couldn't do string.sub(text, 1, -2).
                playerName = string.sub(playerName, 1, byteoffset - 1)
            end
            love.keyboard.reset()
        end
    else
        if love.keyboard.wasPressed('escape') then
            love.event.quit()
        end

        if love.keyboard.wasPressed('p') then
            resetGame()
            love.keyboard.reset()
            gStateMachine:change('play')
        end
        if love.keyboard.wasPressed('i') then
            love.keyboard.reset()
            gStateMachine:change('instructions')
        end
        if love.keyboard.wasPressed('o') then
            love.keyboard.reset()
            gStateMachine:change('options')
        end
    end
end

function PreState:render()
    love.graphics.clear(getColour("Sky Blue"))
    setColour("Black")
    playarea_rectangle("fill", 30, -10, 230, 170)
    setColour("Orange")
    playarea_rectangle("fill", 45, 5, 200, 140)
    setColour("Bright Yellow")
    playarea_rectangle("fill", 75, 20, 140, 30)
    playarea_rectangle("fill", 60, 45, 170, 85)
    setColour("Black")
    drawItem(playerSpriteRight2, 52, 20)
    drawItem(playerSpriteLeft2, 223, 20)
    screenarea_printf('HI-SCORE-TABLE', 0, 40, VIRTUAL_WIDTH, 'center')
    screenarea_printf('I-Instructions  O-Options  P-Play  ?', 0, 180, VIRTUAL_WIDTH, 'center')
    for i,score in ipairs(highScores) do
        screenarea_printf(string.format("%05d", score.amount), 80, 65 + (i -1) * 15, VIRTUAL_WIDTH )
        screenarea_printf(score.name, 130, 65 + (i -1) * 15, VIRTUAL_WIDTH )
    end
    if scoreInput then
        printPlayerName(130,65 + (position - 1) * 15)
    end
end

function PreState:exit()
    love.keyboard.reset()
end

function printPlayerName(x,y)
    setColour("Black")
    screenarea_printf(playerName, x, y, 100)
    screenarea_rectangle("fill", x + (#playerName * 8), y, 8, 8)
end