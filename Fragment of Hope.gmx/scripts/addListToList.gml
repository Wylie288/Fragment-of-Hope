///addListToList(Base List, Added List)

baseList = argument0
addedList = argument1

i = 0
repeat(ds_list_size(argument1))
{
    item = ds_list_find_value(argument1, i)
    ds_list_add(argument0, item)
    i++
}
