Config.Shopy['coffee'] = {
    Pos   = {x = 1182.76, y = -3307.53, z = 5.03},
    Size  = { x = 1.1, y = 1.1, z = 0.3 },
    Color = { r = 255, g = 119, b = 0 },
    Type  = 1,
    Items = {
        { name = 'ice',   label = 'Led',    price = 5 },
        { name = 'ovo',    label = 'Vejce',     price = 10 },
        { name = 'water',    label = 'Voda',     price = 10 },
        { name = 'pecivo',    label = 'Pecivo',     price = 5 },
        { name = 'icetea',    label = 'Ledovy caj',     price = 5 },
        {name = 'freshcoffe', label = 'Kavova zrna', price = 100},
        {name = 'mleko', label = 'Mleko', price = 150},
        {name = 'cukr', label = 'Cukr', price = 5},
        {name = 'caramel', label = 'Karamel', price = 10},
        {name = 'teabag', label = 'Cajovy sacek', price = 5},

        {name = 'flour', label = 'Mouka', price = 100},
        {name = 'manteiga', label = 'Maslo', price = 225},
        {name = 'smetana', label = 'Smetana', price = 225},
        {name = 'queijo', label = 'Syr', price = 225},
        {name = 'ham', label = 'Sunka', price = 15},
    },
}

local foodSellPrice = 660

Config.Sell['coffee'] = {
    Pos     = { x = 1726.88, y = 4765.38, z = 40.91},
    Size  = { x = 1.5, y = 1.5, z = 0.4 },
    Color = { r = 255, g = 119, b = 0 },
    Type  = 1,
    Items = {
        --KAVY
        {item = 'icecoffee', price = foodSellPrice},
        {item = 'kava_espresso', price = foodSellPrice},
        {item = 'kava_cappuccino', price = foodSellPrice},
        {item = 'kava_americano', price = foodSellPrice},
        {item = 'kava_latte', price = foodSellPrice},
        {item = 'caramel_frappuccino', price = foodSellPrice},
        {item = 'kava_flat_white', price = foodSellPrice},
        {item = 'icecoffee', price = foodSellPrice},
    }
}