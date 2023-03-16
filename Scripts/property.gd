extends Sprite2D

var property = { _id=0, name="some name", price=1111 }

func _ready():
	updateProperty()

func setProperty(propId, propName, propPrice):
	property._id = propId
	property.name = propName
	property.price = propPrice
	updateProperty()

func updateProperty():
	$prop_name.text = property.name
	$prop_price.text = "$"+str(property.price)
