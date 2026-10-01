extends Area2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var interactable: Area2D = $Interactable

var open = false

signal door_open
signal door_closed
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interactable.interact = _on_interact


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_interact():
	if open:
		print("next level")
		#nächstes level laden
	
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
