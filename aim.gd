extends Sprite2D

@onready var LIMIT_N = $"../LoopholeCover/Block1".position.x + $"../LoopholeCover/Block1".size.x
@onready var LIMIT_P = $"../LoopholeCover/Block2".position.x

func _process(delta):
#	 Controller support
	var mouse_move = Input.get_vector("mouse_left","mouse_right","mouse_up","mouse_down")
	if mouse_move:
		get_viewport().warp_mouse(position+mouse_move*0.25/delta)
	if Input.is_action_just_pressed("shoot") and Status.aiming:
		var press = InputEventMouseButton.new()
		press.position = position
		press.pressed = true
		Input.parse_input_event(press)
	
	if Status.aiming:
		position = get_viewport().get_mouse_position()
		position.x = clamp(position.x, LIMIT_N, LIMIT_P)
		if Status.level == 0:
			var n = str(Status.kills)
			$"../Counters/Level".text = "0".repeat(6-len(n)) + n

func _input(event):
	if event is InputEventMouseButton and event.pressed and Status.aiming and LIMIT_N < event.position.x and event.position.x < LIMIT_P:
		if Status.bullets > 0:
			$"../AnimationPlayer".play("fire")
			Status.shot = true
			Status.bullets -= 1
			$"../Counters/Bullets".text = str(Status.bullets) + '/' + str(Status.BULLET_MAX)
		else:
			Status.shot = false
