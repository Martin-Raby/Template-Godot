extends Control

signal credits_fini

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("PAUSE") :
		finir_credits()

func finir_credits():
	credits_fini.emit()

func _on_visibility_changed() -> void:
	pass # Replace with function body.
