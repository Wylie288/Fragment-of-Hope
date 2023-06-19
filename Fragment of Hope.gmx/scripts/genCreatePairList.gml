#define genCreatePairList
pairList = ds_list_create()

ix = 0
repeat(argument0)
{
    iy = 0  
    repeat(argument1)
    {
        pair = instance_create(ix, iy, obj_pair)
        ds_list_add(pairList, pair)
        iy++
    }
    ix ++
}

ds_list_shuffle(pairList)

#define genDestroyList
i = 0
repeat(ds_list_size(pairList))
{
    pair = ds_list_find_value(pairList, i)
    with pair
        instance_destroy()
    i++
}

ds_list_destroy(pairList)