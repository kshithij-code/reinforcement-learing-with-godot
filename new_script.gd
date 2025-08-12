extends Node

var box: MeshInstance3D
var ws := WebSocketPeer.new()

func _ready():
	box = $MeshInstance3D
	ws.connect_to_url("ws://localhost:8765")

func _process(delta: float):
	# Poll the WebSocket
	ws.poll()

	# If connected, send position
	if ws.get_ready_state() == WebSocketPeer.STATE_OPEN:
		var pos_str = "%f %f %f" % [box.position.x, box.position.y, box.position.z]
		ws.send_text(pos_str)

	# Receive new position if available
	while ws.get_available_packet_count() > 0:
		var msg = ws.get_packet().get_string_from_utf8()
		var parts = msg.split(" ")
		if parts.size() == 3:
			var new_pos = Vector3(parts[0].to_float(), parts[1].to_float(), parts[2].to_float())
			box.position = new_pos

func _exit_tree() -> void:
	if ws.get_ready_state() == WebSocketPeer.STATE_OPEN:
		ws.close(1000, "Closing connection")
		print("websocket closed")
