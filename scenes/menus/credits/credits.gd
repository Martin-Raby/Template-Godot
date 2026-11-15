extends Control

@onready var TexteCredits = $TexteCredits

signal credits_fini

func _ready() -> void:
	#Le signal doit être connecté ici, s'il est fait dans le gestionnaire de signal, il tente de connecter une fonction avant que le noeud enfant qu'utilise la fonction soit crée (et donc crash)
	self.visibility_changed.connect(_on_visibility_changed)
	if Global.DefilementCredits :
		TexteCredits.position = Vector2(50.0, get_viewport().size[1])

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("PAUSE") || TexteCredits.position[1] <= 0 - TexteCredits.size[1]:
		finir_credits()
	elif Global.DefilementCredits :
		TexteCredits.position[1] -= 0.5

func finir_credits():
	credits_fini.emit()

func _on_visibility_changed() -> void:
	if Global.DefilementCredits :
		TexteCredits.position = Vector2(50.0, get_viewport().size[1])
