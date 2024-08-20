extends Interactive

var tcount = 0

func act():
	$Timer.start()
	$"../../CanvasLayer".show()
	get_tree().paused = true
	stats_random()

func stats_random():
	Status.player.get_node('CanvasLayer/Counters/Bullets').text = ''
	for i in range(12):
		Status.player.get_node('CanvasLayer/Counters/Bullets').text+= '0123456789ABCDEF'[randi()%16]
	Status.player.get_node('CanvasLayer/Counters/Level').text = ''
	for i in range(12):
		Status.player.get_node('CanvasLayer/Counters/Level').text+= '0123456789ABCDEF'[randi()%16]

func _on_timer_timeout():
	tcount += 1
	stats_random()
	var p = TextureRect.new()
	p.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	p.texture = preload("res://panels/trueend.png")
	p.position = Vector2((tcount*15)%1000,(tcount*15)%650)
	$"../../CanvasLayer".add_child(p)
	if tcount > 80:
		var file = FileAccess.open("user://save.txt", FileAccess.WRITE)
		file.store_string("0\n0\n0\n0\n-1")
		file.close()
		print('IT HURTS\n'.repeat(8))
		get_tree().quit(8008135)
