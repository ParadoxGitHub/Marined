extends Node







func _on_TextureButton_pressed():
	get_tree().change_scene("World.tscn")


func _on_TextureButton2_pressed():
	get_tree().quit()
