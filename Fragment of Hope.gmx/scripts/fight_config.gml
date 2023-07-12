#define fight_config
spawnerOn = 1
badTypes = 1
spawnCountTime = sec * global.spawnTime
spawnCount = sec * 2
global.arenaLock = 1
fight_grid()
gridMade = 1

audio_stop_sound(ambient)
audio_play_sound(battle, 10, 0)

charges = totalBad
initialBad = maxBad

///Enemy List Setup
if maxBad <= 2 //2
{
    aoeMax = 0
    auxMax = 0
    defenceMax = 0
}
else if maxBad <= 3
{
    aoeMax = 1
    auxMax = 2
    defenceMax = 0
}
else if maxBad <= 4
{
    aoeMax = 2
    auxMax = 2
    defenceMax = 1
}
else
{
    aoeMax = 2
    auxMax = 2
    defenceMax = 2
}

badSelect = ds_list_create()
badList = ds_list_create()

repeat(maxBad + 1)
{
    //Add enemies
    ds_list_clear(badSelect)
    
    //Pressure
    if !ds_list_find_index(badList, obj_bad2)
        ds_list_add(badSelect, obj_bad2)
    //if !ds_list_find_index(badList, obj_bad2b)
        //ds_list_add(badSelect, obj_bad2b)
    if !ds_list_find_index(badList, obj_bad6)
        ds_list_add(badSelect, obj_bad6)
    if !ds_list_find_index(badList, obj_bad13)and global.level > 1
        ds_list_add(badSelect, obj_bad13)
    //Ranged 
    if !ds_list_find_index(badList, obj_bad1)
        ds_list_add(badSelect, obj_bad1)
    if !ds_list_find_index(badList, obj_bad3)
        ds_list_add(badSelect, obj_bad3)
    if !ds_list_find_index(badList, obj_bad7)
        ds_list_add(badSelect, obj_bad7)
    if !ds_list_find_index(badList, obj_bad16) and global.level != 2
        ds_list_add(badSelect, obj_bad16)
    //AOE
    if aoeMax > 0
    {
        if !ds_list_find_index(badList, obj_bad3b)
            ds_list_add(badSelect, obj_bad3b)
        if !ds_list_find_index(badList, obj_bad11) and global.level != 2
            ds_list_add(badSelect, obj_bad11)
        if !ds_list_find_index(badList, obj_bad15)
            ds_list_add(badSelect, obj_bad12)
        if !ds_list_find_index(badList, obj_bad15) and global.level > 1
            ds_list_add(badSelect, obj_bad12)
    }
    //Aux
    if auxMax > 0
    {
        if !ds_list_find_index(badList, obj_bad4)
            ds_list_add(badSelect, obj_bad4)
        if !ds_list_find_index(badList, obj_bad8)
            ds_list_add(badSelect, obj_bad8)
        if !ds_list_find_index(badList, obj_bad9) and global.level > 1
            ds_list_add(badSelect, obj_bad9)
        if !ds_list_find_index(badList, obj_bad10)
            ds_list_add(badSelect, obj_bad10)
        if !ds_list_find_index(badList, obj_bad17)and global.level > 1
            ds_list_add(badSelect, obj_bad17)
        if !ds_list_find_index(badList, obj_bad18) and global.level > 1
            ds_list_add(badSelect, obj_bad18)
            
    }
    //Defence
    if defenceMax > 0
    {
        if !ds_list_find_index(badList, obj_bad3c) and global.level > 1
            ds_list_add(badSelect, obj_bad3c)
        if !ds_list_find_index(badList, obj_bad5) and global.level != 2
            ds_list_add(badSelect, obj_bad5)
        if !ds_list_find_index(badList, obj_bad14)
            ds_list_add(badSelect, obj_bad14)
            
    }
    
    ds_list_shuffle(badSelect)
    badAdd = ds_list_find_value(badSelect, 0)
    ds_list_add(badList, badAdd)
    
    if (badAdd = obj_bad3b) or (badAdd = obj_bad11) or (badAdd = obj_bad12) or (badAdd = obj_bad15)
        aoeMax -= 1
    if (badAdd = obj_bad4) or (badAdd = obj_bad8) or (badAdd = obj_bad9) or (badAdd = obj_bad10) or (badAdd = obj_bad17) or (badAdd = obj_bad18)
        auxMax -= 1
    if (badAdd = obj_bad3c) or (badAdd = obj_bad5) or (badAdd = obj_bad14)
        defenceMax -= 1
}

