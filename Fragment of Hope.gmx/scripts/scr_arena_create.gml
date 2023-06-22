#define scr_arena_create
///scr_arena_create(x, y, arena)
x = argument0
y = argument1
arena = argument2

if file_exists("levelData/"+arena)
    global.textFile = file_text_open_read("levelData/"+arena)
else
{
    return false
    show_debug_message("Level not Found")
}
    
while(!file_text_eof(global.textFile))
{
    line = file_text_read_string(global.textFile)
    file_text_readln(global.textFile)
    
    switch (line)
    {
        case "lootPoint": acXY(obj_lootPoint, x, y); break;
        case "wall": acXY(obj_wall, x, y); break;
        case "lock": acXY(obj_door_lock, x, y); break;
        case "capHor": acXY(obj_room_cap_hor, x, y); break;
        case "capVert": acXY(obj_room_cap_vert, x, y); break;
        case "door": acXY(obj_door, x, y); break;
        case "finish": acXY(obj_finish, x, y); break;
        case "consume": acXY(obj_consume, x, y); break;
        case "weaponItem": acXY(obj_weaponItem, x, y); break;
        case "otherItem": acXY(obj_otherItem, x, y); break;
        case "pit": acXY(obj_pit4, x, y); break;
        case "barrel": acXY(obj_barrel, x, y); break;
        case "box": acXY(obj_box, x, y); break;
        case "boxStay": acXY(obj_box_stay, x, y); break;
        case "jumpPad": acXY(obj_jumpPad, x, y); break;
        case "statueArea": acXY(obj_statue_area, x, y); break;
        case "statue": acXY(obj_statue, x, y); break;
        case "sandstorm1": acXY(obj_sandstorm1, x, y); break;
        case "sandstorm2": acXY(obj_sandstorm2, x, y); break;
        case "sandstorm3": acXY(obj_sandstorm3, x, y); break;
        case "sandstorm4": acXY(obj_sandstorm4, x, y); break;
        case "sandstormControl": acXY(obj_sandstorm_controller, x, y); break;
        case "windControl": acXY(obj_wind_controller, x, y); break;
        case "thornsControl": acXY(obj_thorns_controller, x, y); break;
        case "thorns21": acXY(obj_thorns21, x, y); break;
        case "thorns31": acXY(obj_thorns31, x, y); break;
        case "thorns12": acXY(obj_thorns12, x, y); break;
        case "thorns13": acXY(obj_thorns13, x, y); break;
        case "hedgeControl": acXY(obj_hedge_controller, x, y); break;
        case "hedgeA": acXY(obj_hedgeA, x, y); break;
        case "hedgeB": acXY(obj_hedgeB, x, y); break;
        case "explosiveBarrel": acXY(obj_explosive_barrel, x, y); break;
        case "minorWeapon": acXY(obj_minorWeapon, x, y); break;
        case "minorWeapon2": acXY(obj_minorWeapon2, x, y); break;
        case "healthOrb": acXY(obj_health_orb_pickup, x, y); break;
        case "shieldMarker": acXY(obj_shield_marker, x, y); break;
        case "entrance1": acXY(obj_entrance1, x, y); break;
        case "entrance2": acXY(obj_entrance2, x, y); break;
        case "entrance3": acXY(obj_entrance3, x, y); break;
        case "entrance4": acXY(obj_entrance4, x, y); break;
        case "entrance1alt": acXY(obj_entrance1alt, x, y); break;
        case "entrance2alt": acXY(obj_entrance2alt, x, y); break;
        case "entrance3alt": acXY(obj_entrance3alt, x, y); break;
        case "entrance4alt": acXY(obj_entrance4alt, x, y); break;
        case "ammoGlobal": acXY(obj_sp_global_ammo, x, y); break;
        case "miscRandom": acXY(obj_misc_pad_random, x, y); break;

        
        case "portal": acPortal(x, y); break;
        case "portalHor": acPortalHor(x, y); break;
        case "badSpawner": acPoint(obj_baddie_spawner, x, y, listBadSpawner); break;
        case "badPoint": acPoint(obj_baddiepoint, x, y, listBadPoint); break;
        case "crate": acCrate(obj_crate, x, y); break;
        case "anyItem": acItem(obj_anyItem, x, y); break;
        case "type": acType(obj_room_type); break;
        case "ammo": acCrate(obj_sp_ammo, x, y); break;
        case "plate1": acStartPlate(obj_start_plate1, x, y, arena); break;
    }
     
}

