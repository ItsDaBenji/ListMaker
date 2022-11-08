extends MarginContainer

var list_button = preload("res://list_button.tscn")
@onready var list_menu = $ColorRect/MarginContainer/VBoxContainer/MarginContainer/ScrollContainer/ListMenu

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		self.visible = true

func _on_add_list_to_view_menu_visibility_changed():
	var dir:DirAccess = DirAccess.open("res://Resources/Lists")
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				pass
			else:
				var loaded_list:List = load("res://Resources/Lists/" + file_name) as List
				var new_button_instance = list_button.instantiate()
				new_button_instance.text = loaded_list.list_name
				list_menu.add_child(new_button_instance)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
