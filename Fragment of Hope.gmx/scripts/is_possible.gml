mp_grid_clear_all(other.testGrid)
mp_grid_add_instances(other.testGrid, obj_gen_wall, true)
mp_grid_add_instances(other.testGrid, obj_gen_room, true)
mp_grid_add_instances(other.testGrid, obj_level_macro, true)
mp_grid_add_instances(other.testGrid, obj_wall, true)
mp_grid_add_instances(other.testGrid, obj_wall_corner, true)

i = 0
repeat(ds_list_size(other.navPointList))
{
    navPoint = ds_list_find_value(other.navPointList, i)
    ix = navPoint.x
    iy = navPoint.y

    if !mp_grid_path(other.testGrid, other.path, obj_start_blockout.x + 162, obj_start_blockout.y + 162, ix, iy, 0)
        return false
        
    i++
}

return true

