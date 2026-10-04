extends Node2D
@onready var kuchen_line: AudioStreamPlayer2D = $kuchen_line
@onready var music: AudioStreamPlayer2D = $music


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	kuchen_line.play()
	music.play()
	await get_tree().create_timer(22).timeout
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
