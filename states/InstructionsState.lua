InstructionsState = Class{__includes = BaseState}

function InstructionsState:init()
   instructions1 = [[
  You have been appointed head of an archeological expedition,  sponsored by the British Museum, and have been sent to Egypt to explore newly found pyramids.
  
  Your party, initially, consists of five members.  Your task is to enter the five levels of each pyramid, and recover from them five Royal Mummies and as much treasure as you can.
   ]]   
   instructions2 = [[
  Each level has already been partly uncovered by local workers and it is up to your team to finish the dig.
  
  Each level has 2 Guardian Mummies, one lies hidden while the other goes in search of the intruders.
   ]]
   instructions3 = [[
  The partly excavated levels are in the form of a grid made up of twenty ‘boxes’.
  
  To uncover a ‘box’, move your team along the four sides of the box from each corner of the next.
  
  Not all boxes need to be uncovered to enable you to go through the Exit and into the next level.
   ]]
   instructions4 = [[  
  Each level contains,  ten Treasure boxes, six empty boxes, and the rest holds a Royal Mummy, a Guardian Mummy a Key and a Scroll.
  
  If you uncover the box holding the Guardian Mummy, it will dig it’s way out and pursue you.  Being caught by a Guardian Mummy kills one member of your team and the Mummy, unless that is, you have uncovered the Scroll.
  ]]
   instructions5 = [[
  The Magic Scroll will allow you to be caught by a Guardian, without any harm to your team.  The Scroll works only on the level on which found, it will only destroy one Guardian.
  
  There are two ways to gain points, one is by uncovering the Royal Mummy the other, by uncovering Treasure.
  ]]
   instructions6 = [[
  When the boxes holding the Key and the Royal Mummy have been uncovered, you will be able to leave the level. Any remaining Guardians will be able to follow you onto the next level.

  After completing all 5 levels of a pyramid you will, when you leave the fifth level, move to level 1, of the next pyramid.
  ]]
   instructions7 = [[
  When you have completed a pyramid, your success will be rewarded either by bonus points or the arrival of an extra member of your team.
  
  The Guardians in the next pyramid, having been warned by those you have escaped from, will be more alert, so although the Guardians cannot follow you from one pyramid to the next, it will pay to be even more careful.
  ]]
   instructions8 = [[
  You can control your team by using either a Joystick, or the Keyboard.
  
  The keyboard keys are :-
  
A - Up  Z - Down   / - Left  - Right
  
  The game has 5 skill levels, these determine how ‘clever’ the Guardians are at the beginning of a game.  You may choose between 5 different speed levels, from moderate to murderous.

May Ankh-Sun-Ahmun guide your steps
  ]]
   self.instructions = {instructions1, instructions2, instructions3, instructions4, instructions5, instructions6, instructions7, instructions8}
   self.page = 1
   self.continueText = 'Press "C" or Fire Button to Continue'
end

function InstructionsState:update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    if love.keyboard.wasPressed('c') then
        if self.page == 8 then gStateMachine:change('pre') end
        self.page = self.page + 1
        love.keyboard.reset()
    end
end

function InstructionsState:render()
    love.graphics.clear(getColour("Bright Yellow"))
    setColour("Black")
    love.graphics.rectangle("fill", 40, 60, 310, 150)
    -- drawItem(itemCoffin, 4, 4)
    setColour("Sky Blue")
    love.graphics.printf('OH MUMMY - SCENARIO', 90, 20, 310)
    setColour("Bright Yellow")
    love.graphics.printf(self.instructions[self.page], 50, 70, 300)
    setColour("Orange")
    love.graphics.printf(self.continueText, 50, 190, 310)
end

function InstructionsState:exit()
    love.keyboard.reset()
end