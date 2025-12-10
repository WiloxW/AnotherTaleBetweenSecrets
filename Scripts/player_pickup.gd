extends Area2D

func _process(delta: float) -> void:
	detect_collisions()

func detect_collisions():
	for collision in get_overlapping_areas():
		if "pickable" in collision and collision.pickable:
			pickup(collision)

func pickup(item):
	item.queue_free()
