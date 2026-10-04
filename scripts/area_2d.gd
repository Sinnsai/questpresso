extends Area2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var interactable: Area2D = $Interactable
@export var next_scene: String

var open = false
var player1 = false
var player2 = false

signal door_open
signal door_closed
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interactable.interact = _on_interact



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_interact():
	if open and player1 and player2:
		print("next level")
		get_tree().change_scene_to_file(next_scene)


func open_door():
	for n in sprite_2d.hframes +1:
		sprite_2d.frame = n
		await get_tree().create_timer(0.075).timeout
	print("Door opens")
	open = true
	door_open.emit()




func close_door():
	for n in range(sprite_2d.hframes,-1,-1):
		sprite_2d.frame = n
		await get_tree().create_timer(0.075).timeout
	print("Door closed")
	open = false
	door_closed.emit()




func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player1"):
		player1 = true
	if body.is_in_group("player2"):
		player2 = true



func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player1"):
		player1 = false
	if body.is_in_group("player2"):
		player2 = false
