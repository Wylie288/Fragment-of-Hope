///scr_raycast(startX, startY, angle, distance, target)

//Establish argument variables
var startX = argument0;
var startY = argument1;
var dir = argument2;
var maxD = argument3;
var target = argument4;

//Establish direction and max distance to raycast
var len = 0;
//var dir = point_direction(startX, startY, endX, endY);
//var maxD = point_distance(startX, startY, endX, endY);

//Begin raycast loop
while(len < maxD) {
    var castX = startX + lengthdir_x(len, dir);
    var castY = startY + lengthdir_y(len, dir);
    rayCast = collision_point(castX, castY, target, true, false)
    if(rayCast) and len > 4{
        hitpoint[0] = startX + lengthdir_x(len-5, dir);
        hitpoint[1] = startY + lengthdir_y(len-5, dir);
        hitpoint[2] = castX;
        hitpoint[3] = castY;
        hitpoint[4] = rayCast;
        return hitpoint;
    }

    len += 1;
}

//If the raycast hit nothing, return false
hitpoint[0] = false
return hitpoint
