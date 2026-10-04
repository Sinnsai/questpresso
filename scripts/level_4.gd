extends Node2D

@onready var button_lightblue: Area2D = $button_lightblue
@onready var wind_lightblue: Area2D = $wind_lightblue
@onready var button_orange: Area2D = $button_orange
@onready var wind_orange: Area2D = $wind_orange
@onready var button_blue: Area2D = $button_blue
@onready var wind_blue: Area2D = $wind_blue
@onready var button_yellow: Area2D = $button_yellow
@onready var wind_yellow: Area2D = $wind_yellow
@onready var button_purple: Area2D = $button_purple
@onready var wind_purple: Area2D = $wind_purple
@onready var fusebox_bronze: Area2D = $fusebox_bronze
@onready var door_pink: Area2D = $door_pink
@onready var fusebox_pink: Area2D = $fusebox_pink
@onready var door_bronze: Area2D = $Door

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# light blue
	button_lightblue.button_pressed.connect(wind_lightblue.turn_on)
	button_lightblue.button_released.connect(wind_lightblue.turn_off)
	
	# orange
	button_orange.button_pressed.connect(wind_orange.turn_on)
	button_orange.button_released.connect(wind_orange.turn_off)
	
	# blue
	button_blue.button_pressed.connect(wind_blue.turn_on)
	button_blue.button_released.connect(wind_blue.turn_off)
	
	# yellow
	button_yellow.button_pressed.connect(wind_yellow.turn_on)
	button_yellow.button_released.connect(wind_yellow.turn_off)
	
	# pruple
	button_purple.button_pressed.connect(wind_purple.turn_on)
	button_purple.button_released.connect(wind_purple.turn_off)
	
	# bronze
	fusebox_bronze.fuse_on.connect(door_bronze.open_door)
	fusebox_bronze.fuse_off.connect(door_bronze.close_door)
	
	# pink
	fusebox_pink.fuse_on.connect(door_pink.open_door)
	fusebox_pink.fuse_off.connect(door_pink.close_door)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
