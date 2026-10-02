extends Area2D
@onready var sprite_2d: Sprite2D = $Sprite2D
signal button_pressed
signal button_released

var button = false

# kann noch gut überarbeitet werden aber sollte erstmal ausreichen
# selbes problem wie bei dem wind mit zwei playern, gibt es eine bessere methode als über das body entered signal ?
# maybe something like body is in range ? 
# Called when the node enters the scene tree for the first time.


func _process(delta: float) -> void:
	if button:
		button_pressed.emit()



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		sprite_2d.frame = 1
		button = true




func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		sprite_2d.frame = 0
		button_released.emit()
