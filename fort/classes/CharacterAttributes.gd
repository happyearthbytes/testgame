extends Node
class_name CharacterAttributes

enum CharacterType {PLAYER,BOT,UNDEFINED}

signal new_speed(speed: float)
signal new_texture(texture: Texture2D)
signal new_shape(shape: Shape2D)
signal new_area_shape(shape: Shape2D)

@export var character_type : CharacterType = CharacterType.UNDEFINED

@export var area_shape : CircleShape2D:
	set(area_shape_in):
		area_shape = area_shape_in
		new_area_shape.emit(area_shape)

@export var speed : float = 0.0:
	set(speed_in):
		speed = speed_in
		new_speed.emit(speed)
		
@export var texture : Texture2D = ImageTexture.create_from_image(Image.load_from_file("res://icon.svg")):
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

