ColourState = Class{__includes = BaseState}

function ColourState:init()
    
end

function ColourState:update(dt)
   
end

function ColourState:render()
    love.graphics.clear(getColour("Bright Yellow"))
    setColour("Bright Blue")
    love.graphics.setFont(gTitleFont)
    love.graphics.printf('OH MUMMY!', 0, 0, VIRTUAL_WIDTH, 'center')
    counter = 8;
    for k, v in pairs(gColours) do
        setColour(k)
        love.graphics.printf(k, 0, counter, VIRTUAL_WIDTH, 'center')
        counter = counter + 8
    end
end

function ColourState:exit() end
