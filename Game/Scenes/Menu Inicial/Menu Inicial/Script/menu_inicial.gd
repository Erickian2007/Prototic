extends Control

#    PRONTO
func _ready() -> void:
# Signals:
	
	# Play -----------------------------------------------------------------------------------------#
	var _play_button_down = $VBox/Play.connect("button_down" , self , "_on_play_button_down")
	var _play_mouse_entered = $VBox/Play.connect("mouse_entered" , self , "_on_play_mouse_entered")
	var _play_mouse_exited = $VBox/Play.connect("mouse_exited" , self , "_on_play_mouse_exited")
	#-----------------------------------------------------------------------------------------------#
	
	# Options --------------------------------------------------------------------------------------#
	var _options_button_down = $VBox/Options.connect("button_down" , self , "_on_options_button_down")
	var _options_mouse_entered = $VBox/Options.connect("mouse_entered" , self , "_on_options_mouse_entered")
	var _options_mouse_exited = $VBox/Options.connect("mouse_exited" , self , "_on_options_mouse_exited")
	#-----------------------------------------------------------------------------------------------#
	
	var _exit_button_down = $VBox/Exit.connect("button_down" , self , "_on_exit_button_down")
	var _exit_mouse_entered = $VBox/Exit.connect("mouse_entered" , self , "_on_exit_mouse_entered")
	var _exit_mouse_exited = $VBox/Exit.connect("mouse_exited" , self , "_on_exit_mouse_exited")
	
# SINAIS PLAY --------------------------------------------------------------------------------------#
func _on_play_button_down() -> void:
	$"Menu PB".Velocidade *= 100
func _on_play_mouse_entered() -> void:
	$SelectSeta/Seta.global_position = $SelectSeta/Positions/PlayPosition.global_position
func _on_play_mouse_exited() -> void:
	pass
#---------------------------------------------------------------------------------------------------#

# SINAIS OPTIONS -----------------------------------------------------------------------------------#
func _on_options_button_down() -> void:
	pass
func _on_options_mouse_entered() -> void:
	$SelectSeta/Seta.global_position = $SelectSeta/Positions/OptionsPosition.global_position
func _on_options_mouse_exited() -> void:
	pass
#---------------------------------------------------------------------------------------------------#

# SINAIS EXIT --------------------------------------------------------------------------------------#
func _on_exit_button_down() -> void:
	get_tree().quit()
func _on_exit_mouse_entered() -> void:
	$SelectSeta/Seta.global_position = $SelectSeta/Positions/ExitPosition.global_position
func _on_exit_mouse_exited() -> void:
	pass
#---------------------------------------------------------------------------------------------------#
