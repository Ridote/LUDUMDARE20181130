extends CanvasLayer

signal S_TRANSITION_SHOW_FINISHED
signal S_TRANSITION_HIDE_FINISHED

func show():
	$AnimationPlayer.play("Show")

func hide():
	$AnimationPlayer.play("Hide")

func _on_AnimationPlayer_animation_finished(anim_name):
	match(anim_name):
		"Show":
			emit_signal("S_TRANSITION_SHOW_FINISHED")
		"Hide":
			emit_signal("S_TRANSITION_HIDE_FINISHED")
