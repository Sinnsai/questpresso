extends Node2D

@onready var button_lightblue: Area2D = $button_lightblue
@onready var fusebox_lightblue: Area2D = $fusebox_lightblue
@onready var wind_lightblue: Area2D = $wind_lightblue
@onready var door_lightblue: StaticBody2D = $door_lightblue
@onready var button_pink: Area2D = $button_pink
@onready var fusebox_pink: Area2D = $fusebox_pink
@onready var fusebox_pink_2: Area2D = $fusebox_pink2
@onready var wind_pink: Area2D = $wind_pink
@onready var door_pink: StaticBody2D = $door_pink
@onready var button_green: Area2D = $button_green
@onready var door_green: StaticBody2D = $door_green
@onready var fusebox_orange: Area2D = $fusebox_orange
@onready var door_orange: StaticBody2D = $door_orange
@onready var fusebox_yellow: Area2D = $fusebox_yellow
@onready var door_yellow: StaticBody2D = $door_yellow
@onready var button_blue: Area2D = $button_blue
@onready var wind_blue: Area2D = $wind_blue


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# light blue
	button_lightblue.button_pressed.connect(wind_lightblue.turn_on)
	button_lightblue.button_released.connect(wind_lightblue.turn_off)
	button_lightblue.button_pressed.connect(door_lightblue.turn_on)
	button_lightblue.button_released.connect(door_lightblue.turn_off)
	button_lightblue.button_pressed.connect(fusebox_lightblue.turn_on)
	button_lightblue.button_released.connect(fusebox_lightblue.turn_off)
	
	fusebox_lightblue.fuse_on.connect(wind_lightblue.turn_on)
	fusebox_lightblue.fuse_off.connect(wind_lightblue.turn_off)
	fusebox_lightblue.fuse_on.connect(door_lightblue.turn_on)
	fusebox_lightblue.fuse_off.connect(door_lightblue.turn_off)
	
	# pink
	fusebox_pink.fuse_on.connect(wind_pink.turn_on)
	fusebox_pink.fuse_off.connect(wind_pink.turn_off)
	fusebox_pink.fuse_on.connect(door_pink.turn_on)
	fusebox_pink.fuse_off.connect(door_pink.turn_off)
	fusebox_pink.fuse_on.connect(fusebox_pink_2.turn_on)
	fusebox_pink.fuse_off.connect(fusebox_pink_2.turn_off)
	fusebox_pink_2.fuse_on.connect(wind_pink.turn_on)
	fusebox_pink_2.fuse_off.connect(wind_pink.turn_off)
	fusebox_pink_2.fuse_on.connect(door_pink.turn_on)
	fusebox_pink_2.fuse_off.connect(door_pink.turn_off)
	fusebox_pink_2.fuse_on.connect(fusebox_pink_2.turn_on)
	fusebox_pink_2.fuse_off.connect(fusebox_pink_2.turn_off)
	
	# green
	button_green.button_pressed.connect(door_green.turn_on)
	button_green.button_released.connect(door_green.turn_off)
	
	# orange
	fusebox_orange.fuse_on.connect(door_orange.turn_on)
	fusebox_orange.fuse_off.connect(door_orange.turn_off)
	
	# yellow
	fusebox_yellow.fuse_on.connect(door_yellow.turn_on)
	fusebox_yellow.fuse_off.connect(door_yellow.turn_off)
	
	# blue
	button_blue.button_pressed.connect(wind_blue.turn_on)
	button_blue.button_released.connect(wind_blue.turn_off)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
