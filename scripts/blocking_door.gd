extends StaticBody2D

@export_enum("Light Blue", "Purple", "Yellow", "Pink", "Blue", "Black", "Green", "Gray", "Orange", "White", "Red", "Bronze") var color: int
@export var active = true # true = zu | false = auf

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var sprite_2d: Sprite2D = $Sprite2D
#@onready var light_occluder_2d: LightOccluder2D = $LightOccluder2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite_2d.frame_coords.x = int(active)
	sprite_2d.frame_coords.y = color
	collision_shape_2d.set_deferred("disabled", !active)


func turn_on():
	active = true
	collision_shape_2d.set_deferred("disabled", !active)
	sprite_2d.frame_coords.x = int(active)

	#light_occluder_2d.show()


func turn_off():
	active = false
	collision_shape_2d.set_deferred("disabled", !active)
	sprite_2d.frame_coords.x = int(active)
	#light_occluder_2d.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
