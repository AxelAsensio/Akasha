extends Control

@onready var nombre =$MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/Label
@onready var descripcion = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/RichTextLabel
@onready var imagen = $MarginContainer/VBoxContainer/HBoxContainer/TextureRect

var indice=0

func _ready() -> void:
	actualizarUI()
	
func actualizarUI():
	var master_actual=GameManager.masters[indice]
	nombre.text=master_actual.nombre
	descripcion.text=master_actual.descripcion
	imagen.texture=master_actual.imagen	

func _on_siguiente_pressed():
	indice+=1
	if indice>= GameManager.masters.size():
		indice=0
	actualizarUI()

func _on_anterior_pressed():
	indice-=1
	if indice< 0:
		indice=GameManager.masters.size()-1
	actualizarUI()

func on_seleccionar_pressed():
	GameManager.player_master=GameManager.masters[indice]
	get_tree().change_scene_to_file("res://scenes/selector_servant.tscn")
