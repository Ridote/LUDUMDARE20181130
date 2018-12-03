extends CanvasLayer

const propsFactory = preload("res://Entities/Intro/PropIntro.tscn")

signal S_START_GAME

const propCreationRange = [0.02, 0.1]

func _ready():
	var prop = null
	for _i in range(1, 3):
		prop = propsFactory.instance()
		add_child(prop)
	$CreateProp.wait_time = (randf()*(propCreationRange[1]-propCreationRange[0]))+propCreationRange[0]
	$CreateProp.start()


func _on_Button_button_down():
	$Control/VBoxContainer/Button.disabled = true
	emit_signal("S_START_GAME")

func _on_CreateProp_timeout():
	var prop = propsFactory.instance()
	add_child(prop)
	
	prop.initialise($LeftSpawn, $RightSpawn)
	
	$CreateProp.wait_time = (randf()*(propCreationRange[1]-propCreationRange[0]))+propCreationRange[0]
	$CreateProp.start()
