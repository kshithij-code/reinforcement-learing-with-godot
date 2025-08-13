extends Node

func _ready() -> void:
	Input.action_press("ui_up")
	await get_tree().process_frame
	Input.action_release("ui_up")
