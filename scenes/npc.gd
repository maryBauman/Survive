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
	IDLE,
	NEW_DIR,
	MOVE
}

func _ready():
	randomize()
	start_pos = position
	
func _process(delta):
	if cur_state==0 or cur_state==1:
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
#		elif dir.x > 0.5 and dir.y < 0.5:
#			$AnimatedSprite2D.play("ne-walk")
#		elif dir.x > 0.5 and dir.y > 0.5:
#			$AnimatedSprite2D.play("se-walk")
#		elif dir.x < 0.5 and dir.y < 0.5:
#			$AnimatedSprite2D.play("nw-walk")
#		elif dir.x < 0.5 and dir.y > 0.5:
#			$AnimatedSprite2D.play("sw-walk")
		
