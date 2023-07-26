#define lgRoom
lgRoomMisc()
lgRoomBonus()
lgRoomSingle()

#define lgRoomMisc
roomList = ds_list_create()
ds_list_add(roomList, obj_misc_blockout1)
ds_list_add(roomList, obj_misc_blockout1)
ds_list_add(roomList, obj_misc_blockout2)
ds_list_add(roomList, obj_misc_blockout2)
ds_list_add(roomList, obj_misc_blockout3)
ds_list_add(roomList, obj_misc_blockout3)
ds_list_shuffle(roomList)

rooms = irandom_range(2,4)
roomNumber = 0

repeat(rooms)
{
    roomObject = ds_list_find_value(roomList, roomNumber)
    
    switch (roomObject)
    {
        case obj_misc_blockout1: maxX = 7; maxY = 8;break;
        case obj_misc_blockout2: maxX = 8; maxY = 7;break;
        case obj_misc_blockout3: maxX = 7; maxY = 7;break;
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

#define lgRoomBonus
roomList = ds_list_create()
ds_list_add(roomList, obj_consume_blockout)
ds_list_add(roomList, obj_consume_blockout)
ds_list_add(roomList, obj_alter_blockout)

roomNumber = 0

repeat(ds_list_size(roomList))
{
    roomObject = ds_list_find_value(roomList, roomNumber)
    
    maxX = 8; 
    maxY = 8;
     
    
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

#define lgRoomSingle
if instance_exists(obj_wall_corner)
{
    with obj_wall_corner
    {
        largeRoom = 0
        if !place_meeting(x+54, y, obj_hor_wall)
            largeRoom ++
        if !place_meeting(x-54, y, obj_hor_wall)
            largeRoom ++
        if !place_meeting(x, y+54, obj_vert_wall)
            largeRoom ++
        if !place_meeting(x, y-54, obj_vert_wall)
            largeRoom ++
            
        if largeRoom = 4 and !place_meeting(x+2, y+2, obj_level_macro)
            instance_destroy()
    }
}

with obj_gen_wall
    if place_meeting(x, y, obj_gen_room)
        instance_destroy()
        
with obj_wall_corner
    if place_meeting(x, y, obj_gen_room)
        instance_destroy()
        
with obj_empty_blockout
{
    if place_meeting(x, y, obj_level_macro) or place_meeting(x, y, obj_gen_room)
        instance_destroy()
}
        
with obj_gen_room
    image_index = 1
    
with obj_gen_wall
    if place_meeting(x, y, obj_gen_room)
        instance_destroy()