#define lgFill
lgFillPopulate()
lgFillBlockedEntrance()

#define lgFillPopulate
ds_list_shuffle(floor11List)
i = 0
with obj_arena_blockout
{
    roomType = ds_list_find_value(other.floor11List, other.i)
    scr_arena_create(x, y, roomType)
    other.i++
    visible = 0   
}
ds_list_destroy(floor11List)

with obj_start_blockout
{
    scr_arena_create(x, y, "start")
    visible = 0   
}
with obj_end_blockout
{
    scr_arena_create(x, y, "leave")
    visible = 0   
}
with obj_store_blockout
{
    shop = choose("shop1", "shop2", "shop3")

    scr_arena_create(x, y, shop)
    visible = 0   
}

with obj_consume_blockout
{
    scr_arena_create(x, y, "consumables")
    visible = 0   
}
with obj_alter_blockout
{
    scr_arena_create(x, y, "altar")
    visible = 0   
}



//Misc
if instance_exists(obj_misc_blockout1)
{
    with obj_misc_blockout1
    {
        scr_arena_create(x, y, "misc_hor_generic1")
        visible = 0
        
        if image_index = 2
        {
            with obj_entrance1alt
                if parent = other
                {
                    instance_create(x, y, obj_wall)
                    instance_destroy()
                }
                    
            with obj_entrance4alt
                if parent = other
                    {
                        instance_create(x, y, obj_wall)
                        instance_destroy()
                    }
        }
        
        if image_index = 3
        {
            with obj_entrance1
                if parent = other
                    {
                        instance_create(x, y, obj_wall)
                        instance_destroy()
                    }
                    
            with obj_entrance4
                if parent = other 
                    {
                        instance_create(x, y, obj_wall)
                        instance_destroy()
                    }
        }
    }
}

if instance_exists(obj_misc_blockout2)
{
    with obj_misc_blockout2
    {
        scr_arena_create(x, y, "misc_vert_generic1")
        visible = 0
        
        if image_index = 2
        {
            with obj_entrance2alt
                if parent = other
                {
                    instance_create(x, y, obj_wall)
                    instance_destroy()
                }
                    
            with obj_entrance3alt
                if parent = other
                    {
                        instance_create(x, y, obj_wall)
                        instance_destroy()
                    }
        }
        
        if image_index = 3
        {
            with obj_entrance2
                if parent = other
                    {
                        instance_create(x, y, obj_wall)
                        instance_destroy()
                    }
                    
            with obj_entrance3
                if parent = other 
                    {
                        instance_create(x, y, obj_wall)
                        instance_destroy()
                    }
        }
    }
}

if instance_exists(obj_misc_blockout3)
{
    with obj_misc_blockout3
    {
        scr_arena_create(x, y, "misc_square_generic1")
        visible = 0
        
        if image_index = 2
        {
            with obj_entrance1alt
                if parent = other
                {
                    instance_create(x, y, obj_wall)
                    instance_destroy()
                }
            with obj_entrance2alt
                if parent = other
                {
                    instance_create(x, y, obj_wall)
                    instance_destroy()
                }
                    
            with obj_entrance3alt
                if parent = other
                    {
                        instance_create(x, y, obj_wall)
                        instance_destroy()
                    }
            with obj_entrance4alt
                if parent = other
                {
                    instance_create(x, y, obj_wall)
                    instance_destroy()
                }
        }
        
        if image_index = 3
        {
            with obj_entrance1
                if parent = other
                    {
                        instance_create(x, y, obj_wall)
                        instance_destroy()
                    }
        
            with obj_entrance2
                if parent = other
                    {
                        instance_create(x, y, obj_wall)
                        instance_destroy()
                    }
                    
            with obj_entrance3
                if parent = other 
                    {
                        instance_create(x, y, obj_wall)
                        instance_destroy()
                    }
                    
            with obj_entrance4
                if parent = other 
                    {
                        instance_create(x, y, obj_wall)
                        instance_destroy()
                    }
        }
    }
}

//Walls
with obj_hor_wall
{
    i = 0
    repeat 10
    {
        with instance_create(x + i, y, obj_wall)
            if !place_meeting(x, y, obj_hor_wall)
                instance_destroy()
        i += 54
    }
    
    instance_destroy()
}

with obj_vert_wall
{
    i = 0
    repeat 10
    {
        with instance_create(x, y + i, obj_wall)
            if !place_meeting(x, y, obj_vert_wall)
                instance_destroy()
        i += 54
    }
    
    instance_destroy()
}

with obj_wall_corner
{
    instance_create(x, y, obj_wall)
    
    if place_meeting(x + 2, y + 2, obj_level_macro)
    {
        i = 0
        repeat(11)
        {
            j = 0
            repeat(11)
            {
                instance_create(x + (i * 54), y + (j * 54), obj_wall)
                j++
            }
            i++
        }
    }
}

