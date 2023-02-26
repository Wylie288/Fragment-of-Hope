///getInput(input, &press)
var iinput = argument[0]
var key = iinput[0]
var type = iinput[1]
var action = "held"
if argument_count > 1
    action = argument[1]

if type = "controller"
    return 0
    
if type = "mouse"
    return 0
    
if type = "keyboard"
{
    switch (action)
    {
        case "held": if keyboard_check(key) return 1 break;
        case "press": if keyboard_check_pressed(key) return 1 break;
        case "release": if keyboard_check_released(key) return 1 break;
    }
}
return 0
