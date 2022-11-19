extends MarginContainer

#@onready var animation_player : AnimationPlayer = $AnimationPlayer
var offscreen_pos : int = -155
var onscreen_pos : int = 397

func _on_button_pressed():
	var new_collection : Collection = Collection.new()
	new_collection.collection_name = "Test Collection"

func _on_button_2_pressed():
	var test_list:List = List.new()
	test_list.list_name = "Test List"
	ResourceSaver.save(test_list, "res://Resources/Lists/NewListItem.tres")
	var dir : DirAccess = DirAccess.open("res://Resources/Lists")
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				print("Found file: " + file_name)
			file_name = dir.get_next()
	else:
		print("Error, no directory found")
	


func _on_create_new_list_pressed():
	#animation_player.play("MoveIn")
	var tween = create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "position", Vector2(46, onscreen_pos), 0.3)
