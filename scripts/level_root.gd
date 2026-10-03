extends Node2D
@onready var fusebox: Area2D = $fusebox
@onready var door: Area2D = $Door
@onready var wind: Area2D = $wind
@onready var light: PointLight2D = $light


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fusebox.fuse_off.connect(door.open_door)
	fusebox.fuse_on.connect(door.close_door)
	fusebox.fuse_off.connect(wind.turn_on)
	fusebox.fuse_on.connect(wind.turn_on)
	fusebox.fuse_off.connect(light.turn_on)
	fusebox.fuse_on.connect(light.turn_off)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
