home = {
    navbar = {
        grids = 5,
        items = {
            {
                img = utils.img("assets/images/home.png"),
                alt = "Home",
                link = "home",
                flex = 1,
            },
            {
                img = utils.img("assets/images/profile.png"),
                alt = "Profile",
                link = "profile",
                flex = 1,
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