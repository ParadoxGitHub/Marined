extends Node







func _on_TextureButton_pressed():
	get_tree().change_scene("LevelGeneration.tscn")


func _on_TextureButton2_pressed():
	get_tree().quit()
