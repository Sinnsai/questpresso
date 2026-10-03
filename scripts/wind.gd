extends Area2D

@export_range(1,20,1) var length_in_tiles: int
@export_enum("Light Blue", "Purple", "Yellow", "Pink", "Blue", "Black", "Green", "Gray", "Orange", "White", "Red", "Bronze") var color: int
@export var wind_force: Vector2 = Vector2(200, 0)
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var fan: Sprite2D = $fan

@export var has_energy = false


func _ready() -> void:
	fan.frame = color
	collision_shape_2d.scale.y = length_in_tiles
	collision_shape_2d.position.y = -8.0 * length_in_tiles # will mich hier nur kurz beschweren dass man das pivot von collisionshapes anscheinend nicht ändern kann
	sprite_2d.region_rect.size.y = 16 * length_in_tiles
	sprite_2d.offset.y = -16 * length_in_tiles
	if !has_energy:
		sprite_2d.hide()

func _process(delta: float) -> void:
	if has_energy:
		sprite_2d.show()
	else:
		sprite_2d.hide()


func turn_on():
	has_energy = true
	for body in get_overlapping_bodies():
		_on_body_entered(body)

func turn_off():
	has_energy = false
	for body in get_overlapping_bodies():
		_on_body_exited(body)


#wenn player im wind steht und er aus angeschaltet wird, bekommt er keine windorce mehr außer er verlässt den bereich
func _on_body_entered(body: Node2D) -> void: 
	if(body.is_in_group("player") and has_energy): 
		if body.has_method("set_wind_force"):
			body.set_wind_force(wind_force)


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		if body.has_method("set_wind_force"):
			body.set_wind_force(Vector2.ZERO)
