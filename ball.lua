require "lib/game/entity"
Ball = Entity:extend()

function Ball:new()
	self.color = {255,255,255}
	self.dim = Vector(15,15)
	self.pos = Vector(SCREENWIDTH/2-self.dim.x/2,SCREENHEIGHT/2-self.dim.y/2)
	self.mov = Vector(100,60)
end

function Ball:update(dt)
	self.pos = self.pos + self.mov * Vector(dt,dt)

	--Left bumper collision
	if self.pos.x < leftBumper.pos.x + leftBumper.dim.x then
		if self.pos.y + self.dim.y > leftBumper.pos.y and 
			self.pos.y < leftBumper.pos.y + leftBumper.dim.y then
				local effle = leftBumper.pos.x + leftBumper.dim.x
				self.pos.x = effle + (effle - self.pos.x)
				self.mov.x = -self.mov.x
		end
	-- Right bumper collision
	elseif self.pos.x + self.dim.x > rightBumper.pos.x then
		if self.pos.y + self.dim.y > rightBumper.pos.y and 
			self.pos.y < rightBumper.pos.y + rightBumper.dim.y then
				local effri = rightBumper.pos.x - self.dim.x
				self.pos.x = effri - (self.pos.x - effri)
				self.mov.x = -self.mov.x
		end
	-- Top and bottom boundary collision
	elseif self.pos.y < 0 then
		self.pos.y = -self.pos.y
		self.mov.y = -self.mov.y
	elseif self.pos.y > SCREENHEIGHT - self.dim.y then
		local effbot = SCREENHEIGHT-self.dim.y
		self.pos.y = effbot - (self.pos.y - effbot)
		self.mov.y = -self.mov.y
	end

end
