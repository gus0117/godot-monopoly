extends CharacterBody2D

signal isArrived

@export var currentBox: int
@export var targetBox: int
@export var offset: Vector2
@export var arrived: bool
@export var targets: Array
var index
const SPEED = 400.0
var target = Vector2(0, 0)
var enabledMove = false

func _ready():
	arrived = false
	index = 0

func set_target(newTarget):
	target = newTarget + offset
	arrived = true

## Se recibe una lista de posiciones
func set_targets(newTargets):
	if !enabledMove:
		enabledMove = true
	targets.clear()
	targets = newTargets.duplicate()
	index = 0
	set_target(targets[index])

func _physics_process(delta):
	velocity = position.direction_to(target) * SPEED
	if position.distance_to(target) > 10 && enabledMove:
		move_and_slide()
	elif arrived:
		$Timer.start()
		arrived = false


func _on_timer_timeout():
	index += 1
	if index < targets.size():
		set_target(targets[index])
	else:
		emit_signal("isArrived") #Se notifica al tablero que se termino el recorrido
