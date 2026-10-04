extends Node2D
@onready var blocking_door: StaticBody2D = $blocking_door
@onready var button: Area2D = $button
@onready var wind: Area2D = $wind
@onready var wind_2: Area2D = $wind2
@onready var wind_3: Area2D = $wind3
@onready var fusebox: Area2D = $fusebox
@onready var fusebox_2: Area2D = $fusebox2
@onready var door: Area2D = $Door
@onready var blocking_door_2: StaticBody2D = $blocking_door2
@onready var light_3: PointLight2D = $light3
@onready var light_2: PointLight2D = $light2
@onready var light: PointLight2D = $light
@onready var voice: AudioStreamPlayer2D = $voice
@onready var trigger_voiceline: Area2D = $trigger_voiceline

var first_event = true
var voice_line = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	light_2.turn_off()
	light_3.turn_off()
	button.button_pressed.connect(wind.turn_on)
	button.button_pressed.connect(wind_2.turn_on)
	button.button_pressed.connect(wind_3.turn_on)
	button.button_released.connect(wind.turn_off)
	button.button_released.connect(wind_2.turn_off)
	button.button_released.connect(wind_3.turn_off)
	fusebox.fuse_on.connect(blocking_door.turn_on)
	fusebox.fuse_on.connect(first_trigger)
	fusebox.fuse_off.connect(blocking_door.turn_off)
	fusebox_2.fuse_on.connect(blocking_door.turn_on)
	fusebox_2.fuse_off.connect(blocking_door.turn_off)
	fusebox_2.fuse_on.connect(door.open_door)
	fusebox_2.fuse_off.connect(door.close_door)
	fusebox_2.fuse_on.connect(blocking_door_2.turn_off)
	fusebox_2.fuse_off.connect(blocking_door_2.turn_on)
	fusebox.fuse_on.connect(blocking_door_2.turn_off)
	fusebox.fuse_off.connect(blocking_door_2.turn_on)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func first_trigger() -> void:
	if first_event:
		light_2.turn_on()
		light_3.turn_on()
		light.turn_off()
		first_event = false


func _on_trigger_voiceline_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and voice_line:
		voice.play()
		voice_line = false
