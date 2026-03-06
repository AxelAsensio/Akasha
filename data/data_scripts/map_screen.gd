extends Control
class_name MapScreen

signal location_selected(location_id: String)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in $LocationsLayer.get_children():
		if child is Button:
			child.pressed.connect(
				func(): _on_location_pressed(child.name)
			)
func _on_location_pressed(location_id: String) -> void:
	hide()
	emit_signal("location_selected", location_id)
