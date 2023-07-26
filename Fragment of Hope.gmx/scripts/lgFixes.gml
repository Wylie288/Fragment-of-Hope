#define lgFixes
lgFixesNav()
lgFixesMiscType()
lgFixesBorder()
lgFixesFloorType()
lgFixesRoomType()
lgFixesLoot()

#define lgFixesNav
i = 0
    
repeat(ds_list_size(navPointList))
{
    navPoint = ds_list_find_value(navPointList, i)
    ix = navPoint.x
    iy = navPoint.y

    j = 0
    k = 0
    while !mp_grid_path(testGrid, path, 162, 162, ix, iy, 0)
    {
        with instance_nth_nearest(ix, iy, obj_gen_wall, j)
        {
            if image_index = 0
            {
                image_index = 1
                mp_grid_clear_rectangle(other.testGrid, x+1, y+1, x + sprite_width - 1, y + sprite_height - 1)
                other.k++
            }
        }
        j++
        
        if k = 5 
            show_debug_message("fail")
        
        if k = 9
            show_debug_message("fail2")
            
        if k = 32
            show_debug_message("fail3") 
        
        if j = 32
        {
            break
            room_restart()
        }

    }
    
    show_debug_message("reached" + string(i))
    
    i++
}

#define lgFixesMiscType
layout = ds_list_create()
ds_list_add(layout, 2)
ds_list_add(layout, 3)
with obj_misc_room
{
    ds_list_shuffle(other.layout)
    i = 0
    possible = 0
    repeat(2)
    {
        image_index = ds_list_find_value(other.layout, i)
        if is_possible()
        {
            possible = 1
            break;
        }
    }
    
    if possible = 0
        image_index = 1
}

ds_list_destroy(layout)

#define lgFixesBorder
with(obj_hor_wall)
    if place_meeting(x, y-54, obj_level_macro)
        image_index = 0
    
with(obj_vert_wall)
    if place_meeting(x-54, y, obj_level_macro)
        image_index = 0

#define lgFixesFloorType
global.titleTimer = sec * 4.5
global.generation = 1

if global.level = 1
{
    global.levelVariant = irandom(1)
    if global.levelVariant = 0
        global.levelName = "Windswept Dunes"
    if global.levelVariant = 1
        global.levelName = "Sandstorm Cliffs"
}

if global.level = 2
{
    global.levelVariant = choose(0, 1)
    if global.levelVariant = 0
        global.levelName = "Thistle Gardens"
    if global.levelVariant = 1
        global.levelName = "Leafy Labrynth"
}

if global.level = 3
{
    global.levelVariant = 0
    global.levelName = "Level 3"
}
if global.level = 4
{
    global.levelVariant = 0
    global.levelName = "Level 4"
}

