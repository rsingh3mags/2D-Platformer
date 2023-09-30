extends Area2D

signal coin_collected

func _on_body_entered(body):
	if body.name == "Player":
		Global.coins_collected += 1
		coin_collected.emit()
		queue_free() 
 
