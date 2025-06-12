extends Node3D

var timer : Timer
var count : int = 0
@onready var book = preload("res://assets/book_vrar_collision.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	timer = Timer.new()
	timer.one_shot = true
	add_child(timer)
	
	timer.timeout.connect(self.spawn_book)
	
	spawn_book()
	
func spawn_book():
	var node = book.instantiate()
	node.rotate_x(randf_range(0.0,PI))
	node.rotate_y(randf_range(0.0,PI))
	node.rotate_z(randf_range(0.0,PI))
	
	add_child(node)
	count += 1
	
	if count < 10:
		timer.start(0.7)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
