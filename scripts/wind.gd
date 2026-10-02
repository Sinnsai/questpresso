extends Area2D

@export_range(1,10,1) var length_in_tiles: int
@export var wind_force: Vector2 = Vector2(200, 0)
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

var has_energy = false


func _ready() -> void:
	collision_shape_2d.scale.y = length_in_tiles
	collision_shape_2d.position.y = -8.0 * length_in_tiles # will mich hier nur kurz beschweren dass man das pivot von collisionshapes anscheinend nicht ändern kann
	animated_sprite_2d.position.y = -16 * length_in_tiles
	if !has_energy:
		animated_sprite_2d.hide()

func _process(delta: float) -> void:
	if has_energy:
		animated_sprite_2d.show() #vielleicht ist eine disapear animation besser
		match length_in_tiles:
			1: animated_sprite_2d.play("1")
			2: animated_sprite_2d.play("2")
			3: animated_sprite_2d.play("3")
			4: animated_sprite_2d.play("4")
			5: animated_sprite_2d.play("5")
	else:
		animated_sprite_2d.hide() 

func turn_on():
	has_energy = !has_energy

func _on_body_entered(body: Node2D) -> void:
	if((body.is_in_group("player") or body.is_in_group("player2")) and has_energy): #player zwei bekommt keine wind force, wiesoooo ? 
		if body.has_method("set_wind_force"):
			body.set_wind_force(wind_force)


func _on_body_exited(body: Node2D) -> void:
	if (body.is_in_group("player") or body.is_in_group("player2")):
		if body.has_method("set_wind_force"):
			body.set_wind_force(Vector2.ZERO)
