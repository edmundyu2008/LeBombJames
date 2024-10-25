class_name PositionClampComponent
extends Node2D

@export var actor: Node2D


@export var margin: = 8

var left_border = 0
var right_border = ProjectSettings.get_setting("display/window/size/viewport_width")
# Use the display viewport width to get the right border of the screen
var top_border = 0
var bottom_border = ProjectSettings.get_setting("display/window/size/viewport_height")
# Use the display viewport height to get the right border of the screen


func _process(_delta: float) -> void:
	actor.global_position.x = clamp(actor.global_position.x, left_border+margin, right_border-margin)
	actor.global_position.y = clamp(actor.global_position.y, top_border+margin, bottom_border-margin)
		# Clamp the x and y position of the actor between the left border and the right border
		#(accounting for the margin)

