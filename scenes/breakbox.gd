extends Area2D

@onready var interactable: Area2D = $Interactable
@onready var sprite_2d: Sprite2D = $Sprite2D
var sig = 0
signal fuse_on(sig)
signal fuse_off(sig)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interactable.interact = _on_interact
	


func _on_interact():
	if sprite_2d.frame == 0:
		sprite_2d.frame = 1
		fuse_off.emit()
		print("the fuse box is off")
	else:
		sprite_2d.frame = 0
		fuse_on.emit()
		print("the fuse box is on")
