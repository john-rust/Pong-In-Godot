extends Area2D

@export var _is_wall = false

func _on_area_entered(area):
	if area.name == "Ball":
		if _is_wall:
			area.direction.x *= -1
		else:
			area.direction.y *= -1