//Empty
with obj_empty_blockout
{
    roomSelect = ds_list_create()

    deadend = 0
    open = 0
    
    if collision_point(x+270, y - 27, obj_gen_wall, 1, 1) or collision_point(x+270, y - 27, obj_wall, 1, 1)//Top
        deadend += 1    
    if collision_point(x+540+27, y+270, obj_gen_wall, 1, 1) or  collision_point(x+540+27, y+270, obj_wall, 1, 1)//Right
        deadend += 1
    if collision_point(x+270, y+540+27, obj_gen_wall, 1, 1) or collision_point(x+270, y+540+27, obj_wall, 1, 1)//Bottom
        deadend += 1
    if collision_point(x-27, y+270, obj_gen_wall, 1, 1) or collision_point(x-27, y+270, obj_wall, 1, 1)//Left
        deadend += 1
        
    if !collision_point(x+160, y - 27, obj_gen_wall, 1, 1) and !collision_point(x+160, y - 27, obj_wall, 1, 1)
        open = 1  
    if !collision_point(x+540+27, y+160, obj_gen_wall, 1, 1) and !collision_point(x+540+27, y+160, obj_wall, 1, 1)
        open = 1
    if !collision_point(x+160, y+540+27, obj_gen_wall, 1, 1) and !collision_point(x+160, y+540+27, obj_wall, 1, 1)
        open = 1
    if !collision_point(x-27, y+160, obj_gen_wall, 1, 1) and !collision_point(x-27, y+160, obj_wall, 1, 1)
        open = 1
    
    if deadend = 3
    {
        if open = 0
            roomType = "misc_single_deadend1"
        else
            roomType = "misc_single_deadend2"
    }
    else
    {
        addListToList(roomSelect, other.singleHybridList)
        if open = 0
            addListToList(roomSelect, other.singleClosedList)
        ds_list_shuffle(roomSelect)
        roomType = ds_list_find_value(roomSelect, 0)
    }
    
    if irandom(9) <= 2 and deadend != 3
        roomType = "misc_single_hybrid3"
        
    global.barrels = irandom(2)
    
    scr_arena_create(x, y, roomType)
    visible = 0
    
    global.barrels = 0
    
    ds_list_destroy(roomSelect)
}

ds_list_destroy(singleHybridList)
ds_list_destroy(singleClosedList)


#define lgFillBlockedEntrance
with obj_entrance1
    if place_meeting(x, y, obj_wall) or place_meeting(x, y-16, obj_level_macro)
        with obj_entrance1
            if parent = other.parent
                instance_change(obj_wall, true)
        
        
with obj_entrance2
    if place_meeting(x, y, obj_wall) or place_meeting(x-16, y, obj_level_macro)
        with obj_entrance2
            if parent = other.parent
                instance_change(obj_wall, true)
        
with obj_entrance3
    if place_meeting(x, y, obj_wall) or place_meeting(x, y, obj_level_macro)
        with obj_entrance3
            if parent = other.parent
                instance_change(obj_wall, true)
        
with obj_entrance4
    if place_meeting(x, y, obj_wall) or place_meeting(x, y, obj_level_macro)
        with obj_entrance4
            if parent = other.parent
                instance_change(obj_wall, true)


if instance_exists(obj_entrance1alt)
    with obj_entrance1alt
        if place_meeting(x, y, obj_wall) or place_meeting(x, y-16, obj_level_macro)
            with obj_entrance1alt
                if parent = other.parent
                    instance_change(obj_wall, true)

if instance_exists(obj_entrance2alt)
    with obj_entrance2alt
        if place_meeting(x, y, obj_wall) or place_meeting(x, y-16, obj_level_macro)
            with obj_entrance2alt
                if parent = other.parent
                    instance_change(obj_wall, true)
                    
if instance_exists(obj_entrance3alt)
    with obj_entrance3alt
        if place_meeting(x, y, obj_wall) or place_meeting(x, y-16, obj_level_macro)
            with obj_entrance3alt
                if parent = other.parent
                    instance_change(obj_wall, true)
                    
if instance_exists(obj_entrance4alt)
    with obj_entrance4alt
        if place_meeting(x, y, obj_wall) or place_meeting(x, y-16, obj_level_macro)
            with obj_entrance4alt
                if parent = other.parent
                    instance_change(obj_wall, true)
                    
alarm[3] = 1

#define lgClearEntrance
with obj_entrance1
    instance_destroy()
with obj_entrance2
    instance_destroy()
with obj_entrance3
    instance_destroy()
with obj_entrance4
    instance_destroy()
    

with obj_entrance1alt
    instance_destroy()
with obj_entrance2alt
    instance_destroy()
with obj_entrance3alt
    instance_destroy()
with obj_entrance4alt
    instance_destroy()