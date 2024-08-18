extends Node2D
class_name Player

@onready var muzzle: Marker2D = $Muzzle
@onready var spawner_component: SpawnerComponent = $SpawnerComponent as SpawnerComponent
@onready var fire_rate_timer: Timer = $FireRateTimer
@onready var player_health_component: PlayerHealthComponent = $PlayerHealthComponent as PlayerHealthComponent
@onready var player_health: PlayerHealth = $PlayerHealth as PlayerHealth
@onready var player_hurt_component: PlayerHurtComponent = $PlayerHurtComponent as PlayerHurtComponent
@onready var player_destroyed_component: PlayerDestroyedComponent = $PlayerDestroyedComponent as PlayerDestroyedComponent
@onready var energy_timer: Timer = $EnergyTimer

@onready var energy_bar = $EnergyBar

@export var energy = 0
var max_energy = 10

func _ready():
	energy = max_energy
	energy_bar.value = energy
	fire_rate_timer.timeout.connect(fire_lasers)
	player_health_component.player_health_changed.connect(func():
		player_health.adjust_player_health()
)
	energy_timer.timeout.connect(func():
		lose_energy(1)
		energy_bar.value = energy
)

func lose_energy(energy_amount : int):
	energy -= energy_amount
	energy_bar.value = energy
	if energy <= 0:
		player_destroyed_component.destroy()

func fire_lasers() -> void:
	spawner_component.spawn(muzzle.global_position)

