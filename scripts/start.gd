extends Node2D

var has_started : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	State.pause.connect(pause_dialog)
	State.resume.connect(resume_dialog)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent):
	# check if a dialog is already running
	if Dialogic.current_timeline != null:
		return
	
	if event is InputEventKey and event.keycode == KEY_ENTER and event.pressed and !has_started:
		Dialogic.start('start', State.dialog_label)
		get_viewport().set_input_as_handled()

func pause_dialog():
	if Dialogic.current_timeline == null:
		return
		
	Dialogic.paused = true
	
func resume_dialog():
	if Dialogic.current_timeline == null:
		return
		
	Dialogic.paused = false
	if State.dialog_label != "":
		Dialogic.start('start', State.dialog_label)
