extends Node
class_name Msg

var log : Logger = Logger.new(Logger.LogLevel.DEBUG, "msg")
var id : ID
var pub_map : Dictionary

signal new_publish_sig(id, topic, sig)
signal new_subscribe_sig(id, owner_id, topic, call_back)

func _init(id_in: ID):
	id = id_in
	new_publish_sig.connect(msg_bus._on_new_publish_sig)
	new_subscribe_sig.connect(msg_bus._on_new_subscribe_sig)

# use to publish on a topic (With your ID)
func publish(topic, data=null):
	var sig = pub_map.get(topic)
	log.debug("  (" + topic + ") " + str(sig) + " ->")
	sig.emit(data)

# User to register a signal with a publish topic (With your ID)
func register(topic, sig):
	pub_map[topic] = sig
	new_publish_sig.emit(id, topic, sig)

# Subscribe to a topic with the callback function
func subscribe(owner_id, topic, call_back):
	new_subscribe_sig.emit(id, owner_id, topic, call_back)

# Subscribe to all topics with the callback function for all IDs
func subscribe_all(topic, call_back):
	new_subscribe_sig.emit(id, "*", topic, call_back)

# Use the call_back to subscribe to the topic (With your ID)
func publish_to(topic, call_back):
	pass

class Topic:
	var topic : String
	var sig
	func _init(topic_in : String, sig_in):
		topic = topic_in
		sig = sig_in
	func val() -> Dictionary:
		return {"topic": topic, "signal": sig}

class Msg_CB:
	var topic : String
	var call_back
	func _init(topic_in : String, call_back_in):
		topic = topic_in
		call_back = call_back
