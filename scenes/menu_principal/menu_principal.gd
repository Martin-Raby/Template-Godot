extends Control

# Prépare les noeuds visuels à être appelés dans le code
@onready var MenuPrincipal = $ContainerMenuPrincipal
@onready var MenuParametres = $MenuParametres
@onready var MusiqueFond = $MusiqueFond

# Pré charge la scène
var scene_principale = preload("res://scenes/scene_principale/scene_principale.tscn").instantiate()

## Entrée : Rien |
## Sortie : Rien |
## Action : Connecte les signaux à leurs fonctions dédiées |
func _ready():
	#Signal pour quitter les paramètres
	MenuParametres.exit_parametres.connect(on_exit_parametres)
	#Signal pour quitter la scène principale
	scene_principale.Quitter.connect(on_quitter)

#region Paramètres
## Entrée : Rien |
## Sortie : Rien |
## Action : Affiche le menu des paramètres |
func _on_bouton_parametres_pressed():
	MenuPrincipal.visible = false
	MenuParametres.set_process(true)
	MenuParametres.visible = true

## Entrée : Rien |
## Sortie : Rien |
## Action : Cache le menu des paramètres |
func on_exit_parametres() -> void :
	MenuPrincipal.visible = true 
	MenuParametres.visible = false
	MenuParametres.set_process(false)
#endregion

## Entrée : Rien |
## Sortie : Rien |
## Action : Affiche la scène principale (et arrète les effets du menu principal |
func _on_bouton_jouer_pressed():
	get_tree().root.add_child(scene_principale)
	MusiqueFond.playing = false
	MenuPrincipal.visible = false

## Entrée : Rien |
## Sortie : Rien |
## Action : Quand la musique est fini, rejoue la musique |
func _on_musique_fond_finished() -> void:
	MusiqueFond.play()

## Entrée : Rien |
## Sortie : Rien |
## Action : Quand la scène principale est quitté, affiche correctement le menu principal, prépare la scène principale à être réutilisé, réassigne ses signaux |
func on_quitter () -> void :
	MusiqueFond.playing = true
	MenuPrincipal.visible = true
	scene_principale = preload("res://scenes/scene_principale/scene_principale.tscn").instantiate()
	scene_principale.Quitter.connect(on_quitter)

## Entrée : Rien |
## Sortie : Rien |
## Action : Quitte le jeu quand le bouton "Quitter" est utilisé |
func on_bouton_quitter_pressed() -> void:
	get_tree().quit()
