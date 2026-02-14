function love.load()
	showHitboxes = true
	world = love.physics.newWorld()
	box = {}
	box.b = love.physics.newBody(world, 200, 200, "dynamic")
	box.b:setMass(10)
	box.b:applyLinearImpulse(love.math.random(400, 600), love.math.random(400, 600))
	box.s = love.physics.newRectangleShape(60, 60)
	box.f = love.physics.newFixture(box.b, box.s)
	box.f:setRestitution(1)
	box.f:setUserData("Box")
	box.f:setFriction(0)
	box.b:setFixedRotation(true);

	static = {}

	static.roof = {}
	static.roof.b = love.physics.newBody(world, 0, 0, "static")
	static.roof.s = love.physics.newRectangleShape(400, 1)
	static.roof.f = love.physics.newFixture(static.roof.b, static.roof.s)
	static.roof.f:setUserData("Roof")

	static.wallr = {}
	static.wallr.b = love.physics.newBody(world, 400, 200, "static")
	static.wallr.s = love.physics.newRectangleShape(1, 400)
	static.wallr.f = love.physics.newFixture(static.wallr.b, static.wallr.s)
	static.wallr.f:setUserData("WallR")

	static.walll = {}
	static.walll.b = love.physics.newBody(world, 0, 200, "static")
	static.walll.s = love.physics.newRectangleShape(1, 400)
	static.walll.f = love.physics.newFixture(static.walll.b, static.walll.s)
	static.walll.f:setUserData("WallL")

	static.ground = {}
	static.ground.b = love.physics.newBody(world, 200, 400, "static")
	static.ground.s = love.physics.newRectangleShape(400, 1)
	static.ground.f = love.physics.newFixture(static.ground.b, static.ground.s)
	static.ground.f:setUserData("Ground")
end

function love.update(dt)
	world:update(dt)
end

function love.draw()

	-- love.graphics.setColor(1, 0, 0)
    -- love.graphics.polygon("line",
    --     static.ground.b:getWorldPoints(static.ground.s:getPoints())
    -- )
    -- love.graphics.polygon("line",
    --     static.wallr.b:getWorldPoints(static.wallr.s:getPoints())
    -- )
    -- love.graphics.polygon("line",
    --     static.walll.b:getWorldPoints(static.walll.s:getPoints())
    -- )
    -- love.graphics.polygon("line",
    --     static.roof.b:getWorldPoints(static.roof.s:getPoints())
    -- )
    -- love.graphics.polygon("line",
    --     box.b:getWorldPoints(box.s:getPoints())
    -- )
    -- love.graphics.setColor(1, 1, 1)

	love.graphics.rectangle("fill", box.b:getX() - 30, box.b:getY() - 30, 60, 60)
end
