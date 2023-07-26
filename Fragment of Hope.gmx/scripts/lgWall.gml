with(obj_wall_corner)
    {
        instance_create(x + 54 +(540/2), y + 54 + (540/2), obj_gen_navpoint)
        instance_create(x+54, y+54, obj_empty_blockout)  
        instance_create(x + 54, y, obj_hor_wall)
        instance_create(x, y + 54, obj_vert_wall)
    }
    
with obj_gen_navpoint
    if place_meeting(x, y, obj_level_macro)
        instance_destroy()
grid = 0
global.generation = 1


with(obj_hor_wall)
{
    if place_meeting(x, y-54, obj_level_macro)
        image_index = 0
    else
        image_index = irandom(3)
}
    
with(obj_vert_wall)
{
    if place_meeting(x-54, y, obj_level_macro)
        image_index = 0
    else
        image_index = irandom(3)
}
