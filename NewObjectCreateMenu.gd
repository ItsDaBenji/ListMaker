extends MarginContainer




func _on_button_2_pressed():
	var test_list:List = List.new()
	test_list.list_name = "Test List"
	ResourceSaver.save(test_list, "res://Resources/Lists/NewListItem.tres")
