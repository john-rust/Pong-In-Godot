extends Node2D

var flash = true

func _ready():
	_flash()

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://scenes/pong.tscn")

func _flash():
	while flash:
		await get_tree().create_timer(1).timeout
		$StartGameLabel.visible = !$StartGameLabel.visible
