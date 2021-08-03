InstructionsState = Class{__includes = BaseState}

function InstructionsState:init()
   instructions1 = [[
  Hello, I'm Anthony Hopkins. You may recognise my voice from the Need For Speed audio books I was forced to narrate by an alabaster titan.

  Alice, I need your help. Narrating these audio books has been seriously detrimental to my mental health. I need you to enter The Cavern Of Lies and discover a means to deactivate the titans.
   ]]   
   instructions2 = [[
  In order to help you I have stolen the cloning machine from the 2021 E3 conference, whatever that is, and have made copies of yourself.  

  You must descend into the Cavern of Lies, but be warned: each level has 2 Alabaster Titans, one lies hidden while the other goes in search of the intruders.
   ]]
   instructions3 = [[
  The partly excavated levels are in the form of a grid made up of twenty ‘boxes’.
  
  To uncover a ‘box’, move along the four sides of the box from each corner of the next.
  
  Not all boxes need to be uncovered to enable you to go through the Exit and into the next level.
   ]]
   instructions4 = [[  
  Each level contains ten Treasure boxes, six empty boxes, and the rest holds a Royal Titan, an Alabaster Titan, a Key and a Scroll.
  
  If you uncover the box holding an Alabaster Titan it will dig it’s way out and pursue you.  Being caught by an Alabaster Titan kills one member of your clone team and the Titan, unless you have uncovered the Scroll.
  ]]
   instructions5 = [[
  The Magic Scroll will allow you to be caught by a Alabaster Titan without any harm to you or your clones.  The Scroll works only on the level on which found, it will only destroy one Alabaster Titan.
  
  There are two ways to gain points, one is by uncovering the Royal Titan the other, by uncovering Treasure.
  ]]
   instructions6 = [[
  When the boxes holding the Key and the Royal Titan have been uncovered, you will be able to leave the level. Any remaining Alabaster Titans will be able to follow you onto the next level.

  After completing all 5 levels of a cavern you will, when you leave the fifth level, move to level 1 of the next cavern.
  ]]
   instructions7 = [[
  When you have completed a cavern, your success will be rewarded either by bonus points or the arrival of an extra member of your clone team.
  
  The Alabaster Titans in the next cavern, having been warned by those you have escaped from, will be more alert, so although the Alabaster Titans cannot follow you from one cavern to the next, it will pay to be even more careful.
  ]]
   instructions8 = [[
  You can control your team by using the cursor keys
  
  The game has 5 skill levels, these determine how ‘clever’ the Alabaster Titans are at the beginning of a game.  You may choose between 5 different speed levels, from moderate to murderous.

  Good luck!
  ]]
   self.instructions = {instructions1, instructions2, instructions3, instructions4, instructions5, instructions6, instructions7, instructions8}
   self.page = 1
   self.continueText = 'Press "C" to Continue'
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