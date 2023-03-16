extends KinematicBody2D

var velocitat := 100
var moviment := Vector2.ZERO
var gravetat := Vector2.DOWN * 500
var direccio := Vector2.ZERO
var salt := 400
# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(25, 255)
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	moviment.x = 0
	direccio.x = 0
	if Input.is_action_pressed("ui_right"):
		direccio += Vector2.RIGHT
		
	if Input.is_action_pressed("ui_left"):
		direccio += Vector2.LEFT
		
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		
		moviment.y = -salt
	moviment += direccio.normalized() * velocitat
	moviment += gravetat * delta
	moviment = move_and_slide(moviment, Vector2.UP)


func _on_LAVA_body_entered(body):
	
	position = Vector2(25, 255)
