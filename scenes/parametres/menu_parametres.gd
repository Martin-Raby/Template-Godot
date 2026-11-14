extends Control

signal exit_parametres

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)

func _on_exit_button_pressed():
	exit_parametres.emit()
	set_process(false)
