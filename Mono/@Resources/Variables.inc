[Variables]
; Written by the Settings skin.
; 0 = black, 255 = white
Shade=0
; 0 = horizontal, 1 = vertical
Lines=1
; 0 = off, 1 = bars, 2 = bars + title
Music=1
; 1 = locked in place, 0 = free to drag (each skin separate). Unlocked by default so you can place them first.
ClockLock=0
MusicLock=0
; clock size: 0.5 .. 2.0 (set by the Settings size slider, 10% steps)
Scale=1.0

; Desktop skins (Clock, Music): plain black / white ink and its inverse.
Fg=#Shade#,#Shade#,#Shade#
Paper=(255-#Shade#),(255-#Shade#),(255-#Shade#)

; Settings panel only: soft charcoal / off-white tones, never pure #000/#FFF.
IR=(#Shade#=0 ? 24 : 245)
IG=(#Shade#=0 ? 24 : 245)
IB=(#Shade#=0 ? 27 : 245)
PR=(#Shade#=0 ? 246 : 24)
PG=(#Shade#=0 ? 246 : 25)
PB=(#Shade#=0 ? 244 : 29)
SInk=#IR#,#IG#,#IB#
SCard=#PR#,#PG#,#PB#
