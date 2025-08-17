local bottomNav = {
    x = 0,
    y = 0,
    grids = 5,
    selected = 2,
    width = 0,
    height = 160 * scale,
    spacing = 60 * scale,
    imageW = 85 * scale,
    imageH = 85 * scale,
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


function bottomNav:load(scene)
    self.currentScene = scene
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
        item.rotation = 0
        if i == 2 then
            item.width = item.width + 30 * scale
            item.x = item.x - 15 * scale

            item.height = item.height + 30 * scale
            item.y = item.y - 50 * scale
        end
    end


    self.settings.width = self.imageW - 20 * scale
    self.settings.height = self.imageH - 20 * scale
    self.settings.x = wW - self.settings.width - 10 * scale
    self.settings.y = 15 * scale
    print(self.settings.y)
end

function bottomNav:update(dt)
    local mx, my = love.mouse.getPosition()
    for i = 1, self.grids do
        local item = self.items[i]
        if mx >= item.x and mx <= item.x + item.width and my >= item.y and my <= item.y + item.height then
            item.hovering = true
            self.navHover = true
            if i == 2 then
                if love.system.getOS() ~= "Android" then
                    item.rotation = item.rotation + math.rad(5)
                end
            end

            if love.mouse.isDown(1) then
                self.selected = i
                self.currentScene.setScene(item.link)
            end
        else
            item.hovering = false
        end
    end
end

function bottomNav:draw()
    love.graphics.setColor(0, 0, 0, 0.1)
    love.graphics.circle("fill", self.x + self.width / 2, self.y - 5 * scale, self.height / 2)
    love.graphics.rectangle("fill", 0, wH - self.height - 5 * scale, wW, self.height)
    love.graphics.circle("fill", wW - 5 * scale, 0 + 5 * scale, self.height / 1.5)

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
        -- Draw image with rotation around its center
        love.graphics.draw(
            drawImg,
            item.x + item.width / 2,  -- center x
            item.y + item.height / 2, -- center y
            item.rotation,
            item.width / item.img:getWidth(),
            item.height / item.img:getHeight(),
            item.img:getWidth() / 2,
            item.img:getHeight() / 2
        )
    end
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(self.settings.img, self.settings.x, self.settings.y, 0,
        self.settings.width / self.settings.img:getWidth(), self.settings.height / self.settings.img:getHeight())
end

return bottomNav
