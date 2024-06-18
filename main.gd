extends Node2D

@onready var plane: Node2D = $Plane

func _ready() -> void:
	plane.tree_exiting.connect(func():
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://UI/you_died.tscn")
		)
