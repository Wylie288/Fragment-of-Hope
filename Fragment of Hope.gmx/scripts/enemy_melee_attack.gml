///enemy_melee_attack(dist)
dir = point_direction(x, y, playerID.x, playerID.y)
ix = lengthdir_x(argument0, dir)
iy = lengthdir_y(argument0, dir)

with instance_create(x + ix, y + iy, obj_enemy_melee)
{
    playerID = other.playerID
    image_angle = point_direction(x, y, playerID.x, playerID.y)
    damage = other.damage
}
