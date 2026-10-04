extends Area2D

@export_enum("Light Blue", "Purple", "Yellow", "Pink", "Blue", "Black", "Green", "Gray", "Orange", "White", "Red", "Bronze") var color: int
@export var active = false

@onready var interactable: Area2D = $Interactable
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var sound: AudioStreamPlayer2D = $sound


var sig = 0
signal fuse_on(sig)
signal fuse_off(sig)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interactable.interact = _on_interact
	sprite_2d.frame_coords.x = int(active)
	sprite_2d.frame_coords.y = color


func _on_interact():
	if active:
		turn_off()
		fuse_off.emit()
		print("the fuse box is off")
	else:
		turn_on()
		fuse_on.emit()
		print("the fuse box is on")

func turn_on():
	active = true
	sprite_2d.frame_coords.x = int(active)
	sound.play()

func turn_off():
	active = false
	sprite_2d.frame_coords.x = int(active)
	sound.play()
