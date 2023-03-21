extends CanvasLayer

signal dice_ready(d1, d2)
var player_name: String

func set_player_name(p_name):
	player_name = p_name
	$Label.text = "Turno del Jugador " + p_name
	$Button.disabled = false

func _on_button_pressed():
	$dice.play()
	$dice2.play()
	$Timer.start()
	$Button.disabled = true

func _on_timer_timeout():
	$Timer.stop()
	var dice1 = randi_range(0, 5)
	var dice2 = randi_range(0, 5)
	$dice.pause()
	$dice2.pause()
	$dice.set_frame(dice1)
	$dice2.set_frame(dice2)
	emit_signal("dice_ready", dice1 + 1, dice2 + 1)
