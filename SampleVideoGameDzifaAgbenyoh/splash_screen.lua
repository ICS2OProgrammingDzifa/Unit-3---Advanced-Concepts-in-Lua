-----------------------------------------------------------------------------------------
--
-- splash_screen.lua
-- Created by: Dzifa Agbenyoh
-- Date: November 22, 2018
-- Description: This is the splash screen of the game. It displays the 
-- company logo that...
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-- Name the Scene
sceneName = "splash_screen"

-----------------------------------------------------------------------------------------

-- Create Scene Object
local scene = composer.newScene( sceneName )

----------------------------------------------------------------------
--SOUNDS
----------------------------------------------------------------------
-- Correct sound
local evilSound = audio.loadSound( "Sounds/evil.mp3" ) -- Setting a variable to an mp3 file
local evilSoundChannel

----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
 
-- background image with width and height
local backgroundImage
local vampire
local Monsterfun 
local scrollSpeed = 3


--------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------------------

-- The function that moves the beetleship across the screen
local function moveVampire()
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

    -- set the background to be black
    display.setDefault("background", 0, 0, 0)

    -- create background image
    backgroundImage = display.newImageRect("Images/RainbowBackground@2x.png", 2048, 1536)

    -- create monster fun text
    Monsterfun = display.newImageRect("Images/Monsterfun.png", 300, 200)

    -- Insert the vampire image
    vampire = display.newImageRect("Images/vampire.png", 200, 200)

    -- set the initial x and y position of the vampire
    vampire.x = 100
    vampire.y = display.contentHeight/2

    -- set the initial x and y position of monsterfun.
    Monsterfun.x = 500
    Monsterfun.y = display.contentHeight/5
    



    -- Inserts vampire, monster fun text and background in order
    sceneGroup:insert( backgroundImage )
    sceneGroup:insert( Monsterfun )
    sceneGroup:insert( vampire )
   

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
        -- start the splash screen music
        evilSoundsChannel = audio.play(evilSound )

        -- Call the moveVampire function as soon as we enter the frame.
        Runtime:addEventListener("enterFrame", moveVampire)

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
        audio.stop(evilSoundsChannel)
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
