extends CharacterBody2D

var speed = 100
var player_state

@export var inventory: Inventory
	
func _physics_process(delta):
	#wasd for input
	var direction = Input.get_vector("left","right","up","down")
	
	if direction.x == 0 and direction.y == 0:
		player_state = "idle"
	elif direction.x != 0 or direction.y !=0:
		player_state = "walking"
	
	velocity = direction * speed
	move_and_slide()
	play_anim(direction)
	
func play_anim(dir):
	if player_state == "idle":
		$AnimatedSprite2D.play("idle")
	if player_state == "walking":
		if dir.y == -1:
			$AnimatedSprite2D.play("n-walk")
		elif dir.x == 1:
			$AnimatedSprite2D.play("e-walk")
		elif dir.y == 1:
			$AnimatedSprite2D.play("s-walk")
		elif dir.x == -1:
			$AnimatedSprite2D.play("w-walk")
		elif dir.x > 0.5 and dir.y < 0.5:
			$AnimatedSprite2D.play("ne-walk")
		elif dir.x > 0.5 and dir.y > 0.5:
			$AnimatedSprite2D.play("se-walk")
		elif dir.x < 0.5 and dir.y < 0.5:
			$AnimatedSprite2D.play("nw-walk")
		elif dir.x < 0.5 and dir.y > 0.5:
			$AnimatedSprite2D.play("sw-walk")

func player():
	pass

func collect(item):
	inventory.insert(item)
