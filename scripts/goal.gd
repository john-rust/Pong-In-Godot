extends Area2D

var pong

@export var kickoff_dir = 1

func _ready():
	pong = get_parent()

func _on_goal_area_entered(area):
	#print("ping", area)
	if area.name == "Ball":
		var goal_name = self.name
		if goal_name == "LeftGoal":
			pong.update_score(2)
		elif goal_name == "RightGoal":
			pong.update_score(1)
		area.reset(kickoff_dir)
