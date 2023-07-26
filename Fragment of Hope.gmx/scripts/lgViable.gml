var badAmount = 100//6

testGrid = mp_grid_create(0, 0, 4806/54, 4806/54, 54, 54)
mp_grid_add_instances(testGrid, obj_gen_wall, true)
mp_grid_add_instances(testGrid, obj_gen_room, true)
mp_grid_add_instances(testGrid, obj_level_macro, true)
mp_grid_add_instances(testGrid, obj_wall, true)
mp_grid_add_instances(testGrid, obj_wall_corner, true)


path = path_add()
navPointList = ds_list_create()

with obj_gen_navpoint
    ds_list_add(other.navPointList, id)

bad = 0
i = 0

repeat(ds_list_size(navPointList))
{
    navPoint = ds_list_find_value(navPointList, i)
    ix = navPoint.x
    iy = navPoint.y

    j = 0
    if !mp_grid_path(testGrid, path, obj_start_blockout.x + 162, obj_start_blockout.y + 162, ix, iy, 0)
        bad += 1
    else
        show_debug_message("GOOD")
    
    i++
    
    
    if bad > badAmount
    {
        if stopStep = 0
        {
            room_restart()
            break  
        }
        else
            show_debug_message("Many Segmented Rooms")
    }
}

//show_debug_message(string(bad))

if bad <= badAmount
    return true
return false
