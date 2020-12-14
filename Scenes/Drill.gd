extends AnimatedSprite


onready var lightTween = $LightTween
onready var light = $Light

var on = false
var on_color = Color(1.85,1,1,1)
var off_color = Color(1.2,1,1,1)



func start_drill():
	on = true
	
	lightTween.interpolate_property(light, 'modulate', light.modulate, on_color, 1,
	Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	lightTween.start()
	
	self.play()

func stop_drill():
	on = false
	
	lightTween.interpolate_property(light, 'modulate', light.modulate, off_color, 0.5,
	Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	lightTween.start()
	
	self.stop()


func _on_LightTween_tween_all_completed():
	if on:
		if light.modulate == on_color:
			lightTween.interpolate_property(light, 'modulate', light.modulate, off_color, 1,
			Tween.TRANS_SINE, Tween.EASE_IN_OUT, .2)
		else:
			lightTween.interpolate_property(light, 'modulate', light.modulate, on_color, 1,
			Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		lightTween.start()


func _on_ExampleButton_toggled(button_pressed):
	if button_pressed:
		start_drill()
	else:
		stop_drill()
