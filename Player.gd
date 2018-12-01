extends "res://Entities/Characters/Character.gd"

func _ready():
	add_to_group(Constants.G_PLAYER)

func _physics_process(delta):
	read_input()
	process_skills()
	move(delta, Vector2(), $body)
	process_collisions()
	animate()
	
func read_input():
	pass

func process_skills():
	pass

func animate():
	pass

func process_collisions():
	var collider = null
	for i in range($body.get_slide_count()):
		collider = $body.get_slide_collision(i).get_collider().get_parent()
		if(collider.is_in_group(Constants.G_ENEMY)):
			print("Player collision!!")

func receiveDmg(val : float = 1.0) -> void:
	HP -= val

func getGlobalPosition():
	return $body.global_position

func getOrientation():
	return $body.rotation