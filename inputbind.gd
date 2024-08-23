extends TextureButton

@export var inputName : StringName
var oldInput : InputEvent

# Called when the node enters the scene tree for the first time.
func _ready():
	self.pressed.connect(_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _pressed():
	if not Status.is_choosing:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		Status.is_choosing = true
		oldInput = InputMap.action_get_events(inputName)[0]
		
func _unhandled_key_input(event):
	if Status.is_choosing:
		InputMap.action_add_event(
			inputName,
			event,
		)
		InputMap.action_erase_event(
			inputName,
			oldInput,
		)
		Status.is_choosing = false
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		

		
		
	
