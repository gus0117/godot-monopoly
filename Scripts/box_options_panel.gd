extends CanvasLayer

@export_file("*.json") var data_url
var db
var current_player = { 
	id=1,
	name="Player_1",
	cash=200,
	properties_id=[]
}

var add_properties = Array()

func load_data():
	var file = FileAccess.open(data_url, FileAccess.READ)
	var file_as_text = file.get_as_text()
	var response = JSON.parse_string(file_as_text)
	if response == null:
		print("Error al cargar")
	file.close()
	return response

func _ready():
	db = load_data()
	var p = get_property_by_id(1)
	check_prop_type(p)

func get_property_by_id(id):
	if id < 0 || id > 39:
		pass
	var prop = db.data[id]
	if prop == null:
		print("No se encontro propiedad")
	return prop

func check_prop_type(prop):
	match prop.type:
		"PROPERTY": print("Propiedad")
		"COMPANY": print("Company")
		"CHEST": print("Chest")
		"CORNER_GO": print("Corner_go")
		"INCOME_TAX": print("Income_tax")
		"TRAIN": print("Train")
		"JAIL": print("Jail")
		"PARKING": print("Free_Parking")
		"POLICE": print("Police")
		_: print("Type not found")

func propertyCase(prop):
	#Calcular saldo en cuenta y saldo de propiedades
	#Comprobar si la prop tiene dueño
	pass

#Pagar la renta, mientras se tenga dinero
func pay_rent():
	print("Pagar renta")

#Adquirir la propiedad por un player
func buy_propierty(prop, id_player):
	print("Comprar")
