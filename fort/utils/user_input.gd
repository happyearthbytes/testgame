extends Node
class_name UserInput

var e : Event = Event.new()
var enable_pos : bool = false
enum Click {
	N = 0,
	L = 1,
	R = 2,
	M = 3,
	U = 4,
	D = 5,
	ML = 6,
	MR = 7,
	B = 8,
	F = 9,
}
var num_clicks : int = len(Click.keys())

func _input(event):
	e = get_event(event)
	if e.updated:
		pass
		#print(e)

func get_event(event) -> Event:
	e.updated = true
	if event is InputEventFromWindow:
		if event is InputEventMouseMotion:
			e.index = 0
		elif event is InputEventScreenTouch:
			e.index = event.index
			e.data[e.index].double_click = event.double_tap
		elif event is InputEventMouseButton:
			e.index = event.button_index
			e.data[e.index].double_click = event.double_click
		elif event is InputEventScreenDrag:
			e.index = event.index
		elif event is InputEventPanGesture:
			pass
		else:
			e.updated = false
	if e.updated:
		e.last_event = event
		e.data[e.index].position = event.position
		e.data[e.index].pressed = event.is_pressed()
	return e

class Data:
	var click: Click
	var position: Vector2
	var double_click: bool
	var pressed: bool
	func _init(idx: int):
		reset()
		click = idx
	func reset():
		position = Vector2.ZERO
		double_click = false
		pressed = false
	func _to_string():
		return "%s %v %s %s" % [Click.keys()[click], position, double_click, pressed]

class Event:
	func last():
		return data[index]
	var data: Array[Data]
	var updated: bool
	var last_event: InputEventFromWindow
	var index: int = 0
	func _init():
		var num_clicks : int = len(Click.keys())
		for i in range(num_clicks):
			data.append(Data.new(i))
		reset()
	func reset():
		for i in range(len(data)):
			data[i].reset()
		updated = false
		index = 0
	func _to_string():
		var istr : String = ""
		for i in range(len(data)):
			istr += "%s[%s]\n" % [Click.keys()[i], data[i]]
		var idxstr : String
		if index < len(Click.keys()):
			idxstr = Click.keys()[index]
		else:
			idxstr = str(index)
		return "%s%s %s" % [istr, last_event.get_class(), idxstr]
