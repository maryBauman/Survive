extends Resource
class_name Inventory

signal update

@export var slots: Array[InvSlot]

func insert(item: Inventory_item):
	var item_slots = slots.filter(func(slot): return slot.item==item)
	if !item_slots.is_empty():
		item_slots[0].amount+=1
