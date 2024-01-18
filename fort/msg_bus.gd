extends Node
class_name MsgBus

var pub_map : Dictionary
var sub_map : Array[Dictionary]

func _init():
	pass

func _on_new_publish_sig(id : ID, topic : String, sig):
	print("Pub: ", id, " -> ", topic)
	pub_map[topic] = {"owner_id":"tbd", "signal": sig}

func _on_new_subscribe_sig(id: ID, owner_id, topic, call_back):
	print("Sub: ", owner_id, ".", topic, " -> ", id)
	sub_map.append({"owner_id":owner_id, "topic": topic, "call_back": call_back})
	var pub_topic : Dictionary = pub_map.get(topic,{})
	if "signal" not in pub_topic:
		return
	var pub_sig : Signal = pub_topic["signal"]
	pub_sig.connect(call_back)
