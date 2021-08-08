WinState = Class{__includes = BaseState}

function WinState:init()
    self.headText = [[
  !!  STOP   PRESS  !!
    ]]
    self.bodyText = [[
  Congratulations Alice, during your last dig you uncovered a mysterious artifact called the "Electronic Wireless". With this device I can finally reprogramme my Guardian Titan using morse code and I'll never need to narrate Need For Go Fast novels again!
    ]]

    self.endText = [[
  Well done, you have finished the game. All of your clones have been terminated.
    ]]
   self.continueText = 'Press "C" or Fire Button to Continue'
end

function WinState:update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    if love.keyboard.wasPressed('c') then
        gStateMachine:change('pre')
    end
end

function WinState:render()
    love.graphics.clear(getColour("Bright Yellow"))
    setColour("Black")
    love.graphics.rectangle("fill", 40, 60, 310, 150)
    setColour("Bright Yellow")
    love.graphics.printf(self.bodyText, 50, 80, 310)
    setColour("Sky Blue")
    love.graphics.printf(self.endText, 50, 160, 310)
    setColour("Orange")
    love.graphics.printf(self.continueText, 50, 190, 310)
end

function WinState:exit()
    love.keyboard.reset()
end