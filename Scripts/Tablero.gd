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
		},
		{
			id = 24,
			prop_name = "Avenida Ilinois",
			price = 240,
			pos = {
				x = 655,
				y = 100
			}
		},
		{
			id = 26,
			prop_name = "Avenida Atlantic",
			price = 260,
			pos = {
				x = 915,
				y = 100
			}
		},
		{
			id = 27,
			prop_name = "Avenida Ventnor",
			price = 260,
			pos = {
				x = 1045,
				y = 100
			}
		},
		{
			id = 29,
			prop_name = "Jardines Marvens",
			price = 280,
			pos = {
				x = 1305,
				y = 100
			}
		},
		{
			id = 31,
			prop_name = "Avenida Pacific",
			price = 300,
			pos = {
				x = 1470,
				y = 265
			}
		},
		{
			id = 32,
			prop_name = "Avenida Carolina Norte",
			price = 300,
			pos = {
				x = 1470,
				y = 395
			}
		},
		{
			id = 34,
			prop_name = "Avenida Pensilvania",
			price = 320,
			pos = {
				x = 1470,
				y = 655
			}
		},
		{
			id = 37,
			prop_name = "Parque Place",
			price = 350,
			pos = {
				x = 1470,
				y = 1045
			}
		},
		{
			id = 39,
			prop_name = "Paseo Maritimo",
			price = 400,
			pos = {
				x = 1470,
				y = 1305
			}
		}
	]
}

var player_turn = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	#$c_brown_1.setProperty(board.properties[0].id, board.properties[0].prop_name, board.properties[0].price)
	#$c_brown_2.setProperty(board.properties[1].id, board.properties[1].prop_name, board.properties[1].price)
	$DiceCanvas.hide()
	init_players()
	player_turn = 0
	$DiceCanvas.set_player_name($Player_1.player_name)
	$DiceCanvas.show()
	#start_player_move(0, 11)

func init_players():
	$Player_1.offset = Vector2(-35, -35)
	$Player_1.player_name = "Player 1"
	$Player_1.id = 0
	
	$Player_2.offset = Vector2(35, 35)
	$Player_2.player_name = "Player 2"
	$Player_2.id = 1
	
	$Player_3.offset = Vector2(-35, 35)
	$Player_3.player_name = "Player 3"
	$Player_3.id = 2
	
	$Player_4.offset = Vector2(35, -35)
	$Player_4.player_name = "Player 4"
	$Player_4.id = 3


## Genera un array de posiciones segun la posicion actual
## y la tirada de dados para iniciar el movimiento del jugador
func start_player_move(idPlayer, dices):
	var player = get_player_by_id(idPlayer)
	var skip = player.currentBox + dices # se obtiene la casilla destino
	var targets = Array()
	# Se carga un vector con las posiciones de las casillas por las que debe 
	# pasar el jugador actual
	for i in range(player.currentBox, skip):
		var next = i + 1
		if next > 39:
			next = next - 39
		var box = get_child(next)
		targets.append(box.position)
	# Se pasa el vector al player para que inicie el recorrido
	player.set_targets(targets)


## Obtiene un player segun su id
func get_player_by_id(id):
	if id < 0 || id > 3:
		pass
	var players = [$Player_1, $Player_2, $Player_3, $Player_4]
	return players[id]

func set_next_turn():
	player_turn += 1
	if player_turn > 3:
		player_turn = 0
	$DiceCanvas.set_player_name(get_player_by_id(player_turn).player_name)
	$DiceCanvas.show()

func _on_dice_canvas_dice_ready(d1, d2):
	var dice_result = d1 + d2
	get_player_by_id(player_turn).set_new_box(dice_result)
	start_player_move(player_turn, dice_result)
	#$DiceCanvas.hide()
	#set_next_turn()
