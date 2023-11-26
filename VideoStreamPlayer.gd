extends VideoStreamPlayer

func _ready():
	print("Jogo iniciado")

func _on_finished():
	play()

func _on_exit_button_down():
	await get_tree().create_timer(0.05).timeout
	get_tree().quit()
	print("Jogo fechado")


func _on_start_button_down():
	await get_tree().create_timer(0.05).timeout
	get_tree().change_scene_to_file("res://Level_1.tscn")
	print("Cena mudada")
