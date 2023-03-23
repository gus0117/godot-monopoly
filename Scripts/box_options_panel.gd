extends CanvasLayer

@export_file("*.json") var data_url
var db

func _ready():
	#var p = GameStats.get_property_by_id(1)
	#check_prop_type(p)
	pass

# Logic functions
func get_property_by_id(id):
	if id < 0 || id > 39:
		pass
	var prop = db.data[id]
	if prop == null:
		print("No se encontro propiedad")
	return prop

func check_prop_type(prop):
	#Comprobar tipo de propiedad
	match prop.type:
		"PROPERTY": property_case(prop)
		"COMPANY": print("Company")
		"CHEST": print("Chest")
		"CORNER_GO": print("Corner_go")
		"INCOME_TAX": print("Income_tax")
		"TRAIN": print("Train")
		"JAIL": print("Jail")
		"PARKING": print("Free_Parking")
		"POLICE": print("Police")
		_: print("Type not found")

func ui_buy_property_case(prop):
	$prop_data/prop_name.text = prop.name
	$prop_data/prop_price.text = "$"+str(prop.price)
	$btn_buy.show()
	$btn_auction.show()
	$btn_done.hide()
	$btn_end_turn.hide()
	$message.hide()
	var p = GameStats.get_current_player()
	if p.cash <= prop.price:
		print(p.cash)
		$btn_buy.disabled = true



#El jugador de turno realiza la compra de una propiedad (No inlcuido tren o companias)
func property_case(prop):
	#Calcular saldo en cuenta y saldo de propiedades
	var p = GameStats.get_current_player()
	var balance = p.cash
	var balance_prop = GameStats.get_avaible_money_player(p.id)
	#Comprobar si la prop tiene dueño
	if prop.occuped == true:
		var rent = GameStats.get_prop_rent(prop)
		if balance_prop + balance >= rent:
			print("Pagar renta") #Se paga la renta de una prop
		else:
			print("Game Over") #Se pierde el juego
	else:
		#Comprar propiedad
		ui_buy_property_case(prop)
		#GameStats.buy_prop(prop)


func _on_btn_buy_pressed():
	$btn_buy.hide()
	$btn_auction.hide()
	$message.text = "Compra exitosa"
	$message.show()
	$btn_done.show()
	#Devolver el control a board
