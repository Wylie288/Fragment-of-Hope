///melee_choose_player
if global.mp = 1
{
    if instance_exists(obj_player1) and instance_exists(obj_player2)
        playerID = choose(obj_player1, obj_player2)
    else
    {
        if instance_exists(obj_player1)
            playerID = obj_player1
        if instance_exists(obj_player2)
            playerID = obj_player2
    }
}
else
    playerID = obj_player1
