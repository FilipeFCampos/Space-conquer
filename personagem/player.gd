extends CharacterBody2D

var _state_machine

@export_category("Variables")
@export var _move_speed: float = 64.0
@export var _acceleration: float = 0.2
@export var _friction: float = 0.2

@export_category("Objects")
@export var _animation_tree: AnimationTree = null

func _ready() -> void:
	_state_machine = _animation_tree["parameters/playback"]

func _physics_process(_delta: float) -> void:
	_move()
	_animate()
	move_and_slide()

func _move() -> void:
	var _direction: Vector2 = Vector2(
		Input.get_axis("Esquerda", "Direita"),
		Input.get_axis("Cima", "Baixo")
	)
	
	if _direction != Vector2.ZERO:
		_animation_tree["parameters/idle/blend_position"] = _direction
		_animation_tree["parameters/walk/blend_position"] = _direction
		_animation_tree["parameters/run/blend_position"] = _direction
		
		velocity.x = lerp(velocity.x, _direction.normalized().x * _move_speed, _acceleration)
		velocity.y = lerp(velocity.y, _direction.normalized().y * _move_speed, _acceleration)
		return
		
	velocity.x = lerp(velocity.x, _direction.normalized().x * _move_speed, _friction)
	velocity.y = lerp(velocity.y, _direction.normalized().y * _move_speed, _friction)
	velocity = _direction.normalized() * _move_speed
	move_and_slide()
	
func _animate() -> void:
	if velocity.length() > 1:
		_state_machine.travel("walk")
		return
	
	_state_machine.travel("idle")



func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://level_1.tscn")
	print("Cena mudada")
