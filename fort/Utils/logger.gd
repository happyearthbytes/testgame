extends Object
class_name Logger

enum LogLevel {DEBUG=1,INFO=2,WARNING=3,ERROR=4}
const LevelMap : Dictionary = {
	LogLevel.DEBUG: "debug",
	LogLevel.INFO: "info",
	LogLevel.WARNING: "warning",
	LogLevel.ERROR: "error",
}

var level : LogLevel = LogLevel.INFO

func _init(level_in: LogLevel = LogLevel.INFO):
	set_level(level_in)

func set_level(level_in: LogLevel):
	level = level_in

func set_debug():
	set_level(LogLevel.DEBUG)
func set_info():
	set_level(LogLevel.INFO)
func set_warning():
	set_level(LogLevel.WARNING)
func set_error():
	set_level(LogLevel.ERROR)

func _log(level_in: LogLevel, msg):
	if level <= level_in:
		print("[" + LevelMap[level_in] + "] " + str(msg))

func debug(msg):
	_log(LogLevel.DEBUG, msg)
func info(msg):
	_log(LogLevel.INFO, msg)
func warning(msg):
	_log(LogLevel.WARNING, msg)
func error(msg):
	_log(LogLevel.ERROR, msg)
