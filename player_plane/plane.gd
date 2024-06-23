extends Node2D

@onready var muzzle: Marker2D = $Muzzle
@onready var spawner_component: SpawnerComponent = $SpawnerComponent as SpawnerComponent
@onready var fire_rate_timer: Timer = $FireRateTimer
@onready var stats_component: StatsComponent = $StatsComponent as StatsComponent

func _ready() -> void:
	fire_rate_timer.timeout.connect(fire_lasers)
	stats_component.health_changed.connect()
	
func fire_lasers() -> void:
	spawner_component.spawn(muzzle.global_position)
