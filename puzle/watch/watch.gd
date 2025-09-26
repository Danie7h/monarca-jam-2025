extends Node3D


@export var hours: int
@export var minutes: int
@export var seconds: int
@export var is_run := false

@onready var label := $PanelContainer/Label

var time_passed := 0.0

signal timeout()

func _ready() -> void:
	label.text = "%02d:%02d:%02d" % [hours, minutes, seconds]
	

func _process(delta: float) -> void:
	if is_run:
		time_passed += delta
		label.text = format_time(time_passed)


func format_time(_seconds: float) -> String:
	var _minutes = int(_seconds) / 60
	var _secs = int(_seconds) % 60
	var _hours = int(_minutes) / 60
	if _hours == hours and _secs == seconds and _minutes == minutes:
		timeout.emit()
	return "%02d:%02d:%02d" % [_hours, _minutes, _secs]
