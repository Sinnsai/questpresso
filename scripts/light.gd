extends PointLight2D
@onready var light: PointLight2D = $"."
@onready var sprite_2d: Sprite2D = $Sprite2D
@export_enum("Default", "Light Blue", "Purple", "Yellow", "Pink", "Blue", "Black", "Green", "Gray", "Orange", "White", "Red", "Bronze") var sprite_color: int
@export var show_sprite = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite_2d.frame_coords.y = sprite_color
	sprite_2d.visible = show_sprite


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func turn_off() -> void:
	light.energy = 0
	sprite_2d.frame_coords.x = 0
	

func turn_on() -> void:
	light.energy = 1
	sprite_2d.frame_coords.x = 1