bigList = ds_list_create()
ds_list_add(bigList, obj_bad1_big)
ds_list_add(bigList, obj_bad2_big)
ds_list_add(bigList, obj_bad3b_big)
ds_list_add(bigList, obj_bad4_big)
ds_list_add(bigList, obj_bad10_big)
ds_list_add(bigList, obj_bad12_big)
ds_list_shuffle(bigList)
bigBad = ds_list_find_value(bigList,0)
ds_list_destroy(bigList)

///Spawner Logic
if spawnerOn = 1
{   
    spawnerList = ds_list_create()
    with obj_baddie_spawner
        ds_list_add(other.spawnerList, id)
    
    ds_list_shuffle(spawnerList)
        
    i = 0
    
    initialSpawn = 1
}

instance_create(x+108, y+108, obj_player1_hud)

#define fight_step
/*if gridMade = 0 and obj_camera.inPlace = 1
{
    fight_grid()
    gridMade = 1
}*/

if spawnerOn = 1
{
    if instance_exists(obj_player_parent)
    {
        if instance_number(obj_baddie) < maxBad
        {
        
            i = 0
            activeSpawners = 0
            ds_list_shuffle(spawnerList)
            
            repeat(ds_list_size(spawnerList))
            {
                if ds_list_find_value(spawnerList, i).bad != "none"
                    activeSpawners += 1
                i++
            }
            
            i = 0
            while(instance_number(obj_baddie) + activeSpawners + i < maxBad)
            {
                spawner = ds_list_find_value(spawnerList, i)
                i++
                
                if spawner.bad = "none"
                {
                
                    
                    ds_list_shuffle(badList)
                    bad = ds_list_find_value(badList, 0)
                    
                    //if irandom(7) = 0 and badRemove != "defense"
                    //{
                        //ds_list_shuffle(defenseBadList)
                        //bad = ds_list_find_value(defenseBadList, 0)
                    //}
                        
                   if totalBad < 1 and bigBad != -1
                   {
                        bad = bigBad
                        bigBad = -1
                   }
    
                    spawner.bad = bad
                    
                    totalBad -= 1
                    
                    if initialSpawn = 0
                        spawner.spawnTime = spawnCountTime
                    else
                        spawner.spawnTime = sec * 2
                        
                    spawner.image_index = 1
                }
                
                if i = 3
                    break
            }   
        }
        
        initialSpawn = 0
    }
    
    if spawnCount > -1
    spawnCount -= 1
}

#define fight_end
spawnerOn = 0
mp_grid_destroy(global.grid)
mp_grid_destroy(global.gridFly)
global.arenaLock = 0

audio_stop_sound(battle)
audio_play_sound(win, 10, 0)
audio_play_sound(ambient, 10, 0)

if instance_exists(obj_baddie)
    with obj_baddie
    {
        /*repeat(choose(2, 2, 3, 3))
            with instance_create(x, y, obj_health_orb)
                value = choose(1, 1, 1, 2, 2)*/
        instance_destroy()
        audio_stop_sound(kill)
    }
    
audio_stop_sound(kill)

instance_activate_object(obj_bad4_bullet)
    if instance_exists(obj_bad4_bullet)
        with obj_bad4_bullet
            instance_destroy()
        
if instance_exists(obj_bad6_bullet)
    with obj_bad6_bullet
        instance_destroy()
        
