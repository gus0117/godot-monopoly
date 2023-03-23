extends CanvasLayer

signal dice_ready(d1, d2)
var player_name: String

func _on_button_pressed():
	$TextureRect.hide()
	$dice.play()
	$dice2.play()
	$Timer.start()
	$TextureRect/Button.disabled = true

func _on_timer_timeout():
	$Timer.stop()
	var dice1 = randi_range(0, 5)
	var dice2 = randi_range(0, 5)
	$dice.pause()
	$dice2.pause()
	$dice.set_frame(dice1)
	$dice2.set_frame(dice2)
	emit_signal("dice_ready", dice1 + 1, dice2 + 1)

func set_next_turn():
	var p = GameStats.get_current_player()
	$TextureRect/Label.text = "Turno del jugador " + p.player_name
	$TextureRect.show()
	$TextureRect/Button.disabled = false
