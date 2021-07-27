OptionsState = Class{__includes = BaseState}

function OptionsState:init()
   self.speed = null
   self.difficulty = null
   self.music = null
   self.fx = null
end

function OptionsState:update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
    if not self.speed then
        if love.keyboard.wasPressed("1") then 
            self.speed = 1
            movementInterval = 0.02
            love.keyboard.reset()
        end
        if love.keyboard.wasPressed("2") then 
            self.speed = 2
            movementInterval = 0.04
            love.keyboard.reset()
        end
        if love.keyboard.wasPressed("3") then 
            self.speed = 3 
            movementInterval = 0.06
            love.keyboard.reset()
        end
        if love.keyboard.wasPressed("4") then 
            self.speed = 4 
            movementInterval = 0.08
            love.keyboard.reset()
        end
        if love.keyboard.wasPressed("5") then 
            self.speed = 5 
            movementInterval = 0.10
            love.keyboard.reset()
        end
    elseif not self.difficulty then
        if love.keyboard.wasPressed("1") then 
            self.difficulty = 1
            mummyIntelligence = 50
            love.keyboard.reset()
        end
        if love.keyboard.wasPressed("2") then 
            self.difficulty = 2
            mummyIntelligence = 55
            love.keyboard.reset()
        end
        if love.keyboard.wasPressed("3") then 
            self.difficulty = 3
            mummyIntelligence = 60
            love.keyboard.reset()
        end
        if love.keyboard.wasPressed("4") then 
            self.difficulty = 4
            mummyIntelligence = 65
            love.keyboard.reset()
        end
        if love.keyboard.wasPressed("5") then 
            self.difficulty = 5 
            mummyIntelligence = 70
            love.keyboard.reset()
        end
    elseif not self.music then
        if love.keyboard.wasPressed("y") then 
            self.music = "Y"
            love.keyboard.reset()
        end
        if love.keyboard.wasPressed("n") then 
            self.music = "N"
            love.keyboard.reset()
        end
    elseif not self.fx then
        if love.keyboard.wasPressed("y") then 
            self.fx = "Y"
            love.keyboard.reset()
        end
        if love.keyboard.wasPressed("n") then 
            self.fx = "N"
            love.keyboard.reset()
        end
    else
        if love.keyboard.wasPressed('c') then
        gStateMachine:change('pre')
        end
    end
end

function OptionsState:render()
    love.graphics.clear(getColour("Sky Blue"))
    setColour("Black")
    love.graphics.rectangle("fill", 30, 30, 320, 210)
    setColour("Orange")
    screenarea_printf('OH MUMMY - OPTIONS', 0, 0, VIRTUAL_WIDTH, 'center')
    setColour("Bright Yellow")
    screenarea_printf('SPEED OF GAME (1-5) ?', 0, 30, VIRTUAL_WIDTH, 'center')
    setColour("Sky Blue")
    if not self.speed then
        playarea_rectangle("fill", 235, 21, 8, 8)
    else
        screenarea_printf(self.speed, 250, 30, VIRTUAL_WIDTH)
    end
    setColour("Bright Blue")
    screenarea_printf('(1 IS FASTEST)', 0, 40, VIRTUAL_WIDTH, 'center')
    if self.speed then
        setColour("Bright Yellow")
        screenarea_printf('DIFFICULTY LEVEL (1-5) ?', 0, 70, VIRTUAL_WIDTH, 'center')
        setColour("Bright Blue")
        screenarea_printf('(1 IS HARDEST)', 0, 80, VIRTUAL_WIDTH, 'center')
        setColour("Sky Blue")
        if not self.difficulty then
            playarea_rectangle("fill", 245, 61, 8, 8)
        else
            screenarea_printf(self.difficulty, 260, 70, VIRTUAL_WIDTH)
        end
    end
    if self.difficulty then
        setColour("Bright Yellow")
        screenarea_printf('BACKGROUND MUSIC (Y-N) ?', 0, 110, VIRTUAL_WIDTH, 'center')
        setColour("Sky Blue")
        if not self.music then
            playarea_rectangle("fill", 245, 101, 8, 8)
        else
            screenarea_printf(self.music, 260, 110, VIRTUAL_WIDTH)
        end
    end
    if self.music then
        setColour("Bright Yellow")
        screenarea_printf('SOUND EFFECTS (Y-N) ?', 0, 140, VIRTUAL_WIDTH, 'center')
        setColour("Sky Blue")
        if not self.fx then
            playarea_rectangle("fill", 235, 131, 8, 8)
        else
            screenarea_printf(self.fx, 250, 140, VIRTUAL_WIDTH)
        end
    end
    if self.fx then
        setColour("Orange")
        screenarea_printf('Press "C" or Fire Button to Continue', 0, 170, VIRTUAL_WIDTH, 'center')
    end
end

function OptionsState:exit()
    love.keyboard.reset()
end