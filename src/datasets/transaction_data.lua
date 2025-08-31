local transaction_data = {
    -- THE FORMAT
    -- {
    --     id = 1,
    --     amount = 10000,
    --     partner = "JAKE BANK",
    --     date = "2025-08-21"
    -- }
}
local function random_date()
    -- Random date in August 2025
    local day = love.math.random(1, 31)
    return string.format("2025-08-%02d", day)
end

local partners = { "Alice", "Bob", "Charlie", "Jimmy", "Anrin", "JAKE BANK", "Eve", "MallMart" }


for i = 1, 30 do
    local t = {
        id = i,
        amount = love.math.random(-1000, 1000), -- can be negative (debit) or positive (credit)
        partner = partners[math.random(#partners)],
        date = random_date()
    }
    table.insert(transaction_data, t)
end

function returnBalance()
    local val = 0
    for i = 1, #transaction_data do
        val = val + transaction_data[i].amount
    end
    return val
end

return transaction_data
