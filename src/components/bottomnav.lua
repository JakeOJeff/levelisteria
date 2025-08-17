local bottomNav = {
    x = 0,
    y = 0,
    grids = 5,
    selected = 1,
    height = 120 * scale,
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

    }
}


function bottomNav:load()

end


function bottomNav:draw()

        love.graphics.setColor(0,0,1)
    love.graphics.rectangle("fill", 0, wH - bottomnav.height, wW, bottomnav.height)

end

return bottomNav