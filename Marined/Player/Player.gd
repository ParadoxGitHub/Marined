extends KinematicBody2D

const ACCELERATION = 3000
const MAXSPEED = 480
const FRICTION = 9999999999

enum {
	MOVE,
	ROLL,
	ATTACK
}

var state = MOVE
var velocity = Vector2.ZERO

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

func _ready():
	animationTree.active = true

func _process(delta):
	match state:
		MOVE:
			moveState(delta)
		
		ROLL:
			pass
		
		ATTACK:
			pass

func moveState(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("Move right") - Input.get_action_strength("Move left")
	input_vector.y = Input.get_action_strength("Move down") - Input.get_action_strength("Move up")
	
	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationTree.set("parameters/Attack/blend_position", input_vector)
		animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * MAXSPEED, ACCELERATION * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	velocity = move_and_slide(velocity)


func _on_Camera_draw():
	pass # Replace with function body.
