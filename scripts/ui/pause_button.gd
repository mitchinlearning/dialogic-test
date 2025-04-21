extends CanvasLayer

@onready var pause_scene = $ColorRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pause_scene.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_texture_button_pressed() -> void:
	State.pause.emit()
	pause_scene.show()
	get_tree().paused = true

func _on_resume_button_pressed() -> void:
	pause_scene.hide()
	get_tree().paused = false
	State.resume.emit()
	
	
