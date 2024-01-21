extends Object
class_name Logger

enum LogLevel {DEBUG=1,INFO=2,WARNING=3,ERROR=4}
var custom_color : String = "white"
const LevelMap : Dictionary = {
	LogLevel.DEBUG: "debug",
	LogLevel.INFO: "info",
	LogLevel.WARNING: "warning",
	LogLevel.ERROR: "error",
}
const LevelColor : Dictionary = {
	LogLevel.DEBUG: "cyan",
	LogLevel.INFO: "green",
	LogLevel.WARNING: "yellow",
	LogLevel.ERROR: "red",
}
var level : LogLevel = LogLevel.INFO
var logger_name : String

func _init(level_in: LogLevel = LogLevel.INFO, logger_name_in: String = "default", custom_color_in: String = "white"):
	set_level(level_in)
	set_name(logger_name_in)
	set_color(custom_color_in)

func set_color(custom_color_in: String):
	custom_color = custom_color_in

func set_name(logger_name_in: String):
	logger_name = logger_name_in
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
		print_rich("[color=" + LevelColor[level_in] + "][b][" + LevelMap[level_in] + "][/b][/color]\t[color="+ custom_color + "](" + logger_name + ")[/color] " + str(msg))

func debug(msg):
	_log(LogLevel.DEBUG, msg)
func info(msg):
	_log(LogLevel.INFO, msg)
func warning(msg):
	_log(LogLevel.WARNING, msg)
func error(msg):
	_log(LogLevel.ERROR, msg)
