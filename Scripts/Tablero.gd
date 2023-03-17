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
		},
		{
			id = 8,
			prop_name = "Avenida Vermont",
			price = 100,
			pos = {
				x = 395,
				y = 1470
			}
		},
		{
			id = 9,
			prop_name = "Avenida Connecticut",
			price = 120,
			pos = {
				x = 265,
				y = 1470
			}
		},
		{
			id = 11,
			prop_name = "Plaza San Carlos",
			price = 140,
			pos = {
				x = 100,
				y = 1305
			}
		},
		{
			id = 13,
			prop_name = "Avenida States",
			price = 140,
			pos = {
				x = 100,
				y = 1045
			}
		},
		{
			id = 14,
			prop_name = "Avenida Virginia",
			price = 160,
			pos = {
				x = 100,
				y = 915
			}
		},
		{
			id = 16,
			prop_name = "Plaza San James",
			price = 180,
			pos = {
				x = 100,
				y = 655
			}
		},
		{
			id = 18,
			prop_name = "Avenida Tennessee",
			price = 180,
			pos = {
				x = 100,
				y = 395
			}
		},
		{
			id = 19,
			prop_name = "Avenida Nueva York",
			price = 200,
			pos = {
				x = 100,
				y = 265
			}
		},
		{
			id = 21,
			prop_name = "Avenida Kenedi",
			price = 220,
			pos = {
				x = 265,
				y = 100
			}
		},
		{
			id = 23,
			prop_name = "Avenida Indiana",
			price = 220,
			pos = {
				x = 525,
				y = 100
			}
		}
	]
}

# Called when the node enters the scene tree for the first time.
func _ready():
	$c_brown_1.setProperty(board.properties[0].id, board.properties[0].prop_name, board.properties[0].price)
	$c_brown_2.setProperty(board.properties[1].id, board.properties[1].prop_name, board.properties[1].price)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

