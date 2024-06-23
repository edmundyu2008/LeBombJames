extends Node2D

@export var EnemyDallasScene: PackedScene
@export var Minibosses_dallasScene: PackedScene
@export var game_stats: GameStats

var margin = 8
var screen_width = ProjectSettings.get_setting("display/window/size/viewport_width")

@onready var spawner_component: Node2D = $SpawnerComponent as SpawnerComponent
@onready var enemy_spawn_timer: Timer = $EnemySpawnTimer
@onready var miniboss_spawn_timer: Timer = $MinibossSpawnTimer
func _ready() -> void:
	enemy_spawn_timer.timeout.connect(handle_spawn.bind(EnemyDallasScene, enemy_spawn_timer))
	miniboss_spawn_timer.timeout.connect(handle_spawn.bind(Minibosses_dallasScene, miniboss_spawn_timer, 10.0))
	game_stats.score_changed.connect(func(new_score: int):
		if new_score > 15:
			miniboss_spawn_timer.process_mode = Node.PROCESS_MODE_INHERIT
	)
	
func handle_spawn(enemy_scene: PackedScene, timer: Timer, time_offset: float = 1.0) -> void:
	spawner_component.scene = enemy_scene
	spawner_component.spawn(Vector2(randf_range(margin,screen_width-margin), -16))
	var spawn_rate = time_offset / (0.5 + (game_stats.score * 0.01))
	timer.start(spawn_rate + randf_range(0.25, 0.5))
