extends Node2D
class_name TerrainManager

var count : int = 0
var terrain : Dictionary

func nearest_point(position: Vector2) -> Vector2:
	return position.snapped(Vector2(32.0,32.0))
func point_to_coord(position: Vector2) -> Vector2:
	return nearest_point(position) / 32
func coord_to_point(coord: Vector2) -> Vector2:
	return coord * 32
func add_at_position(position: Vector2, value: int, item):
	var nearest = point_to_coord(position)
	var x_item = terrain.get(nearest.x,{})
	var content = x_item.get(nearest.y,[-1,null])
	content[0] = value
	content[1] = item
	x_item[nearest.y] = content
	terrain[nearest.x] = x_item
	item.position = coord_to_point(nearest)
	print(nearest.x,",",nearest.y)

	
# Called when the node enters the scene tree for the first time.
func _ready():
	terrain = {0:{0:[-1,null]}}
	
func draw_terrain():
	for x in terrain.keys():
		for y in terrain[x].keys():
			print(x,",",y," = ",terrain[x][y])



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#if count % 200 == 0:
		#count = 0
		#draw_terrain()
	#count += 1

