extends Node2D

const WIN_SCORE = 11

var left_score = 0
var right_score = 0
var load_ball = preload("res://scenes/ball.tscn")

func _ready():
	await get_tree().create_timer(5).timeout
	var ball = load_ball.instantiate()
	add_child(ball)

func update_score(player):
	if player == 1:
		left_score += 1
	else:
		right_score += 1
	
	$LeftPlayerScoreLabel.text = str(left_score)
	$RightPlayerScoreLabel.text = str(right_score)
	
	if left_score == WIN_SCORE or right_score == WIN_SCORE:
		$Ball.set_process(false)
		$WinLabel.visible = true
		if left_score == WIN_SCORE:
			$WinLabel.text = "Left Paddle Wins"
		else:
			$WinLabel.text = "Right Paddle Wins"
		await get_tree().create_timer(10).timeout
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
