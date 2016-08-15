mybot = instance_create(0, 0, MyPlayer)
ds_list_add(global.players, mybot)

with mybot
{
    MyBotInit()
}
mybot.team = GetMyBotTeam(mybot)
mybot.class = GetMyBotClass(mybot)

if global.mybotNamePrefix == ""
{
    mybot.name = "My Bot "+string(global.mybotNameCounter)
}
else
{
    mybot.name = global.mybotNamePrefix+string(global.mybotNameCounter)
}
global.mybotNameCounter += 1
mybot.alarm[5] = 1

ServerPlayerJoin(mybot, global.sendBuffer)
ServerPlayerChangeteam(ds_list_size(global.players)-1, mybot.team, global.sendBuffer)
ServerPlayerChangeclass(ds_list_size(global.players)-1, mybot.class, global.sendBuffer)