if instance_exists(obj_bad7_attack)
    with obj_bad7_attack
        instance_destroy()
        
if instance_exists(obj_bad3_reveal)
    with obj_bad3_reveal
        instance_destroy()
        
if instance_exists(obj_bad3_attack)
    with obj_bad3_attack
        instance_destroy()
        
if instance_exists(obj_bad12_seed)
    with obj_bad12_seed
        instance_destroy()
        
instance_activate_object(obj_wind_particle)
    if instance_exists(obj_wind_particle)
        with obj_wind_particle
            instance_destroy()
        
with obj_baddie_spawner
{
    if parent = other.id
    {
        repeat(ceil(5 * global.coinRate))
            with instance_create(x, y, obj_coin)
                value = 1
        instance_destroy()
    }
}

//obj_room_type.type = "arenaC"
//obj_room_type_collision.type = 5
//obj_camera.roomtype[obj_room_type_collision.i] = 5

with obj_player_parent
{
    gamepad_set_vibration(gamepadID,0.7,0)
    alarm[1] = sec * 1.1
    
    if currentHealth < minHealth
        currentHealth = minHealth
}

spawner = id
with obj_lootPoint
{
    if parent = other.id
        other.spawner = self
}
        

instance_create(spawner.x-54, spawner.y, obj_key)
with instance_create(spawner.x +27, spawner.y-27, obj_minorItem)
    discount = 1

instance_activate_object(obj_arena_blockout)

if global.mp = 1
{
    if instance_exists(obj_player1_corpse)
    {
        with instance_create(obj_player1_corpse.x, obj_player1_corpse.y, obj_player1)
            currentHealth = obj_player2.currentHealth
            
        with obj_player1_corpse
            instance_destroy()
    }
    
    if instance_exists(obj_player2_corpse)
    {
        with instance_create(obj_player2_corpse.x, obj_player2_corpse.y, obj_player2)
            currentHealth = obj_player1.currentHealth
            
        with obj_player2_corpse
            instance_destroy()
    }
}

//Temp Progression
global.fight += 1

obj_camera.inPlace = 0

if instance_exists(obj_sandstorm)
        instance_destroy(obj_sandstorm)
if instance_exists(obj_sandstorm_controller)
        instance_destroy(obj_sandstorm_controller)
if instance_exists(obj_wind_controller)
        instance_destroy(obj_wind_controller)

#define fight_grid
instance_activate_region(x, y, 1890, 1296, 1)

global.grid = mp_grid_create(x, y, 1890/54, 1296/54, 54, 54)
global.gridFly = mp_grid_create(x, y, 1890/54, 1296/54, 54, 54)

mp_grid_add_instances(global.grid, obj_solid, false)
mp_grid_add_instances(global.gridFly, obj_wall, true)
mp_grid_add_instances(global.grid, obj_door_lock, true)
mp_grid_add_instances(global.gridFly, obj_door_lock, true)
mp_grid_add_instances(global.grid, obj_door_lock_open, true)
mp_grid_add_instances(global.gridFly, obj_door_lock_open, true)

with(obj_thorns21)
{
    mp_grid_clear_rectangle(global.grid, x, y, x+108, y+54)
    mp_grid_clear_rectangle(global.gridFly, x, y, x+108, y+54)
    
}
with(obj_thorns31)
{
    mp_grid_clear_rectangle(global.grid, x, y, x+162, y+54)
    mp_grid_clear_rectangle(global.gridFly, x, y, x+162, y+54)
    
}
with(obj_thorns12)
{
    mp_grid_clear_rectangle(global.grid, x, y, x+54, y+108)
    mp_grid_clear_rectangle(global.gridFly, x, y, x+54, y+108)
    
}
with(obj_thorns13)
{
    mp_grid_clear_rectangle(global.grid, x, y, x+54, y+162)
    mp_grid_clear_rectangle(global.gridFly, x, y, x+54, y+162)
    
}