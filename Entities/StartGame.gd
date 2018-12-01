extends CanvasLayer

signal S_START_GAME

func _process(_delta):
	$ParallaxBackground/Sky.motion_offset.x += 0.2

func _on_Button_button_down():
	$Control/VBoxContainer/Button.disabled = true
	emit_signal("S_START_GAME")