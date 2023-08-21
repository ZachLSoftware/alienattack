extends Control


func set_final_score(score):
	$Panel/Score.text = "Score: " + str(score)


func _on_retry_button_pressed():
	get_tree().reload_current_scene()
