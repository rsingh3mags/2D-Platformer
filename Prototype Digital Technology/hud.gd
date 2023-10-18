extends CanvasLayer 
# All the variables needed to make the timer.
var time: float = 0.0
var minutes: int = 0
var seconds: int =0
var msec: int = 0

# show what level the player is on in the HUD
func level(num):
	$CurrentLevel.text = " " + str(num)
	
# show the amount of coins that the PLayer has collected
func coins(num):
	$Coins.text = " " + str(num)

# All the code that is needed for the timer to work
func _process(delta) -> void:
	$fps.text = "FPS: " + str(Engine.get_frames_per_second())
	time += delta
	msec = fmod(time, 1) * 100
	seconds = fmod(time, 60)
	minutes = fmod(time, 3600) / 60
	$Minutes.text = "%02d:" % minutes
	$Seconds.text = "%02d." % seconds
	$Msecs.text = "%03d" % msec

# code on how the timer is formatted inside of the labels/ HUD
func get_time_formatted() -> String:
	return "%02d:%02d.%03d" % [minutes, seconds, msec]
	
# function to stop the code
func stop() -> void:
	set_process(false)
	
