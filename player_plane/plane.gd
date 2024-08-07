extends Node2D

@onready var muzzle: Marker2D = $Muzzle
@onready var spawner_component: SpawnerComponent = $SpawnerComponent as SpawnerComponent
@onready var fire_rate_timer: Timer = $FireRateTimer
@onready var player_health_component: PlayerHealthComponent = $PlayerHealthComponent as PlayerHealthComponent
@onready var player_health: PlayerHealth = $PlayerHealth as PlayerHealth
@onready var player_hurt_component: PlayerHurtComponent = $PlayerHurtComponent as PlayerHurtComponent
@onready var player_destroyed_component: PlayerDestroyedComponent = $PlayerDestroyedComponent as PlayerDestroyedComponent
@onready var player_energy: PlayerEnergy = $PlayerEnergy as PlayerEnergy
@onready var player_energy_component: PlayerEnergyComponent = $PlayerEnergyComponent as PlayerEnergyComponent
@onready var energy_timer: Timer = $EnergyTimer


func _ready():
	fire_rate_timer.timeout.connect(fire_lasers)
	player_health_component.player_health_changed.connect(func():
		player_health.adjust_player_health()
)
	player_energy_component.player_energy_changed.connect(func():
		player_energy.adjust_player_energy()
)
	energy_timer.timeout.connect(func():
		player_energy.adjust_player_energy()
)
	
func fire_lasers() -> void:
	spawner_component.spawn(muzzle.global_position)



	
