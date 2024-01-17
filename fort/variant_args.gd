extends Object
class_name VariantArgs

# var __name # override

func _init(): # override
	pass

func _to_string():
	var props = self.get_property_list().filter(
			func(x): return x["type"] != 0 and x["type"] != 24
		).map(
			func(x): return x["name"]
		).map(
			func(x): return "%s=%s" % [x, self.get(x)]
		).reduce(
			func(x,y): return x + ", " + y
		)
	return "%s(%s)" % [get("__name"), props]
