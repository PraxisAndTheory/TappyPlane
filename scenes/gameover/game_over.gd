extends Control

@onready var go_label = $GOLabel
@onready var space_label = $SpaceLabel
@onready var timer = $Timer
@onready var go_sound = $GOSound

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	SignalManager.on_plane_died.connect(on_plane_died)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if space_label.visible and Input.is_action_just_pressed("fly"):
		GameManager.load_main_scene()

func run_sequence() -> void:
	go_label.hide()
	space_label.show()

func on_plane_died() -> void:
	show()
	go_sound.play()
	timer.start()
	

func _on_timer_timeout():
	run_sequence()
