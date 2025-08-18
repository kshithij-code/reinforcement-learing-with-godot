extends Node

var ws:=WebSocketPeer.new()

func _ready() -> void:
	ws.connect_to_url("ws://localhost:8765")

func _process(delta: float) -> void:
	ws.pool()
	if ws.get_ready_state() == WebSocketPeer.STATE_OPEN:
		pass
func send_pos(x:float,y:float):
	if ws.get_ready_state() == WebSocketPeer.STATE_OPEN:
		ws.send_text("")
func _exit_tree() -> void:
	if ws.get_ready_state() == WebSocketPeer.STATE_OPEN:
		ws.close()
