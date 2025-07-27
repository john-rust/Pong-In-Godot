extends Area2D

func _on_area_entered(area):
	if area.name == "Ball":
		area.direction.y *= -1
