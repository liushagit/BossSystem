// JScript 文件

function ShowMenu(parentid,divid)
{
    document.getElementById(parentid).className= document.getElementById(parentid).className=="menu_1"?"menu_0":"menu_1";
    document.getElementById(divid).style.display= document.getElementById(divid).style.display=="none"?"block":"none";
}

