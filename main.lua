-- Written By Calum Lindsay.

-- It is a very simple implementation
-- of the classic pong game I am making
-- with the LÖVE 2D Game engine to try out
-- an idea to use lua to be able to update
-- a game running over LAN on 2 computers
-- while playing and only sending the
-- differences between the files.

-- How to run it:
-- You will need the LÖVE Engine to run
-- it which you can get here:
-- https://love2d.org
-- Download any of the zipped versions,
-- extract them and drag the folder 
-- containing the pong source code
-- onto the "love.exe" executable

-- Controls:
-- mouse and keyboard to interact with menus
-- Up and Down or W and S to move your bumper
-- Esc to pause/unpause the game and show menu
-- If you are the host:
-- r to reload scripts

-- TODO:
-- 1)Everything

SCREENWIDTH = 1200
SCREENHEIGHT = SCREENWIDTH * .75

scores = {0,0}
highlightedMenuItem = 0
menuHeaderFont = love.graphics.newFont(64)
menuHeader2Font = love.graphics.newFont(32)
menuHeader3Font = love.graphics.newFont(20)

function reloadGame()

end

function love.load()
	socket = require "socket"
	gui = require "lib/gui/gui"
	require "bumper"
	require "ball"

	w,h,flags = love.window.getMode()
	love.window.setMode(SCREENWIDTH,SCREENHEIGHT,flags)
	love.window.setTitle("Pong")
	love.graphics.setBackgroundColor(0,0,0)
	paused = false
	gameOver = false
	gameWon = false

end

function love.draw()
	gui:draw()
end

function love.update(d)
	gui:update()
end

function love.keypressed(key)
	if(key == "escape")then
		-- Handle shared pausing
		paused = not paused
	end
	if(key == "r")then
		reloadGame()
	end
	if(key == "up" or key == "w")then

	end
	if(key == "down" or key == "s")then
		
	end
end