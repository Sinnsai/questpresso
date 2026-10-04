extends Node2D

@onready var fusebox_green: Area2D = $fusebox_green
@onready var wind_green: Area2D = $wind_green
@onready var button_purple: Area2D = $button_purple
@onready var door_purple: StaticBody2D = $door_purple
@onready var wind_purple: Area2D = $wind_purple
@onready var button_lightblue: Area2D = $button_lightblue
@onready var button_lightblue_2: Area2D = $button_lightblue2
@onready var wind_lightblue: Area2D = $wind_lightblue
@onready var fusebox_yellow: Area2D = $fusebox_yellow
@onready var exit_yellow: Area2D = $exit_yellow

var lightblue_count = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# green
	fusebox_green.fuse_on.connect(wind_green.turn_off)
	fusebox_green.fuse_off.connect(wind_green.turn_on)
	
	# purple
	button_purple.button_pressed.connect(wind_purple.turn_on)
	button_purple.button_released.connect(wind_purple.turn_off)
	button_purple.button_pressed.connect(door_purple.turn_off)
	button_purple.button_released.connect(door_purple.turn_on)
	
	# light blue
	button_lightblue.button_pressed.connect(lightblue_plus)
	button_lightblue.button_released.connect(lightblue_minus)
	button_lightblue_2.button_pressed.connect(lightblue_plus)
	button_lightblue_2.button_released.connect(lightblue_minus)
	
	# yellow
	fusebox_yellow.fuse_on.connect(exit_yellow.open_door)
	fusebox_yellow.fuse_off.connect(exit_yellow.close_door)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func lightblue_plus():
	lightblue_count+=1
	wind_lightblue.turn_off()

func lightblue_minus():
	lightblue_count-=1
	if lightblue_count == 0:
		wind_lightblue.turn_on()
