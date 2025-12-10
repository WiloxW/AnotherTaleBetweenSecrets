extends Area2D

var inventory = []

func _process(_delta: float) -> void:
	detect_collisions()

func detect_collisions():
	for collision in get_overlapping_areas():
		if "pickable" in collision and collision.pickable:
			pickup(collision)

func pickup(item):
	inventory.append(item.name)
	item.queue_free()
