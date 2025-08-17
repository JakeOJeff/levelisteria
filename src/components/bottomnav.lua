local bottomNav = {
    x = 0,
    y = 0,
    grids = 5,
    selected = 1,
    width = 0,
    height = 120 * scale,
    spacing = 20 * scale,
    imageW = 60 * scale,
    imageH = 60 * scale,
    items = {
        {
            img = utils.img("assets/icons/menu.png"),
            alt = "Home",
            link = "home",
            flex = 3,
        },
        {
            img = utils.img("assets/icons/profile.png"),
            alt = "Profile",
            link = "profile",
            flex = 5,
        },
        {
            img = utils.img("assets/icons/profile.png"),
            alt = "Profile",
            link = "profile",
            flex = 5,
        },
                {
            img = utils.img("assets/icons/profile.png"),
            alt = "Profile",
            link = "profile",
            flex = 5,
        },
                {
            img = utils.img("assets/icons/profile.png"),
            alt = "Profile",
            link = "profile",
            flex = 5,
        },
    }
}


function bottomNav:load()
    self.grids = #self.items
    self.items = utils.sortFlexList(self.items)
    self.y = wH - self.height/2 - self.imageH/2
    self.width = (self.grids * self.imageW) + ((self.grids - 1) * self.spacing)
    self.x = (wW - self.width) / 2
end


function bottomNav:draw()

    love.graphics.setColor(utils.hexToRgb(colors[2]))
    love.graphics.rectangle("fill", 0, wH - self.height, wW, self.height)

    love.graphics.setColor(1,1,1)

    for i = 1, self.grids do
        local item = self.items[i]
        love.graphics.draw(item.img, self.x + (i - 1) * (self.imageW + self.spacing), self.y, 0, self.imageW/item.img:getWidth(), self.imageH/item.img:getHeight())
    end

end

return bottomNav