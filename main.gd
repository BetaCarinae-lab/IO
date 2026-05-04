extends Node2D

var gates: Dictionary[String, PackedScene] = {
	"test": preload("res://gatetest.tscn")
}
@onready var testbutton = get_node("Control/ColorRect/Button")
@onready var buttonscript = get_node("Control")

func _ready() -> void:
	testbutton.pressed.connect(_on_button_pressed.bind("test"))
	print("Loaded")
	
func _on_button_pressed(button: String) -> void:
	print("BUTTON CLICKED: " + button)
	


func _input(event: InputEvent) -> void:
	pass
