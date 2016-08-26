var i;
if(global.move==0)
{
    i=0
    global.move= file_text_open_read(working_directory+"\movement.txt");
}
var tmp;
tmp=file_text_read_string(global.move);
if(tmp =="L")
{
    left=1
    right=0
}

if(tmp =="R")
{
    right=1
    left=0
}
if(tmp =="J")
{
    jump=1
}
file_text_readln(global.move);
if(file_text_eof(global.move))
{
    file_text_close(global.move);
    global.move=0;
}
