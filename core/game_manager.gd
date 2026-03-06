extends Node

var player_master: Master
var masters: Array[Master]
var servants: Array[Servant]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	masters  = [
		load("res://data/masters/shirou.tres"),
		load("res://data/masters/kirei.tres")
	]
	servants  = [
		load("res://data/servants/saber.tres"),
		load("res://data/servants/gilgamesh.tres")
	]
func start_turn():
	pass
