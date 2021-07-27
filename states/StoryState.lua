StoryState = Class{__includes = BaseState}

function StoryState:init()
    self.headText = [[
  !!  STOP   PRESS  !!
    ]]
    self.bodyText = [[
  British Museum today announced successful excavation of ancient Egyptian pyramid.
    ]]

    self.endText = [[
  Leader of team given extra man for next dig.
    ]]
   self.continueText = 'Press "C" or Fire Button to Continue'
end

function StoryState:update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    if love.keyboard.wasPressed('c') then
        gStateMachine:change('play')
    end
end

function StoryState:render()
    love.graphics.clear(getColour("Bright Yellow"))
    setColour("Black")
    love.graphics.rectangle("fill", 40, 60, 310, 150)
    setColour("Orange")
    love.graphics.printf(self.headText, 50, 80, 310)
    setColour("Bright Yellow")
    love.graphics.printf(self.bodyText, 50, 110, 310)
    setColour("Sky Blue")
    love.graphics.printf(self.endText, 50, 160, 310)
    setColour("Orange")
    love.graphics.printf(self.continueText, 50, 190, 310)
end

function StoryState:exit()
    love.keyboard.reset()
end