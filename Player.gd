extends "res://Entities/Characters/Character.gd"

func _ready():
	changeBody("Standard")
	add_to_group(Constants.G_PLAYER)

func _physics_process(delta):
	read_input()
	process_skills()
	move(delta, $body)
	look_mouse()
	process_collisions()
	animate()
	
func look_mouse():
	$body.look_at(getMousePosition())
	
func read_input():
	target_vel.x = 0
	target_vel.y = 0
	if Input.is_action_pressed("ui_left"):
		target_vel.x += -1
	if Input.is_action_pressed("ui_right"):
		target_vel.x += 1
	if Input.is_action_pressed("ui_up"):
		target_vel.y -= 1
	if Input.is_action_pressed("ui_down"):
		target_vel.y = 1
		
	target_vel = target_vel.normalized()

func process_skills():
	pass

func leftAttack():
	var children = $body/LeftWeapon.get_children()
	if children.length > 0:
		children[0].attack()
		
func changeBody(name):
	var children = $body.get_children()
	for child in children:
		if "Sprite" in child.get_name() or "CollisionShape" in child.get_name():
			$body.remove_child(child)
	var bodies = $body/Bodies.get_children()
	for node in bodies:
		if name in node.get_name():
			$body/Bodies.remove_child(node)
			$body.add_child(node)
			$body.set_owner(node)

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