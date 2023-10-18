extends ParallaxBackground

# Paralax background speed
var scroll_speed = 100

#Scroll speed of the parallax background
func _process(delta):
	scroll_offset.x -= scroll_speed * delta
