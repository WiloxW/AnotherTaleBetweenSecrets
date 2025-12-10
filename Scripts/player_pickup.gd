extends Area2D

var inventory : Array = []

func _process(_delta: float) -> void:
	detect_collisions()

func detect_collisions():
	for collision in get_overlapping_areas():
		if "pickable" in collision and collision.pickable:
			pickup(collision)

func pickup(item):
	global.inventory.append(item.name)
	print(global.inventory)
	global.collected_items[item.item_id] = true
	item.queue_free()
