require "lib/game/entity"
Bumper = Entity:extend()

function Bumper:new(pos)
	self.pos = pos or Vector(0,0)
	self.dim = Vector(20,60)
	self.color = {255,255,255}
end


function Bumper:update(dt)
	if(love.keyboard.isDown('w'))then
		self.pos.y = self.pos.y - 200 * dt
	end
	if(love.keyboard.isDown('s'))then
		self.pos.y = self.pos.y + 200 * dt
	end
end
