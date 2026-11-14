extends Control

@export var AfficheBoutonMenu : bool = false

@onready var BoutonMenu = $TabContainer/HBoxContainer/VBoxContainer/HBoxContainer/BoutonMenu

signal exit_parametres

# Called when the node enters the scene tree for the first time.
func _ready():
	BoutonMenu.visible = AfficheBoutonMenu
	set_process(false)

func _on_exit_button_pressed():
	exit_parametres.emit()
	set_process(false)

func on_bouton_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/menu_principal/menu_principal.tscn")
