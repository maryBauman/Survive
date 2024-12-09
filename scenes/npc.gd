extends CharacterBody2D

const speed = 30
var cur_state = IDLE
var is_roaming = true
var is_chatting = false

var player
var player_in_chatzone = false
var dir = Vector2.RIGHT
var start_pos

enum {
	# 1=IDLE, 2=NEW_DIR, 3=MOVE
	IDLE,
	NEW_DIR,
	MOVE
}

func _ready():
	randomize()
	start_pos = position
	$Timer.one_shot = false
	
	
func _process(delta):
	if cur_state==0 or cur_state==1:
		#cur_state = IDLE or NEW_DIR
		$AnimatedSprite2D.play("idle")
	elif cur_state==2 and !is_chatting:
		if dir.y == -1:
			$AnimatedSprite2D.play("n-walk")
		elif dir.x == 1:
			$AnimatedSprite2D.play("e-walk")
		elif dir.y == 1:
			$AnimatedSprite2D.play("s-walk")
		elif dir.x == -1:
			$AnimatedSprite2D.play("w-walk")

	if is_roaming:
		match cur_state:
			IDLE:
				pass
			NEW_DIR:
				dir = choose([Vector2.RIGHT, Vector2.UP, Vector2.LEFT, Vector2.DOWN])
			MOVE:
				move(delta)
		#shouldn't be needed but keeping as a comment djust in case
		#await $Timer.timeout
		if Input.is_action_just_pressed("chat"):
			print("chatting with npc")
			$DialogueUI.start()
			is_roaming = false
			is_chatting = true
			#will stop the npc, even if they are in the middle of walking
			$AnimatedSprite2D.play("idle")

				
func choose(array):
	array.shuffle()
	return array.front()
	
func move(delta):
	if !is_chatting:
		position += dir * speed

		

func _on_chat_detection_area_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.has_method("player"):
		player = body
		player_in_chatzone = true


func _on_chat_detection_area_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if body.has_method("player"):
		player_in_chatzone = false


func _on_timer_timeout():
#	$Timer.wait_time=choose([5, 10, 15, 20, 30, 45])
	var times = [5, 10, 15]
	times.shuffle()
	$Timer.wait_time = (times.front())
	
	cur_state = choose([IDLE, NEW_DIR, MOVE])
	print("npc cur_state = ", cur_state)
	

func _on_dialogue_ui_dialogue_finished():
	is_chatting = false
	is_roaming = true
