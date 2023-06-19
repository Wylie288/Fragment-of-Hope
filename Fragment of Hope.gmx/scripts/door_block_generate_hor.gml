#define door_block_generate_hor
object = argument0 

dy = 0
repeat(2)
{
    dx = -162
    repeat(11)
    {
        instance_create(x + dx, y + dy, object)
        dx += 54 
    }
    dy += 54
}

#define door_block_generate_vert
object = argument0 

dy = -162
repeat(8)
{
    dx = 0
    repeat(2)
    {
        instance_create(x + dx, y + dy, object)
        dx += 54 
    }
    dy += 54
}