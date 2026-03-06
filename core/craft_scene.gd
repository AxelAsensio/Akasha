extends Control
class_name CraftScene

@onready var recipe_list := $Panel/RecipeList
@onready var recipe := $Panel/RecipeList/Receta
var master_crafteando: Master

signal craft_done #TODO

func open(master):
	master_crafteando=master
	show()
	mostrarRecetas(master_crafteando)
	
func mostrarRecetas(master):
	for receta in master.recetas_conocidas:
		var nueva_receta= recipe.duplicate()
		var nombre_receta = nueva_receta.get_node("Nombre")
		var descripcion_receta = nueva_receta.get_node("Descripcion")
		nombre_receta.text=receta.nombre
		descripcion_receta.text=receta.resultado.descripcion
		descripcion_receta.custom_minimum_size.x = 150
		nombre_receta.custom_minimum_size.x = 150
		nueva_receta.get_node("CraftButton").text= "Fabricar"
		nueva_receta.show()
		recipe_list.add_child(nueva_receta)
func _on_craft_button_pressed() -> void:
	print("Test")
