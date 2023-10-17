extends Area2D

signal coin_collected


# Animation for the coin
func _ready():
	$AnimationPlayer.play("idle")

# Function for when the player enters the coin and signals the HUD.
# 
func _on_body_entered(body):
	if body.name == "Player":
		Global.coins_collected += 1
		coin_collected.emit()
		$"Gem _Collected".play() 
		hide()

 
func _on_gem__collected_finished():
	queue_free() 
