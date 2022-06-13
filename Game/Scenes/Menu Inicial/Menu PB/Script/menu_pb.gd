extends ParallaxBackground

export(int) var Velocidade

func _physics_process(delta: float) -> void:
	$ParallaxLayer.motion_offset.x += delta * Velocidade
	
func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_UP:
			Velocidade += 100
		elif event.pressed and event.scancode == KEY_DOWN:
			Velocidade -= 100
