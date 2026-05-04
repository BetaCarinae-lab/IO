extends Node2D

var gates: Dictionary[String, PackedScene] = {
	"test": preload("res://gatetest.tscn")
}
@onready var testbutton = get_node("Control/ColorRect/Button")
@onready var buttonscript = get_node("Control")
var holding = gates["test"].instantiate()
var dragging = false

func _ready() -> void:
	testbutton.pressed.connect(_on_button_pressed.bind("test"))
	print("Loaded")
	print(holding)

func _on_button_pressed(button: String) -> void:
	holding = gates[button].instantiate()
	add_child(holding)
	dragging = true

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and dragging and holding:
		holding.position = event.position  # follow mouse

	if event.is_action_released("holdanddrop") and dragging:
		holding.position = event.position  # place at final position
		holding = null                     # drop reference, object stays in scene
		dragging = false
