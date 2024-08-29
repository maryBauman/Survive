extends Control

signal quest_menu_closed

var quest1_active = false
var quest1_completed = false
#
##quest 1
#var stickCount = 0
#func quest_chat_1():
#	$questUI.visible = true
#func yes_pressed_1():
#	$questUI.visible = false
#	quest1_active = true
#	stick = 0
#	emit_signal(quest_menu_closed)
#func no_pressed_1():
#	$questUI.visible = false
#	quest1_active = false
#	emit_signal(quest_menu_closed)
#
#
#
#func _process(delta):
#	if quest1_active:
#		if stick>=3:
#			print("quest 1 completed")
#			quest1_active = false
			quest1_completed = true
