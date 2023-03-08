#!/bin/bash
workspaces() {

ws1="ID 1 "
ws2="ID 2 "
ws3="ID 3 "
ws4="ID 4 "
ws5="ID 5 "
ws6="ID 6 "
ws7="ID 7 "
ws8="ID 8 "
ws9="ID 9 "
ws0="ID 10"

# check if Occupied
o1=$(hyprctl workspaces | grep "$ws1" )
o2=$(hyprctl workspaces | grep "$ws2" )
o3=$(hyprctl workspaces | grep "$ws3" )
o4=$(hyprctl workspaces | grep "$ws4" )
o5=$(hyprctl workspaces | grep "$ws5" )
o6=$(hyprctl workspaces | grep "$ws6" )
o7=$(hyprctl workspaces | grep "$ws7" )
o8=$(hyprctl workspaces | grep "$ws8" )
o9=$(hyprctl workspaces | grep "$ws9" )
o0=$(hyprctl workspaces | grep "$ws0" )

# check if Focused
f1=$(hyprctl monitors | grep "workspace: 1 " -A 4 | grep "focused: yes" )
f2=$(hyprctl monitors | grep "workspace: 2 " -A 4 | grep "focused: yes" )
f3=$(hyprctl monitors | grep "workspace: 3 " -A 4 | grep "focused: yes" )
f4=$(hyprctl monitors | grep "workspace: 4 " -A 4 | grep "focused: yes" )
f5=$(hyprctl monitors | grep "workspace: 5 " -A 4 | grep "focused: yes" )
f6=$(hyprctl monitors | grep "workspace: 6 " -A 4 | grep "focused: yes" )
f7=$(hyprctl monitors | grep "workspace: 7 " -A 4 | grep "focused: yes" )
f8=$(hyprctl monitors | grep "workspace: 8 " -A 4 | grep "focused: yes" )
f9=$(hyprctl monitors | grep "workspace: 9 " -A 4 | grep "focused: yes" )
f0=$(hyprctl monitors | grep "workspace: 10" -A 4 | grep "focused: yes" )

if [ "$o1" != "" ]; then
    ic_1="①"
  else
    ic_1=""
fi
if [ "$o2" != "" ]; then
    ic_2="②"
  else
    ic_2=""
fi
if [ "$o3" != "" ]; then
    ic_3="③"
  else
    ic_3=""
fi
if [ "$o4" != "" ]; then
    ic_4="④"
  else
    ic_4=""
fi
if [ "$o5" != "" ]; then
    ic_5="⑤"
  else
    ic_5=""
fi
if [ "$o6" != "" ]; then
    ic_6="⑥"
  else
    ic_6=""
fi
if [ "$o7" != "" ]; then
    ic_7="⑦"
  else
    ic_7=""
fi
if [ "$o8" != "" ]; then
    ic_8="⑧"
  else
    ic_8=""
fi
if [ "$o9" != "" ]; then
    ic_9="⑨"
  else
    ic_9=""
fi
if [ "$o0" != "" ]; then
    ic_0="⑩"
  else
    ic_0=""
fi

if [ "$f1" != "" ]; then
    ic_1="➊"
elif [ "$f2" != "" ]; then
    ic_2="➋"
elif [ "$f3" != "" ]; then
    ic_3="➌"
elif [ "$f4" != "" ]; then
    ic_4="➍"
elif [ "$f5" != "" ]; then
    ic_5="➎"
elif [ "$f6" != "" ]; then
    ic_6="➏"
elif [ "$f7" != "" ]; then
    ic_7="➐"
elif [ "$f8" != "" ]; then
    ic_8="➑"
elif [ "$f9" != "" ]; then
    ic_9="➒"
elif [ "$f0" != "" ]; then
    ic_0="➓"
fi


#ic_1=$(hyprctl workspaces)
#ic_2="t"
echo 	"(box	:class \"works\"	:orientation \"h\" :spacing 5 :space-evenly \"false\" (button :onclick \"hyprctl dispatch workspace 1\"	:class	\"$un$o1$f1\"	\"$ic_1\") (button :onclick \"hyprctl dispatch workspace 2\"	:class \"$un$o2$f2\"	 \"$ic_2\") (button :onclick \"hyprctl dispatch workspace 3\"	:class \"$un$o3$f3\" \"$ic_3\") (button :onclick \"hyprctl dispatch workspace 4\"	:class \"$un$o4$f4\"	\"$ic_4\") (button :onclick \"hyprctl dispatch workspace 5\"	:class \"$un$o5$f5\" \"$ic_5\")  (button :onclick \"hyprctl dispatch workspace 6\"	:class \"$un$o6$f6\" \"$ic_6\")  (button :onclick \"hyprctl dispatch workspace 7\"	:class \"$un$o7$f7\" \"$ic_7\")  (button :onclick \"hyprctl dispatch workspace 8\"	:class \"$un$o8$f8\" \"$ic_8\")  (button :onclick \"hyprctl dispatch workspace 9\"	:class \"$un$o9$f9\" \"$ic_9\")  (button :onclick \"hyprctl dispatch workspace 10\"	:class \"$un$o0$f0\" \"$ic_0\"))"
}
workspaces
tail -f /tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/hyprland.log | grep -E --line-buffered "Changed to workspace|focus to surface" | while read -r; do 
workspaces
done