#define lgFixesRoomType
temp = ds_list_create()
floor11List = ds_list_create()
if global.level = 1
{
    if global.levelVariant = 0
    {
        ds_list_add(temp, "arena1_1")
        ds_list_add(temp, "arena1_2")
        ds_list_add(temp, "arena1_3")
        ds_list_shuffle(temp)
        ds_list_add(floor11List, temp[| 0])
        ds_list_add(floor11List, temp[| 1])
        ds_list_clear(temp)
        ds_list_add(temp, "arena1_4g")
        ds_list_add(temp, "arena1_5g")
        ds_list_add(temp, "arena1_6g")
        ds_list_shuffle(temp)
        ds_list_add(floor11List, temp[| 0])
    }
    if global.levelVariant = 1
    {
        ds_list_add(temp, "arena1_4")
        ds_list_add(temp, "arena1_5")
        ds_list_add(temp, "arena1_6")
        ds_list_shuffle(temp)
        ds_list_add(floor11List, temp[| 0])
        ds_list_add(floor11List, temp[| 1])
        ds_list_clear(temp)
        ds_list_add(temp, "arena1_1g")
        ds_list_add(temp, "arena1_2g")
        ds_list_add(temp, "arena1_3g")
        ds_list_shuffle(temp)
        ds_list_add(floor11List, temp[| 0])
    }
}
if global.level = 2
{
    if global.levelVariant = 0
    {
        ds_list_add(temp, "arena2_1")
        ds_list_add(temp, "arena2_2")
        ds_list_add(temp, "arena2_3")
        ds_list_shuffle(temp)
        ds_list_add(floor11List, temp[| 0])
        ds_list_add(floor11List, temp[| 1])
        ds_list_clear(temp)
        ds_list_add(temp, "arena2_4g")
        ds_list_add(temp, "arena2_5g")
        ds_list_add(temp, "arena2_6g")
        ds_list_shuffle(temp)
        ds_list_add(floor11List, temp[| 0])
    }
    if global.levelVariant = 1
    {
        ds_list_add(temp, "arena2_4")
        ds_list_add(temp, "arena2_5")
        ds_list_add(temp, "arena2_6")
        ds_list_shuffle(temp)
        ds_list_add(floor11List, temp[| 0])
        ds_list_add(floor11List, temp[| 1])
        ds_list_clear(temp)
        ds_list_add(temp, "arena2_1g")
        ds_list_add(temp, "arena2_2g")
        ds_list_add(temp, "arena2_3g")
        ds_list_shuffle(temp)
        ds_list_add(floor11List, temp[| 0])
    }
}
if global.level = 3
{
        ds_list_add(temp, "arena3_1")
        ds_list_add(temp, "arena3_2")
        ds_list_add(temp, "arena3_3")
        ds_list_shuffle(temp)
        ds_list_add(floor11List, temp[| 0])
        ds_list_add(floor11List, temp[| 1])
        ds_list_add(floor11List, temp[| 2])
}
if global.level = 4
{
        ds_list_add(temp, "arena1_1g")
        ds_list_add(temp, "arena1_2g")
        ds_list_add(temp, "arena1_3g")
        ds_list_add(temp, "arena1_4g")
        ds_list_add(temp, "arena1_5g")
        ds_list_add(temp, "arena1_6g")
        ds_list_add(temp, "arena2_1g")
        ds_list_add(temp, "arena2_2g")
        ds_list_add(temp, "arena2_3g")
        ds_list_add(temp, "arena2_4g")
        ds_list_add(temp, "arena2_5g")
        ds_list_add(temp, "arena2_6g")
        ds_list_add(temp, "arena3_1")
        ds_list_add(temp, "arena3_2")
        ds_list_add(temp, "arena3_3")
        ds_list_shuffle(temp)
        ds_list_add(floor11List, temp[| 0])
        ds_list_add(floor11List, temp[| 1])
        ds_list_add(floor11List, temp[| 2])
}

ds_list_shuffle(floor11List)
ds_list_destroy(temp)

singleHybridList = ds_list_create()
ds_list_add(singleHybridList, "misc_single_hybrid1")
ds_list_add(singleHybridList, "misc_single_hybrid2")
ds_list_add(singleHybridList, "misc_single_hybrid3")
ds_list_add(singleHybridList, "misc_single_hybrid4")
ds_list_add(singleHybridList, "misc_single_hybrid5")
ds_list_add(singleHybridList, "misc_single_hybrid6")
ds_list_add(singleHybridList, "misc_single_hybrid7")
ds_list_add(singleHybridList, "misc_single_hybrid8")
ds_list_add(singleHybridList, "misc_single_hybrid9")
ds_list_add(singleHybridList, "misc_single_hybrid10")
ds_list_add(singleHybridList, "misc_single_hybrid11")
ds_list_add(singleHybridList, "misc_single_hybrid12")
ds_list_add(singleHybridList, "misc_single_hybrid13")
ds_list_add(singleHybridList, "misc_single_hybrid14")
ds_list_add(singleHybridList, "misc_single_hybrid15")
ds_list_add(singleHybridList, "misc_single_hybrid16")
ds_list_add(singleHybridList, "misc_single_hybrid17")
ds_list_add(singleHybridList, "misc_single_hybrid18")
ds_list_add(singleHybridList, "misc_single_hybrid19")

singleClosedList = ds_list_create()
ds_list_add(singleHybridList, "misc_single_hybrid3")
ds_list_add(singleClosedList, "misc_single_closed1")
ds_list_add(singleClosedList, "misc_single_closed2")
ds_list_add(singleClosedList, "misc_single_closed3")
ds_list_add(singleClosedList, "misc_single_closed4")
ds_list_add(singleClosedList, "misc_single_closed5")
ds_list_add(singleClosedList, "misc_single_closed6")
ds_list_add(singleClosedList, "misc_single_closed7")
ds_list_add(singleClosedList, "misc_single_closed8")
ds_list_add(singleClosedList, "misc_single_closed9")
ds_list_add(singleClosedList, "misc_single_closed10")



#define lgFixesLoot
ds_list_shuffle(global.weaponLoot)
ds_list_shuffle(global.normalLoot)

global.normalLootI = 0
global.weaponLootI = 0