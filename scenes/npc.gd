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
