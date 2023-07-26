#define lgPlayer
lgPlayerObjects()
lgPlayerCoins()
lgPlayerBackground()

#define lgPlayerObjects
s = obj_start_blockout
if global.mp = 0
{
    if !instance_exists(obj_player1)
        instance_create(s.x + 324, s.y + 324, obj_player1)
    with obj_player1
    {
        x = other.s.x + 324
        y = other.s.y + 324
    }
}
else
{
    if !instance_exists(obj_player1)
        instance_create(s.x + 324, s.y + 324, obj_player1)
    if !instance_exists(obj_player2)
        instance_create(s.x + 324, s.y + 324, obj_player2)
        
    with obj_player1
    {
        x = other.s.x + 324 - 54
        y = other.s.y + 324
    }
    
    with obj_player2
    {
        x = other.s.x + 324 + 54
        y = other.s.y + 324
    }
}

if !instance_exists(obj_camera)
instance_create(s.x + 324, s.y + 324, obj_camera)

global.generation = 0

#define lgPlayerCoins
instance_activate_object(obj_barrel)

if global.mp = 0
{
    coins = 90
    if global.difficulty = "casual"
        coins = 135
}
else
    coins = 140
    


repeat(90)
{
    with instance_find(obj_barrel, irandom(instance_number(obj_barrel) - 1))
    {
        coins += 1
    }
}

global.generation = 0

#define lgPlayerBackground
if global.level = 1
    tile = back_level1
    
if global.level = 2
    tile = back_level2
    
if global.level = 3
    tile = back_level3
    
if global.level = 4
    tile = back_level4


i = 0
repeat(89)
{
    j = 0
    repeat(89)
    {
        j++
        k = 0
        
        if global.level = 1
            if irandom(3) = 0
                k = (irandom(4) + 1)
        tile_add(tile,k*54, 0, 54, 54, i*54, j*54, 1000)
    }
 
    i++   
}