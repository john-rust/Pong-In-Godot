extends Area2D

const MOVE_SPEED = 175

var _up: String
var _down: String
var _previous_position: Vector2
var velocity: Vector2
var _ball_dir: int
var _new_direction: Vector2
var _hit_position: float

func _ready():
	_previous_position = position
	_new_direction = Vector2()
	var n = String(name)
	print(n)
	_up = n + "_Up"
	_down = n + "_Down"

func _process(delta):
	velocity = (position - _previous_position) / delta
	_previous_position = position
	var input = Input.get_action_strength(_up) - Input.get_action_strength(_down)
	position.y = clamp(position.y + -input * MOVE_SPEED * delta, -150, 150)

func _on_area_entered(area):
	if area.name == "Ball":
		_hit_position = abs(area.position.y) - abs(position.y)
		_new_direction.x = area.direction.x * -1
		if (
			abs(_hit_position) <= 2.0 
			and abs(_hit_position) >= 0.0
		):
			_new_direction.y = randf_range(0.0, 0.1)
		elif (
			abs(_hit_position) > 2.0 
			and abs(_hit_position) <= 6.0
		):
			_new_direction.y = randf_range(0.1, 0.5)
		else:
			_new_direction.y = randf_range(0.5, 0.9)
		
		if _hit_position < 0:
			_new_direction.y = _new_direction.y * -1
		else:
			print("what")
		area.direction = _new_direction.normalized()
