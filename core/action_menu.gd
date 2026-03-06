extends Control
class_name ActionMenu

signal action_selected(action_id: String)

@onready var buttons := {
	"Explorar": $Panel/VBoxContainer/Explorar,
	"Entrenar": $Panel/VBoxContainer/Entrenar,
	"Fabricar": $Panel/VBoxContainer/Fabricar,
	"Descansar": $Panel/VBoxContainer/Descansar
}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for action_id in buttons.keys():
		buttons[action_id].pressed.connect(
			func(): _on_button_pressed(action_id)
		)
func _on_button_pressed(action_id: String) -> void:
	set_enabled(false)
	emit_signal("action_selected", action_id)
	hide()

func set_enabled(value: bool) -> void:
	for button in buttons.values():
		button.disabled = not value
