function love.load()
	boxWidth = 170
	boxHeight = 75

	world = love.physics.newWorld()
	box = {}
	box.b = love.physics.newBody(world, 200, 200, "dynamic")
	box.b:setMass(10)
	box.b:applyLinearImpulse(love.math.random(500, 600), love.math.random(500, 600))
	box.s = love.physics.newRectangleShape(boxWidth, boxHeight)
	box.f = love.physics.newFixture(box.b, box.s)
	box.f:setRestitution(1)
	box.f:setUserData("Box")
	box.f:setFriction(0)
	box.b:setFixedRotation(true)

	image = love.graphics.newImage("gfx/cd.png")
	love.graphics.setBackgroundColor(1, 1, 1)

	love.window.setTitle("Epic gay thing")

	love.keyboard.setKeyRepeat(true)

	walls = {}
	walls.body = love.physics.newBody(world, 0, 0, "static")
	walls.shape = love.physics.newChainShape(true, 0, 0, 400, 0, 400, 400, 0, 400)
	walls.fixture = love.physics.newFixture(walls.body, walls.shape)
	sx, sy = 0.5, 0.5
end

function love.keypressed(key)
	vx, vy = box.b:getLinearVelocity()
	r = love.graphics.getBackgroundColor()
	if key == "w" then
		box.b:applyLinearImpulse(vx * 1.5, vy * 1.5)
	elseif key == "s" then
		box.b:applyLinearImpulse(-vx * 0.5, -vy * 0.5)
	elseif key == "d" then
		if r == 1 then
			love.graphics.setBackgroundColor(0, 0, 0)
		else
			love.graphics.setBackgroundColor(1, 1, 1)
		end
	elseif key == "a" then
		sy = sy + 0.01
		sx = sx + 0.01
		if box.f then
			box.f:destroy()
		end
		local w = image:getWidth() * sx
		local h = image:getHeight() * sy
		box.s = love.physics.newRectangleShape(w, h)
		box.f = love.physics.newFixture(box.b, box.s)
		box.f:setRestitution(1)
		box.f:setFriction(0)
	end
end

function love.update(dt)
	world:update(dt)
end

function love.draw()
	love.graphics.draw(image, box.b:getX(), box.b:getY(), 0, sx, sy, image:getWidth() / 2, image:getHeight() / 2)
end
