function love.draw()
	love.graphics.draw(Whale, 300, 200)
	love.graphics.print("Hello Earth!", 400, 300)
end

function love.load()
	Whale = love.graphics.newImage("gfx/whale.jpeg")
end

-- function love.load()
-- 	sound = love.audio.newSource("music.ogg", "stream")
-- 	love.audio.play(sound)
-- end
