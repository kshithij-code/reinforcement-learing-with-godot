class_name RoadHitBox
extends Area2D

func _init() -> void:
	collision_layer = 1   
	collision_mask = 2   
	monitoring = true
	monitorable = true

func _ready():
	area_entered.connect(_on_area_entered)

func _on_area_entered(other_area: Area2D) -> void:
	print("RoadHitBox: entered by", other_area.name)
