extends Node3D

@onready var ForwardRay: RayCast3D = $"Forward Ray"
@onready var BackwardsRay: RayCast3D = $"Backwards Ray"
@onready var LeftRay: RayCast3D = $"Left Ray"
@onready var RightRay: RayCast3D = $"Right Ray"


@export var Duration: float

var _tween
var _animating = false

func _physics_process(delta):
	if _animating: return
	
	if Input.is_action_pressed("forward"):
		move_character(-global_transform.basis.z, ForwardRay)
	elif Input.is_action_pressed("strafe_left"):
		move_character(-global_transform.basis.x, LeftRay)
	elif Input.is_action_pressed("strafe_right"):
		move_character(global_transform.basis.x, RightRay)
	elif Input.is_action_pressed("backwards"):
		move_character(global_transform.basis.z, BackwardsRay)
	elif Input.is_action_pressed("rotate_left"):
		rotate_character(PI/2)
	elif Input.is_action_pressed("rotate_right"):
		rotate_character(-PI/2)	
		
func move_character(direction, ray):
	if !ray.is_colliding(): return
	
	_animating = true
	_tween = get_tree().create_tween()
	_tween.tween_property(self, "position", position + direction, Duration)
	_tween.connect("finished", tween_finished)
	
func rotate_character(change):
	_animating = true
	_tween = get_tree().create_tween()
	_tween.tween_property(self, "rotation", rotation + Vector3(0, change, 0), Duration)
	_tween.connect("finished", tween_finished)
	
func tween_finished():
	_animating = false
