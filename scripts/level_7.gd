extends Node2D

@onready var fusebox_lightblue: Area2D = $fusebox_lightblue
@onready var wind_lightblue: Area2D = $wind_lightblue
@onready var button_purple: Area2D = $button_purple
@onready var button_purple_2: Area2D = $button_purple2
@onready var wind_purple: Area2D = $wind_purple
@onready var fusebox_pink: Area2D = $fusebox_pink
@onready var door_pink: StaticBody2D = $door_pink
@onready var fusebox_green: Area2D = $fusebox_green
@onready var door_green: Area2D = $Door
@onready var start_voice_line: AudioStreamPlayer2D = $start_voice_line

var purple_count = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#voice line 
	start_voice_line.play()
	
	
	# light blue
	fusebox_lightblue.fuse_on.connect(wind_lightblue.turn_on)
	fusebox_lightblue.fuse_off.connect(wind_lightblue.turn_off)
	
	# purple
	button_purple.button_pressed.connect(purple_pressed)
	button_purple.button_released.connect(purple_released)
	button_purple_2.button_pressed.connect(purple_pressed)
	button_purple_2.button_released.connect(purple_released)
	
	# pink
	fusebox_pink.fuse_on.connect(door_pink.turn_off)
	fusebox_pink.fuse_off.connect(door_pink.turn_on)
	
	# green
	fusebox_green.fuse_on.connect(door_green.open_door)
	fusebox_green.fuse_off.connect(door_green.close_door)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func purple_pressed():
	purple_count+=1
	wind_purple.turn_off()

func purple_released():
	purple_count-=1
	if purple_count == 0:
		wind_purple.turn_on()
