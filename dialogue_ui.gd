extends Control

@export_file("*.json") var dialogueFile

var dialogue = []
var curDialogueId = 0

func _ready():
	start()
	
func start():
	dialogue = loadDialogue()
	
func loadDialogue():
	
