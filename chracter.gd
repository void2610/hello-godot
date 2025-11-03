extends CharacterBody2D

@export var speed: float = 300
@export var dash_mult: float = 2
func _move() -> void:
	var r : float = 0.05
	var is_dash : bool = false
	
	var d = Input.get_vector("player_left", "player_right", "player_up", "player_down")
	
	if Input.is_action_pressed("player_dash"):
		is_dash = true
		
	velocity = d * speed * (dash_mult if is_dash else 1.0)
	move_and_slide()
	rotate(r * (dash_mult if is_dash else 1.0))

func _physics_process(_delta: float) -> void:
	_move()
	

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("quit_game"):
		get_tree().quit()
