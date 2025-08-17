home = {
    navbar = {
        grids = 5,
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
}


function home:load()
    print("State : Home")
end


function home:update(dt)

end


function home:draw()
    
end

return home