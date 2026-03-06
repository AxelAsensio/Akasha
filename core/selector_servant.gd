extends Control

@onready var nombre =$MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/Label
@onready var descripcion = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/RichTextLabel
@onready var imagen = $MarginContainer/VBoxContainer/HBoxContainer/TextureRect

var indice=0

func _ready() -> void:
	actualizarUI()
	
func actualizarUI():
	var servant_actual=GameManager.servants[indice]
	nombre.text=servant_actual.nombre
	descripcion.text=servant_actual.descripcion
	imagen.texture=servant_actual.imagen	

func _on_siguiente_pressed():
	indice+=1
	if indice>= GameManager.servants.size():
		indice=0
	actualizarUI()

func _on_anterior_pressed():
	indice-=1
	if indice< 0:
		indice=GameManager.servants.size()-1
	actualizarUI()

func _on_seleccionar_pressed():
	GameManager.player_master.servant=GameManager.servants[indice]
	get_tree().change_scene_to_file("res://scenes/main_game.tscn")
