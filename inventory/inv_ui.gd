extends Control
@onready var inventory: Inventory = preload("res://inventory/player_inv.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

var is_open = false
# Called when the node enters the scene tree for the first time.
func _ready():
	inventory.update.connect(update_inv_slots)
	update_inv_slots()
	close()
	
func update_inv_slots():
	for i in range(min(inventory.slots.size(), slots.size())):
		slots[i].update(inventory.slots[i])

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
