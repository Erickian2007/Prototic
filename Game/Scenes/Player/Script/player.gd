#    EXTENDIDO
extends KinematicBody2D

#    EXPORTAVEIS
export(int) var Gravidade
export(int) var Velocidade
export(int) var Pulo

#    EM PRONTO
onready var animated_sprite: AnimatedSprite = get_node("AnimatedSprite")

#    VENTORES
var vel: Vector2

#    PRONTO
func _ready() -> void:
	Global.player = self
	
	set_physics_process(true)
	
#    PROCESSOS DE FÍSICAS
func _physics_process(delta: float) -> void:
	gravity(delta)
	animation()
	move()
	jump(delta)

#    GRAVIDADE
func gravity(_delta: float) -> void:
	vel = move_and_slide(vel , Vector2.UP)
	vel.y += Gravidade * _delta
	if vel.y > Gravidade:
		vel.y = Gravidade

#    ANIMAÇÃO
func animation() -> void:
	change_direction()
	move_anim()

#    MUDAR DIREÇÃO
func change_direction() -> void:
	if vel.x > 0:
		animated_sprite.flip_h = false
	elif vel.x < 0:
		animated_sprite.flip_h = true

#    ANIM MOVER
func move_anim() -> void:
	if abs(vel.x) != 0:
		animated_sprite.play("walk")
	else:
		animated_sprite.play("idle")

#    MOVER
func move() -> void:
		var input: Vector2 = Vector2.ZERO
		input.x = Input.get_action_raw_strength("D") - Input.get_action_raw_strength("A")
		vel.x = input.x * Velocidade

#    PULAR
func jump(_delta: float) -> void:
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		vel.y = -Pulo * _delta * 50
