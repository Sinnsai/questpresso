extends Area2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@export_enum("Light Blue", "Purple", "Yellow", "Pink", "Blue", "Black", "Green", "Gray", "Orange", "White", "Red", "Bronze") var color: int
signal button_pressed
signal button_released

var player1 = false
var player2 = false


# kann noch gut überarbeitet werden aber sollte erstmal ausreichen
# selbes problem wie bei dem wind mit zwei playern, gibt es eine bessere methode als über das body entered signal ?
# maybe something like body is in range ? 
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	sprite_2d.frame_coords.x = 0
	sprite_2d.frame_coords.y = color



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player1"):
		player1 = true
		if !player2:
			sprite_2d.frame_coords.x = 1
			button_pressed.emit()
	elif body.is_in_group("player2"):
		player2 = true
		if !player1:
			sprite_2d.frame_coords.x = 1
			button_pressed.emit()




func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player1"):
		player1 = false
		if !player2:
			sprite_2d.frame_coords.x = 0
			button_released.emit()
	elif body.is_in_group("player2"):
		player2 = false
		if !player1:
			sprite_2d.frame_coords.x = 0
			button_released.emit()
