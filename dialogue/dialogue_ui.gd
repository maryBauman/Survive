extends Control

@export_file("*.json") var dialogueFile

var dialogue = []
var curDialogueId = 0

func _ready():
	start()
	
func start():
	dialogue = loadDialogue()
	curDialogueId = -1
	nextScript()
	
func loadDialogue():
	var file = FileAccess.open("res://dialogue/worker_dialogue.json", FileAccess.READ)
	var content = JSON.parse_string(file.get_as_text())
	return content
	
func nextScript():
	curDialogueId += 1
