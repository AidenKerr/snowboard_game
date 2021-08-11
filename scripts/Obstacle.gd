extends Area2D

var angle = 15 # in degrees?
var direction = Vector2( -cos(angle * PI / 180), -sin(angle * PI / 180))
var speed = 325

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction * delta * speed
	
	if position.x < -300:
		position = Vector2(1418, 782)
