Config.Shopy['steakhouse'] = {
    Pos   = {x = 2568.5, y = 4651.94, z = 33.08},
    Size  = { x = 1.1, y = 1.1, z = 0.3 },
    Color = { r = 255, g = 119, b = 0 },
    Type  = 1,
    Items = {
        { name = 'vitela',        label = 'Hovezí maso', price = 15 },
        { name = 'pork',    label = 'Veprove maso',     price = 15 },
        { name = 'carnep',    label = 'Mlete maso',     price = 15 },
        { name = 'camarones',    label = 'Krevety',     price = 15 },
        { name = 'meat',    label = 'Kureci maso',     price = 15 },
        { name = 'bacon',    label = 'Slanina',     price = 15 },
        { name = 'tofu',    label = 'Tofu',     price = 15 },
        { name = 'deer_meat',    label = 'Zverina',     price = 50 },
        { name = 'onion',       label = 'Cibule',        price = 100 },
        { name = 'alface',    label = 'Zeli',     price = 100 },
        { name = 'freshcoffe',    label = 'Kavova zrna',     price = 100 },
        { name = 'potato',    label = 'Brambory',     price = 100 },
        { name = 'pepperoni',    label = 'Paprika',     price = 100 },
        { name = 'cucumber',    label = 'Okurka',     price = 100 },
        { name = 'tomate',    label = 'Rajcata',     price = 100 },
        { name = 'carrot',    label = 'Mrkev',     price = 100 },
        { name = 'avocado',    label = 'Avokado',     price = 100 },
        { name = 'oil',    label = 'Olej',     price = 10 },
        { name = 'queijo',    label = 'Syr',     price = 225 },
        { name = 'torteliny',    label = 'Testoviny',     price = 10 },
        { name = 'ovo',    label = 'Vejce',     price = 10 },
        { name = 'manteiga',    label = 'Maslo',     price = 225 },
        { name = 'water',    label = 'Voda',     price = 10 },
        { name = 'cocacola',    label = 'Coca Cola',     price = 5 },
        { name = 'icetea',    label = 'Ledovy caj',     price = 5 },
        { name = 'energy',    label = 'Energy drink',     price = 5 },
        { name = 'limonade',    label = 'Limonáda',     price = 5 },
        { name = 'beer',    label = 'Pivko',     price = 550 },
        { name = 'spices',    label = 'Koreni',     price = 5 },
        { name = 'mustard',    label = 'Horcice',     price = 5 },
        { name = 'bun',    label = 'Houska',     price = 5 },
        { name = 'pecivo',    label = 'Pecivo',     price = 5 },
        { name = 'ketchup',    label = 'Kecup',     price = 5 },
        { name = 'mayo',    label = 'Tatarka',     price = 5 },
        { name = 'teabag',    label = 'Cajovy sacek',     price = 5 },
    },
}

local sellPrice = 660

Config.Sell['steakhouse'] = {
    Pos     = { x = -3151.64, y = 1105.01, z = 19.85 },
    Size  = { x = 1.5, y = 1.5, z = 0.4 },
    Color = { r = 255, g = 119, b = 0 },
    Type  = 1,
    Items = {
        {item = 'steak_ribeye', price = sellPrice},
        {item = 'steak_striploin', price = sellPrice},
        {item = 'steak_tbone', price = sellPrice},
        {item = 'steak_rumpsteak', price = sellPrice},
        {item = 'steak_flank', price = sellPrice},
        {item = 'burger_classic', price = sellPrice},
        {item = 'burger_texas', price = sellPrice},
        {item = 'burger_mtchiliad', price = sellPrice},
        {item = 'burger_ls', price = sellPrice},
        {item = 'deer_burger', price = sellPrice},
        {item = 'doe_burger', price = sellPrice},
        {item = 'doe_steak', price = sellPrice},
        {item = 'deer_steak', price = sellPrice},
        {item = 'spagety', price = sellPrice},
        {item = 'spagety_carbonara', price = sellPrice},
        {item = 'lasagne', price = sellPrice},
        {item = 'salad_caesar', price = sellPrice},
        {item = 'salad_vege', price = sellPrice},
        {item = 'salad_tofu', price = sellPrice},
    }
}