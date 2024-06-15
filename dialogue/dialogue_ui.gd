extends Control

signal dialogueFinished

@export_file("*.json") var dialogueFile

var dialogue = []
var curDialogueId = 0
var diActive = false

func _ready():
	$DialogueBackground.visible = false

	
func start():
	if diActive:
		return 
	diActive = true
	$DialogueBackground.visible = true
	dialogue = loadDialogue()
	curDialogueId = -1
	nextScript()
	
func loadDialogue():
	var file = FileAccess.open("res://dialogue/worker_dialogue.json", FileAccess.READ)
	var content = JSON.parse_string(file.get_as_text())
	return content
	
func _input(event):
	if !diActive:
		return
	if event.is_action_pressed("ui_accept"):
		nextScript()
	
func nextScript():
	curDialogueId += 1
	if curDialogueId >= len(dialogue):
		#end the dialogue here and give control back to npc
		diActive = false
		$DialogueBackground.visible = false
		emit_signal("dialogueFinished")
		return

	$DialogueBackground/Name.text = dialogue[curDialogueId]['name']
	$DialogueBackground/Text.text = dialogue[curDialogueId]['text']
