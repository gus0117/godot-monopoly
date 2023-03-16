extends Control

#Sprites path
@export_subgroup("Property Textures")
@export_global_file("*.png") var sprite_go
@export_global_file("*.png") var sprite_brown
@export_global_file("*.png") var sprite_blue_light
@export_global_file("*.png") var sprite_purple
@export_global_file("*.png") var sprite_orange
@export_global_file("*.png") var sprite_red
@export_global_file("*.png") var sprite_yellow
@export_global_file("*.png") var sprite_green
@export_global_file("*.png") var sprite_blue



# Called when the node enters the scene tree for the first time.
func _ready():
	var newSprite = Sprite2D.new()
	newSprite.texture = load(sprite_go)
	add_child(newSprite)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
