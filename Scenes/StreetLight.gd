extends Node2D


onready var tween = $Tween
onready var light = $Light
onready var ray = $Ray

var delay = 1
var glow_color = Color(1.3,1.2,1.1,1)
var duration = .8

func _ready():
	randomize()
	flicker_light()

func _on_Tween_tween_all_completed():
	flicker_light()


func flicker_light():
	light.set_modulate(glow_color)
	ray.set_modulate(Color(1,1,1,1))
	
	duration = rand_range(0.5, 1)
	delay = rand_range(1.0, 5.0)
	
	tween.interpolate_property(light, 'modulate', glow_color, Color(1.1,1.1,1,1),
	duration, Tween.TRANS_BOUNCE, Tween.EASE_IN, delay)
	
	tween.interpolate_property(ray, 'modulate', Color(1,1,1,1), Color(1,1,1,.5),
	duration, Tween.TRANS_BOUNCE, Tween.EASE_IN, delay)
	
	tween.start()
