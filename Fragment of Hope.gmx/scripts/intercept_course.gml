/// intercept_course_precise(origin,target,bulletspeed);
//
//  Returns the course direction required to hit a moving target
//  at a given projectile speed, or (-1) if no solution is found.
//  It works even if target is moving away or towards projectile.
//
//      origin      instance with position (x,y), real
//      target       instance with position (x,y) and (speed), real
//      bulletspeed       the speed of the projectile, real
//
/// GMLscripts.com/license
origin = argument0
target = argument1
bulletspeed = argument2

var di;var dist;var alpha;var a;var b;var c;var delta;var time;var final;
    di = point_direction(origin.x,origin.y,target.x,target.y);
    dist = point_distance(origin.x,origin.y,target.x,target.y);
    alpha = target.direction - di;

//using bhaskara to solve cosine law
    a = sqr(target.speed) - sqr(bulletspeed);
    b = -2*dist*target.speed*dcos(alpha);
    c = sqr(dist);


    //cauculating delta
    delta = sqr(b) - (4*a*c);

    //checks if delta is negative if it is not uses bhaskara formula
    if sign(delta) == -1{return -1;}
    time = (-b-sqrt(delta))/(2*a);

    //them cauculate sides and apply sine law
    
    safety = clamp(dsin(alpha)*(target.speed*time)/(bulletspeed*time),-1,1);
    //if safety == NaN{return -1;}
    final = di + darcsin(safety);
    return final;

