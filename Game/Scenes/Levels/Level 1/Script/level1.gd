extends Node2D

onready var camera: Camera2D = get_node("Managemant/Camera2D")


func _physics_process(_delta: float) -> void:
	camera_move()
	
	
func camera_move() -> void:
	camera.global_position = Global.player.global_position
