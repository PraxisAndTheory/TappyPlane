extends CharacterBody2D

const GRAVITY: float = 880.0
const POWER: float = -400.0

@onready var sprite: AnimatedSprite2D = $Sprite
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var engine_sound = $EngineSound


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#print("physics process")
	velocity.y += GRAVITY * delta
	
	fly()
	
	move_and_slide()
	
	if is_on_floor():
		die()
		
func fly() -> void:
	if Input.is_action_just_pressed("fly"):
		velocity.y = POWER
		animation_player.play("power")
		
func die() -> void:
	engine_sound.stop()
	sprite.stop()
	set_physics_process(false)
	SignalManager.on_plane_died.emit()
