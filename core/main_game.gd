extends Control
class_name MainGame

@onready var action_menu: ActionMenu = $UIContainer/ActionMenu
@onready var map_screen: MapScreen = $UIContainer/MapScreen
@onready var craft_scene: CraftScene = $UIContainer/CraftScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	action_menu.action_selected.connect(_on_action_selected)
	map_screen.location_selected.connect(_on_location_selected)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_action_selected(action_id: String) -> void:
	match action_id:
		"Explorar":
			map_screen.show()
		"Fabricar":
			craft_scene.open(GameManager.player_master) #TODO: Cambiar por master actual en gamemanager
		_:
			pass #TODO: Terminar turno actual
			
func _on_location_selected(location_id: String) -> void:
	print("Explorando lugar:", location_id)
	map_screen.hide()
	action_menu.show()
