local transfer = {
    navbar = bottomnav,


}


function transactions:load()

end

function transactions:update(dt)
    bottomnav:update(dt)

end

function transactions:draw()
   
    bottomnav:draw()
end



return transactions
