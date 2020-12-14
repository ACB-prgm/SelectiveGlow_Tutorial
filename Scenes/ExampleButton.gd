extends Button





func _on_ExampleButton_toggled(button_pressed):
	if button_pressed:
		set_text('ON')
	else:
		set_text('OFF')
