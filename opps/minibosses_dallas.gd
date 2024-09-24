class_name MinibossesDallas
extends "res://opps/opps_dallas.gd"
@onready var states: Node = $States

@onready var move_down_state:  = %MoveDownState as TimedStateComponent
@onready var move_side_state:  = %MoveSideState as TimedStateComponent
@onready var pause_state: = %PauseState as TimedStateComponent
@onready var move_side_component: = %MoveSideComponent as MoveComponent
@onready var bullet_spawner: = $BulletSpawner as SpawnerComponent
@onready var muzzle: Marker2D = $Muzzle
@onready var fire_rate_timer: Timer = $FireRateTimer

func _ready() -> void:
	fire_rate_timer.timeout.connect(fire_lasers)
	hitbox_component.hit_hurtbox.connect(destroyed_component.destroy.unbind(1))
	super()
	
	for state in states.get_children():
		state = state as StateComponent
		state.disable()
		
	move_side_component.velocity.x = [-50, 50].pick_random()
	
	move_down_state.state_finished.connect(move_side_state.enable)
	move_side_state.state_finished.connect(pause_state.enable)
	pause_state.state_finished.connect(move_down_state.enable)
	move_down_state.enable()
	
func drop_crystal() -> void:
	crystal_spawner.spawn(crystal_spawnpoint.global_position)
	
func fire_lasers() -> void:
	bullet_spawner.spawn(muzzle.global_position)
