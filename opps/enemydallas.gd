extends Node2D

@onready var stats_component: StatsComponent = $StatsComponent as StatsComponent
@onready var move_component: MoveComponent = $MoveComponent as MoveComponent
@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent as HurtboxComponent
@onready var hitbox_component: HitboxComponent = $HitboxComponent as HitboxComponent
@onready var score_component: ScoreComponent = $ScoreComponent as ScoreComponent
@onready var destroyed_component: DestroyedComponent = $DestroyedComponent as DestroyedComponent




func _ready() -> void: 
	stats_component.no_health.connect(func():
		score_component.adjust_score()

	)
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
	hitbox_component.hit_hurtbox.connect(queue_free.unbind(1))
	

