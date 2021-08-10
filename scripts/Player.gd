extends Area2D


# Declare member variables
export var speed = 2.0
var screen_size
var targetY


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	targetY = position.y
	$AnimatedSprite.play()
	

func _input(event):
	if event is InputEventScreenTouch or event is InputEventScreenDrag:
		targetY = event.position.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var diff = targetY - position.y
	var idle_diff = 50
	if diff < -idle_diff:
		$AnimatedSprite.animation = "up"
		#print("UP")
	elif diff > idle_diff:
		$AnimatedSprite.animation = "down"
		#print("DOWN")
	else:
		$AnimatedSprite.animation = "idle"
		#print("IDLE")
	
	print(diff)


func _physics_process(delta):
	var target = Vector2(position.x, targetY)
	position = position.linear_interpolate(target, delta * speed)
	position.y = clamp(position.y, screen_size.y * 0.2, screen_size.y * 0.9)
