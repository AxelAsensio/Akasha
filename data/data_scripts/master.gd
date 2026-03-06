extends Persona

class_name Master
@export var servant: Servant
@export var inventario: Dictionary = {}
@export var recetas_conocidas: Array[Receta]

func add_item(item: Item, amount: int = 1):
	if inventario.has(item):
		inventario[item] += amount
	else:
		inventario[item] = amount
