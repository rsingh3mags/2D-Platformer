extends Area2D

signal coin_collected

func _on_body_entered(body):
	if body.name == "Player":
		Global.coins_collected += 1
		coin_collected.emit()
		$"Gem _Collected".play()
		hide()

 
func _on_gem__collected_finished():
	queue_free() 
