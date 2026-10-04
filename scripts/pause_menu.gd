extends CanvasLayer

@onready var panel = $Panel

func _ready():
	panel.visible = false
	process_mode = Node.PROCESS_MODE_ALWAYS


func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		toggle_pause()


func toggle_pause():
	get_tree().paused = !get_tree().paused
	panel.visible = get_tree().paused


func _on_h_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(
		AudioServer.get_bus_index("Master"),
		linear_to_db(value)
	)


func _on_continue_pressed() -> void:
	toggle_pause()


func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
