#define lgRequired
//Arenas
lgRequiredArena()
lgRequiredRooms()

#define lgRequiredArena
object = noone
globalIteration = 0

repeat(3)
{
    genCreatePairList(6, 7)
    iteration = 0
    go = true
    
    while(go)
    {
        pair = ds_list_find_value(pairList, iteration)
        ix = pair.x * 594
        iy = pair.y * 594
        
        object = instance_create(ix, iy, obj_arena_blockout)
        with object
            if place_meeting(x, y, obj_arena_blockout) or place_meeting(x+1, y+1, obj_level_macro)
                instance_destroy()
            else
                other.go = false      
                
        if go = false or (iteration >= 41)
            break;

        iteration ++
        globalIteration ++       
            
    }
    
    genDestroyList()
        
    if !instance_exists(object) or globalIteration >= 125
        break
    
}

if instance_number(obj_arena_blockout) != 3
{
    if stopStep = 0
        room_restart()
    else
        show_message("Arenas Less than 3")
}

#define lgRequiredRooms
roomList = ds_list_create()
ds_list_add(roomList, obj_store_blockout)
ds_list_add(roomList, obj_start_blockout)
ds_list_add(roomList, obj_end_blockout)

roomNumber = 0

repeat(ds_list_size(roomList))
{
    roomObject = ds_list_find_value(roomList, roomNumber)
    
    switch (roomObject)
    {
        case obj_store_blockout: maxX = 7; maxY = 8; break;
        case obj_start_blockout: maxX = 8; maxY = 8; break;
        case obj_end_blockout: maxX = 7; maxY = 8; break;
    }
     
    
    genCreatePairList(maxX, maxY)
    iteration = 0
    go = true
    while(go)
    {
        pair = ds_list_find_value(pairList, iteration)
        ix = pair.x * 594
        iy = pair.y * 594
        
        object = instance_create(ix, iy, roomObject)
        with object
            if place_meeting(x, y, obj_gen_room) or place_meeting(x+1, y+1, obj_level_macro)
                instance_destroy()
            else
                other.go = false  
                
        if go = false or (iteration >= 41)
            break;
        iteration ++
    }
    genDestroyList()
    roomNumber ++
}

ds_list_destroy(roomList)