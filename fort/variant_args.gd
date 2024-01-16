extends Object
class_name VariantArgs

func _init(args: Array[Variant]):
	__set_args(args)
	if "__name" not in self:
		assert(false, "Need to define __name")

func __set_args(args: Array[Variant]):
	assert(false,"Need to define __set_args")

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
