extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Left.text = str(InputMap.action_get_events("left")[0].as_text())
	$Right.text = str(InputMap.action_get_events("right")[0].as_text())
	$Jump.text = str(InputMap.action_get_events("jump")[0].as_text())
	$Interact.text = str(InputMap.action_get_events("interact")[0].as_text())
	$Pause.text = str(InputMap.action_get_events("pause")[0].as_text())
	
	
