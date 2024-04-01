extends Control
var is_open = false
@onready var inventory: Inventory = preload("res://inventory/player_inv.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()


# Called when the node enters the scene tree for the first time.
func _ready():
	close()
	
func update_inv_slots():
	for i in range(min(inventory.item.size(), slots.size())):
		slots[i].update(inv.item[i])

func close():
	visible = false
	is_open = false

func open():
	visible = true
	is_open = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("i"):
		if is_open:
			close()
		else:
			open()
