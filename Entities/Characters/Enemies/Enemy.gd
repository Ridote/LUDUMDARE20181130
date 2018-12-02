extends "res://Entities/Characters/Character.gd"

func _physics_process(_delta):
	process_collisions()

func process_collisions():
	var collider = null
	for i in range($body.get_slide_count()):
		collider = $body.get_slide_collision(i).get_collider().get_parent()
		if(collider.is_in_group(Constants.G_AMOEBA)):
			print("Player collision!!")

