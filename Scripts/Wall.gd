extends MeshInstance3D

# Wall should have a RayCast3D as a child pointed toward adjacent room
@onready var Ray: RayCast3D = $RayCast3D

# Checks if a room is adjacent and toggles wall visibility
func _physics_process(delta):
	if !visible: return
	
	if Ray.is_colliding():
		visible = false
