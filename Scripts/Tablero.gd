extends Control

var board = {
	properties = [
		{
			id = 1,
			prop_name = "Avenida Mediterranea",
			price = 60,
			pos = {
				x = 1305,
				y = 1470
			}
		},
		{
			id = 3,
			prop_name = "Avenida Baltica",
			price = 60,
			pos = {
				x = 1045,
				y = 1470
			}
		},
		{
			id = 6,
			prop_name = "Avenida Oriental",
			price = 100,
			pos = {
				x = 1305,
				y = 1470
			}
		}
	]
}

# Called when the node enters the scene tree for the first time.
func _ready():
	$c_brown_1.setProperty(1, "Avenida Mediterranea", 60)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

