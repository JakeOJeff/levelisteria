local bottomNav = {
    x = 0,
    y = 0,
    grids = 5,
    selected = 1,
    width = 0,
    height = 160 * scale,
    spacing = 40 * scale,
    imageW = 80 * scale,
    imageH = 80 * scale,
    navHover = false,
    items = {
        {
            img = utils.img("assets/icons/compass.png"),
            imgSelect = utils.img("assets/icons/compass-selected.png"),
            alt = "Home",
            link = "home",
            flex = 3,
        },
        {
            img = utils.img("assets/icons/profile.png"),
            imgSelect = utils.img("assets/icons/profile-selected.png"),
            alt = "Profile",
            link = "profile",
            flex = 5,
        },
        {
            img = utils.img("assets/icons/currency.png"),
            imgSelect = utils.img("assets/icons/currency-selected.png"),
            alt = "Stats",
            link = "stats",
            flex = 2,
        },
    },
    settings = {
        img = utils.img("assets/icons/settings.png"),
        alt = "Settings",
        link = "settings",
        width = 0,
        height = 0,
    }
}


function bottomNav:load()

    self.grids = #self.items
    self.items = utils.sortFlexList(self.items)
    self.y = wH - self.height / 2 - self.imageH / 2
    self.width = (self.grids * self.imageW) + ((self.grids - 1) * self.spacing)
    self.x = (wW - self.width) / 2
    for i = 1, #self.items do
        local item = self.items[i]
        item.hovering = false
        item.width = self.imageW
        item.height = self.imageH
        item.x = self.x + (i - 1) * (self.imageW + self.spacing)
        item.y = self.y
        if i == 2 then
            item.width = item.width + 30 * scale
            item.x = item.x - 15 * scale

            item.height = item.height + 30 * scale
            item.y = item.y - 50 * scale
        end
    end

   
    self.settings.width = self.imageW
    self.settings.height = self.imageH
    self.settings.x = wW - self.settings.width
    self.settings.y = self.settings.height/14
        print(self.settings.y)

end

function bottomNav:update(dt)
    local mx, my = love.mouse.getPosition()
    for i = 1, self.grids do
        local item = self.items[i]
        if mx >= item.x and mx <= item.x + item.width and my >= item.y and my <= item.y + item.height then
            item.hovering = true
            self.navHover = true

            if love.mouse.isDown(1) then
                self.selected = i
            end
        else

            item.hovering = false
        end
    end
end

function bottomNav:draw()
    love.graphics.setColor(utils.hexToRgb(colors[1]))
    love.graphics.circle("fill", self.x + self.width / 2, self.y, self.height / 2)
    love.graphics.rectangle("fill", 0, wH - self.height, wW, self.height)
    love.graphics.circle("fill", wW, 0, self.height / 1.5)

    love.graphics.setColor(1, 1, 1)

    for i = 1, self.grids do
        local item = self.items[i]
        local hoverY = self.y
        local drawImg = item.img
        if self.selected == i then
            love.graphics.setColor(utils.hexToRgb(colors[2]))
            drawImg = item.imgSelect
        elseif item.hovering then
            love.graphics.setColor(utils.hexToRgb(colors[3]))
        else
            love.graphics.setColor(1, 1, 1)
        end
        love.graphics.draw(drawImg, item.x, item.y, 0, item.width / item.img:getWidth(),
            item.height / item.img:getHeight())
    end
    love.graphics.setColor(1,1,1)
    love.graphics.draw(self.settings.img, self.settings.x,self.settings.y, 0, self.settings.width / self.settings.img:getWidth(), self.settings.height / self.settings.img:getHeight())
end

return bottomNav