file_text_close(global.textFile)

#define acXY
object = argument0
iX = argument1
iY = argument2

jX = file_text_read_real(global.textFile)
file_text_readln(global.textFile)

jY = file_text_read_real(global.textFile)
file_text_readln(global.textFile)

with instance_create(iX + jX, iY + jY, object)
    parent = other.id

#define acPortal

iX = argument0
iY = argument1

jX = file_text_read_real(global.textFile)
file_text_readln(global.textFile)

jY = file_text_read_real(global.textFile)
file_text_readln(global.textFile)

xDest = file_text_read_real(global.textFile)
file_text_readln(global.textFile)

yDest = file_text_read_real(global.textFile)
file_text_readln(global.textFile)

with instance_create(iX + jX, iY + jY, obj_portal)
{
    xDest = other.xDest
    yDest = other.yDest
    parent = other.id
}

#define acPoint
object = argument0
iX = argument1
iY = argument2
list = argument3

jX = file_text_read_real(global.textFile)
file_text_readln(global.textFile)

jY = file_text_read_real(global.textFile)
file_text_readln(global.textFile)

with instance_create(iX + jX, iY + jY, object)
{
    parent = other.id
    ds_list_add(other.list, self)
}
#define acCrate
object = argument0
iX = argument1
iY = argument2

jX = file_text_read_real(global.textFile)
file_text_readln(global.textFile)

jY = file_text_read_real(global.textFile)
file_text_readln(global.textFile)

type = file_text_read_string(global.textFile)
file_text_readln(global.textFile)

with instance_create(iX + jX, iY + jY, object)
{
    type = other.type
}

#define acItem
object = argument0
iX = argument1
iY = argument2

jX = file_text_read_real(global.textFile)
file_text_readln(global.textFile)

jY = file_text_read_real(global.textFile)
file_text_readln(global.textFile)

discount = file_text_read_real(global.textFile)
file_text_readln(global.textFile)

with instance_create(iX + jX, iY + jY, object)
{
    discount = other.discount
}
#define acType
object = argument0

type = file_text_read_string(global.textFile)
file_text_readln(global.textFile)

with instance_create(x + 960, y + 540, object)
   type = other.type
#define wcXY
///wcXY(object, string)
with argument0
{
    file_text_write_string(global.textFile, argument1)
    file_text_writeln(global.textFile)
    file_text_write_real(global.textFile, x)
    file_text_writeln(global.textFile)
    file_text_write_real(global.textFile, y)
    file_text_writeln(global.textFile)
}
#define acEntrance
object = argument0
iX = argument1
iY = argument2

jX = file_text_read_real(global.textFile)
file_text_readln(global.textFile)

jY = file_text_read_real(global.textFile)
file_text_readln(global.textFile)

with instance_create(iX + jX, iY + jY, object)
    parent = other.id
#define acPortalHor

iX = argument0
iY = argument1

jX = file_text_read_real(global.textFile)
file_text_readln(global.textFile)

jY = file_text_read_real(global.textFile)
file_text_readln(global.textFile)

xDest = file_text_read_real(global.textFile)
file_text_readln(global.textFile)

yDest = file_text_read_real(global.textFile)
file_text_readln(global.textFile)

with instance_create(iX + jX, iY + jY, obj_portal_hor)
{
    xDest = other.xDest
    yDest = other.yDest
    parent = other.id
}
#define acStartPlate
object = argument0
iX = argument1
iY = argument2
arenaFile = argument3

jX = file_text_read_real(global.textFile)
file_text_readln(global.textFile)

jY = file_text_read_real(global.textFile)
file_text_readln(global.textFile)

with instance_create(iX + jX, iY + jY, object)
{
    parent = other.id
    arena = other.arenaFile
}
