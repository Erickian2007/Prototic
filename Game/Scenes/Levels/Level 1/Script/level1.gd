extends Node2D

onready var sfx: AudioStreamPlayer = get_node("Managemant/AudioStream")
onready var fall_zone: Area2D = get_node("Managemant/Fall_Zone")
onready var camera: Camera2D = get_node("Managemant/Camera2D")

const SONG_GAME_START = preload("res://Resources/Sounds/WAV/02_Game Start_v4.wav")
const SONG_GAME_OVER = preload("res://Resources/Sounds/WAV/04_Game Over_v1.wav")

#    PRONTO
func _ready() -> void:
	#    Sinais
	var _on_body_entered = fall_zone.connect("body_entered" , self , "_on_body_entered")
	var _finished_song = sfx.connect("finished" , self , "_finished_song")
	
#    PROCESSOS DE FISICAS
func _physics_process(_delta: float) -> void:
	camera_move()
	
#    MOVER CAMARA
func camera_move() -> void:
	camera.global_position = Global.player.global_position
	
#    SOUNDS EFFECtS
func sounds_effects(song: AudioStreamSample) -> void:
	sfx.set_stream(song)
	sfx.play()
	
#    NO CORPO INSERIDO
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		sounds_effects(SONG_GAME_OVER)
		$player.set_physics_process(false)

func _finished_song() -> void:
	var _reaload = get_tree().reload_current_scene()
