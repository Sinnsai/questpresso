extends PointLight2D
@onready var light: PointLight2D = $"."
@onready var sprite_2d: Sprite2D = $Sprite2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func turn_off() -> void:
	light.energy = 0
	sprite_2d.frame -= 1
	

func turn_on() -> void:
	light.energy = 1
	sprite_2d.frame += 1
