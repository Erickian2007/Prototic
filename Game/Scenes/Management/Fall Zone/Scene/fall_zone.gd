extends Area2D

func _ready() -> void:
	var _connect = connect("body_entered" , self , "on_body_entered")
	
func on_body_entered( body: Node2D) -> void:
	if body.is_in_group("Player"):
		var _reaload = get_tree().reload_current_scene()
