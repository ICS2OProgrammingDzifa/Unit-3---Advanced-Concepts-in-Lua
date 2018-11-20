
-----------------------------------------------------------------------------------------
-- splash_screen.lua
-- Created by: Your Name
-- Date: Month Day, Year
-- Description: This is the splash screen of the game. It displays the 
-- company logo that...
-----------------------------------------------------------------------------------------
-- hide status bar
display.hidestatusbar
-- Use Composer Library
local composer = require( "composer" )

-- Name the Scene
sceneName = "splash_screen"

-----------------------------------------------------------------------------------------

-- Create Scene Object
local scene = composer.newScene( sceneName )

----------------------------------------------------------------------------------------
-- SOUNDS
-----------------------------------------------------------------------------------------

-- load a evil sound
local evil = audio.loadSound("Sounds/evil.mp3")
local evilSoundChannel 

----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
 
-- The local variables for this scene
local vampire
local scrollSpeed = 3
local Monsterfun
local backgroundImage


--------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------------------


-- Function: MoveVampire
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the Vampire
local function MoveVampire(event)
    -- add the scroll speed to the x-value of the vampire
    vampire.x = vampire.x + scrollSpeed


    -- change the transparency of the vampire every time it moves
    -- so that it fades out.
    vampire.alpha = vampire.alpha - 0.00000000000001
end



-- The function that will go to the main menu 
local function gotoMainMenu()
    composer.gotoScene( "main_menu" )
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- Insert the background image
     backgroundImage = display.newImageRect("Images/RainbowBackground@2x.png", 2048, 1536)

    -- Insert the vampire image
    Monsterfun = display.newImageRect("Images/Monsterfun.png", 500, 200)


    -- set the initial x and y position of monsterfun.
    Monsterfun.x = 500
    Monsterfun.y = display.contentHeight/5
    
    -- Insert the vampire image
    vampire = display.newImageRect("Images/vampire.png", 300, 200)

    -- set the initial x and y position of the vampire
    vampire.x = 500
    vampire.y = display.contentHeight/2

     -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( backgroundImage )

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( vampire )

   -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( Monsterfun )

end -- function scene:create( event )

--------------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then

        -- MoveVampire will be called over and over again
        Runtime:addEventListener("enterFrame", MoveVampire)

        -- play evil sound
        evilSoundChannel = audio.play(evil)

        -- Go to the main menu screen after the given time.
        timer.performWithDelay ( 3000, gotoMainMenu)          
        
    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is on screen (but is about to go off screen).
    -- Insert code here to "pause" the scene.
    -- Example: stop timers, stop animation, stop audio, etc.
    if ( phase == "will" ) then  

    -----------------------------------------------------------------------------------------

    -- Called immediately after scene goes off screen.
    elseif ( phase == "did" ) then
        
        -- stop the jungle sounds channel for this screen
        audio.stop(jungleSoundsChannel)
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------


    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
end -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
