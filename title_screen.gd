extends Control


func _ready():
	if not Status.in_menu: return
	show()
	if Status.level == 0:
		$TextureRect.material = null
		$Play.show()
		$Left.show()
		$Right.show()
		$HBoxContainer.hide()
		var n = str(Status.high_score)
		$Counters/Level.text = "0".repeat(6-len(n)) + n


func _on_left_pressed():
	changeHat("left")


func _on_right_pressed():
	changeHat("right")

func begin():
	hide()
	Status.in_menu = false
	Status.player.show_starting_text()
	self.queue_free()
	
func changeHat(direction):
	$"../HatSound".play()
	if direction == "left":
		Status.hat -= 1
		if Status.hat < 0: Status.hat = Status.HATS_MAX-1
	elif direction == "right":
		Status.hat = (Status.hat+1)%Status.HATS_MAX
	Status.player.load_hat()
		
func _input(event):
	if Input.is_action_just_pressed("pad_right"):
		changeHat("right")
	elif Input.is_action_just_pressed("pad_left"):
		changeHat("left")
	if Input.is_action_just_pressed("jump"):
		begin()
	
