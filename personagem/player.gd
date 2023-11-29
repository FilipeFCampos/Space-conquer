extends CharacterBody2D

@export_category("Variables")
@export var _move_speed: float = 64.0
@export var _acceleration: float = 0.4
@export var _friction: float = 0.8

func _physics_process(_delta: float) -> void:
	_move()

func _move() -> void:
	var _direction: Vector2 = Vector2(
		Input.get_axis("Esquerda", "Direita"),
		Input.get_axis("Cima", "Baixo")
	)
	
<<<<<<< HEAD
	if _direction != Vector2.ZERO:
		velocity.x = lerp(velocity.x, _direction.normalized().x * _move_speed, _acceleration)
		velocity.y = lerp(velocity.y, _direction.normalized().y * _move_speed, _acceleration)
		return
		
	velocity.x = lerp(velocity.x, _direction.normalized().x * _move_speed, _friction)
	velocity.y = lerp(velocity.y, _direction.normalized().y * _move_speed, _friction)
=======
	velocity.x = lerp(velocity.x, _direction.normalized().x * _move_speed, _acceleration)
	velocity.y = lerp(velocity.y, _direction.normalized().y * _move_speed, _acceleration)
>>>>>>> tela-inicial
	velocity = _direction.normalized() * _move_speed
	move_and_slide()
