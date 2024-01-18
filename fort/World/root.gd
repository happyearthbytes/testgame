extends Node
class_name Root

var id : ID = ID.new("x","root")
var game : Game

func _ready():
	game = Game.new(id,Args.new())

class Args extends VariantArgs:
	const __name = "GameArgs"
	func _init(): pass
