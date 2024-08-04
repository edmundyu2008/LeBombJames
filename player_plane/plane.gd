extends Node2D

@onready var muzzle: Marker2D = $Muzzle
@onready var spawner_component: SpawnerComponent = $SpawnerComponent as SpawnerComponent
@onready var fire_rate_timer: Timer = $FireRateTimer
@onready var player_health_component: PlayerHealthComponent = $PlayerHealthComponent as PlayerHealthComponent
@onready var player_health: PlayerHealth = $PlayerHealth as PlayerHealth
@onready var player_hurt_component: PlayerHurtComponent = $PlayerHurtComponent as PlayerHurtComponent
@onready var player_destroyed_component: PlayerDestroyedComponent = $PlayerDestroyedComponent as PlayerDestroyedComponent


func _ready():
	fire_rate_timer.timeout.connect(fire_lasers)
	player_health_component.player_health_changed.connect(func():
		player_health.adjust_player_health()
)
	
func fire_lasers() -> void:
	spawner_component.spawn(muzzle.global_position)


	
