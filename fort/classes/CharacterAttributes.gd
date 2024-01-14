extends Node
class_name CharacterAttributes

signal new_speed(speed: float)
signal new_texture(texture: Texture2D)
signal new_shape(shape: Shape2D)

@export var speed : float = 0.0:
	set(speed_in):
		speed = speed_in
		new_speed.emit(speed)
		
@export var texture : Texture2D:
	set(texture_in):
		texture = texture_in
		new_texture.emit(texture)

@export var shape : Shape2D:
	set(shape_in):
		shape = shape_in
		new_shape.emit(shape)

func update():
	speed = speed
	texture = texture
	shape = shape

