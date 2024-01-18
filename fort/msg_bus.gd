extends Node
class_name MsgBus

var log : Logger = Logger.new(Logger.LogLevel.DEBUG)
var pub_map : Dictionary
var sub_map : Array[Dictionary]
var needs_sub : Dictionary

func _init():
	pass

func _on_new_publish_sig(id : ID, topic : String, sig):
	log.info("Pub: " + str(id) + " -> " + str(topic))
	pub_map[topic] = {"owner_id": id.id_name, "signal": sig}
	if topic in needs_sub:
		var found_needs = needs_sub[topic]
		var i = -1
		for need in found_needs:
			i += 1
			if need["owner_id"] == id.id_name:
				sig.connect(need["call_back"])
				log.debug("  connect-p: " + str(sig) + " ->  " + str(need["call_back"]))
				found_needs.remove_at(i)
			if need["owner_id"] == "*":
				sig.connect(need["call_back"])
				log.debug("  connect-p: " + str(sig) + " ->  " + str(need["call_back"]))
		

func _on_new_subscribe_sig(id: ID, owner_id, topic, call_back):
	log.info("Sub: " + str(owner_id) + "." + str(topic) + " -> " + str(id))
	sub_map.append({"owner_id":owner_id, "topic": topic, "call_back": call_back})
	var pub_topic : Dictionary = pub_map.get(topic,{})
	if "signal" in pub_topic:
		var pub_sig : Signal = pub_topic["signal"]
		pub_sig.connect(call_back)
		log.debug("  connect-s: " + str(pub_sig) + " -> " + str(call_back))
		return
	var current : Array
	if topic in needs_sub:
		current = needs_sub[topic]
	else:
		current = []
	current.append({"owner_id":owner_id, "call_back": call_back})
	needs_sub[topic] = current

