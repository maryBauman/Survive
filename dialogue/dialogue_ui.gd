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
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		nextScript()
	
func nextScript():
	curDialogueId += 1
	if curDialogueId >= len(dialogue):
		#end the dialogue here and give control back to npc
		return

	$DialogueBackground/Name.text = dialogue[curDialogueId]['name']
	$DialogueBackground/Text.text = dialogue[curDialogueId]['text']
