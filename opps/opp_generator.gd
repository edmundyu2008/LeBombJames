extends Node2D

@export var EnemyDallasScene: PackedScene
@export var Minibosses_dallasScene: PackedScene

var margin = 8
var screen_width = ProjectSettings.get_setting("display/window/size/viewport_width")

@onready var spawner_component: Node2D = $SpawnerComponent as SpawnerComponent
@onready var enemy_spawn_timer: Timer = $EnemySpawnTimer
@onready var miniboss_spawn_timer: Timer = $MinibossSpawnTimer
func _ready() -> void:
	enemy_spawn_timer.timeout.connect(handle_spawn.bind(EnemyDallasScene, enemy_spawn_timer))
	miniboss_spawn_timer.timeout.connect(handle_spawn.bind(Minibosses_dallasScene, miniboss_spawn_timer))
	
	
func handle_spawn(enemy_scene: PackedScene, timer: Timer) -> void:
	spawner_component.scene = enemy_scene
	spawner_component.spawn(Vector2(randf_range(margin,screen_width-margin), -16))
	timer.start()
