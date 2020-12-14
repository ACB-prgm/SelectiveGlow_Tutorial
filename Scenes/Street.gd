extends Node2D


onready var moon = $Moon
onready var tween = $Tween

var bright_moon = Color(1.25,1.25,1.25,1)
var dim_moon = Color(1.15,1.15,1.15,1)
var color = Color(1,1,1,1)


func _ready():
	twinkle_moon()

func _on_Tween_tween_all_completed():
	twinkle_moon()

func twinkle_moon():
	if moon.modulate == bright_moon:
		color = dim_moon
	else:
		color = bright_moon
	
	tween.interpolate_property(moon, 'modulate', moon.modulate, color, 2,
	Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.start()
