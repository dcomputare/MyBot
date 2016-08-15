var classList, foundClass;

classList = ds_list_create()

if global.botClasses[CLASS_SCOUT]
{
    ds_list_add(classList, CLASS_SCOUT)
}
if global.botClasses[CLASS_PYRO]
{
    ds_list_add(classList, CLASS_PYRO)
}
if global.botClasses[CLASS_SOLDIER]
{
    ds_list_add(classList, CLASS_SOLDIER)
}
if global.botClasses[CLASS_HEAVY]
{
    ds_list_add(classList, CLASS_HEAVY)
}
if global.botClasses[CLASS_ENGINEER]
{
    ds_list_add(classList, CLASS_ENGINEER)
}
if global.botClasses[CLASS_SNIPER]
{
    ds_list_add(classList, CLASS_SNIPER)
}
if global.botClasses[CLASS_MEDIC]
{
    ds_list_add(classList, CLASS_MEDIC)
}

if ds_list_empty(classList)
{
    argument0.class = choose(CLASS_SCOUT, CLASS_PYRO, CLASS_SOLDIER, CLASS_HEAVY, CLASS_ENGINEER, CLASS_SNIPER, CLASS_MEDIC)
    if global.botNameCounter == 1 show_message("No Class Free#Choosing randomly")
    return 1
}

argument0.class = ds_list_find_value(classList, random_range(0, ds_list_size(classList)))

return argument0.class
