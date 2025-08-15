class_name CarHitBox
extends Area2D

var ws:=WebSocketPeer.new()

func _init() -> void:
	collision_layer = 2
	collision_mask = 1
	monitoring = true
	monitorable = true

func _ready():
	area_entered.connect(_on_area_entered)
	#print("%f %f"%[position.x,position.y])
	ws.connect_to_url("ws://localhost:8765")

func _process(_delta: float) -> void:
	ws.poll()
	if ws.get_ready_state()==WebSocketPeer.STATE_OPEN:
		var pos="%f %f"%[position.x,position.y]
		ws.send_text(pos)
	while ws.get_available_packet_count()>0:
		var msg=ws.get_packet().get_string_from_utf8()
		print(msg)


func _on_area_entered(other_area: Area2D) -> void:
	print("CarHitBox: entered by", other_area.name)
