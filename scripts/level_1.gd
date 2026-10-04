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
@onready var door_yellow_2: StaticBody2D = $door_yellow2
@onready var button_blue: Area2D = $button_blue
@onready var wind_blue: Area2D = $wind_blue
@onready var fusebox_black: Area2D = $fusebox_black
@onready var door: Area2D = $Door
@onready var voice_line_1: AudioStreamPlayer2D = $voice_line1
@onready var start_voice: AudioStreamPlayer2D = $start_voice
@onready var musik: AudioStreamPlayer2D = $musik

var lightblue_count = 0
var voice_line = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	start_voice.play()
	musik.play()
	
	# light blue
	button_lightblue.button_pressed.connect(lightblue_plus)
	button_lightblue.button_released.connect(lightblue_minus)
	
	fusebox_lightblue.fuse_on.connect(lightblue_plus)
	fusebox_lightblue.fuse_off.connect(lightblue_minus)
	
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
	button_green.button_pressed.connect(door_green.turn_off)
	button_green.button_released.connect(door_green.turn_on)
	
	# orange
	fusebox_orange.fuse_on.connect(door_orange.turn_off)
	fusebox_orange.fuse_off.connect(door_orange.turn_on)
	
	# yellow
	fusebox_yellow.fuse_on.connect(door_yellow.turn_off)
	fusebox_yellow.fuse_off.connect(door_yellow.turn_on)
	fusebox_yellow.fuse_on.connect(door_yellow_2.turn_off)
	fusebox_yellow.fuse_off.connect(door_yellow_2.turn_on)
	
	# blue
	button_blue.button_pressed.connect(wind_blue.turn_on)
	button_blue.button_released.connect(wind_blue.turn_off)
	
	# black / door
	fusebox_black.fuse_on.connect(door.open_door)
	fusebox_black.fuse_off.connect(door.close_door)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_voice_trigger_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and voice_line:
		voice_line_1.play()
		voice_line = false

func lightblue_plus():
	lightblue_count+=1
	wind_lightblue.turn_on()
	door_lightblue.turn_on()

func lightblue_minus():
	lightblue_count-=1
	if lightblue_count == 0:
		wind_lightblue.turn_off()
		door_lightblue.turn_off()
