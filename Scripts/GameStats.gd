extends Node
@export_file("*.json") var data_url
var db
var players = [
	{
		id=0,
		player_name= "Player_1",
		cash=200,
		properties=[]
	},
	{
		id=1,
		player_name= "Player_2",
		cash=0,
		properties=[]
	},
	{
		id=2,
		player_name= "Player_3",
		cash=0,
		properties=[]
	},
	{
		id=3,
		player_name= "Player_4",
		cash=0,
		properties=[]
	}
]

var player_turn = 0 # ID del jugador que esta de turno

func _ready():
	db = load_data()
	#var p = GameStats.get_property_by_id(1)
	#print(p.name)

func load_data():
	var file = FileAccess.open("res://Data/monopoly_db.json", FileAccess.READ)
	var file_as_text = file.get_as_text()
	var response = JSON.parse_string(file_as_text)
	if response == null:
		print("Error al cargar")
	file.close()
	return response

func get_property_by_id(id):
	if id < 0 || id > 39:
		pass
	var prop = db.data[id]
	if prop == null:
		print("No se encontro propiedad")
	return prop

#Obtiene el dinero disponible si vendiera las propiedades
func get_avaible_money_player(id):
	var props_value = 0
	for i in players[id].properties.size():
		var prop = players[id].properties[i]
		props_value += prop.mortgage + prop.amount_houses * prop.house_price
	return props_value

# Realiza la operacion de compra, suponiendo que se tiene el dinero y la prop no tiene dueño
func buy_prop(prop):
	prop.owner_id = player_turn #se le asigna la id del dueño
	players[player_turn].cash -= prop.price #Se descuenta el costo de la prop
	players[player_turn].properties.append(prop) #Se agrega la prop a la lista del jugador
	prop.occuped = true

func get_current_player():
	return players[player_turn]

func get_prop_rent(prop):
	var rent = 0
	#Hay q comprobar que tipo de propiedad es?
	match prop.amount_houses:
		0: rent += prop.rent
		1: rent += prop.house_1
		2: rent += prop.house_2
		3: rent += prop.house_3
		4: rent += prop.house_4
		5: rent += prop.hotel
	return rent

func set_next_turn():
	player_turn += 1
	if player_turn > 3:
		player_turn = 0
