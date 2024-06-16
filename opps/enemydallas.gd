extends Node2D

@onready var stats_component: StatsComponent = $StatsComponent as StatsComponent
@onready var move_component: MoveComponent = $MoveComponent as MoveComponent
@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent as HurtboxComponent
@onready var hitbox_component: HitboxComponent = $HitboxComponent as HitboxComponent

func _ready() -> void: 
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
	stats_component.no_health.connect(queue_free)