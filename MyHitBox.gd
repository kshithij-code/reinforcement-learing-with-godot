class_name CarHitBox
extends Area2D

func _init() -> void:
	collision_layer = 2
	collision_mask = 1
	monitoring = true
	monitorable = true

func _ready():
	area_entered.connect(_on_area_entered)

func _on_area_entered(other_area: Area2D) -> void:
	print("CarHitBox: entered by", other_area.name)
