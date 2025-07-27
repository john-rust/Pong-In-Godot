extends Area2D

const DEFAULT_SPEED = 150

@onready var _initial_pos = position

var ball_dir = -1
var direction = Vector2(ball_dir, randf_range(-0.6, 0.6))
var _speed = DEFAULT_SPEED
var velocity: Vector2
var _previous_position: Vector2
var _delay = 1.5

func _process(delta):
	velocity = (position - _previous_position) / delta
	_previous_position = position
	_speed += delta * 2
	position += _speed * delta * direction

func reset(kickoff_dir):
	await get_tree().create_timer(_delay).timeout
	direction = Vector2(kickoff_dir, randf_range(-0.6, 0.6))
	position = _initial_pos
	_speed = DEFAULT_SPEED
