extends Node3D

@onready var temp := $PanelContainer
@onready var temp_panel := $PanelContainer/BoxContainer
@onready var area := $Area3D
@export var code: String

var is_actived = false
var is_player_nearby = false
var letters := [
	"А", "Б", "В", "Г", "Д", "Е", "Ё", "Ж", "З", "И", "Й", "К", "Л", "М", "Н", 
	"О", "П", "Р", "С", "Т", "У", "Ф", "Х", "Ц", "Ч", "Ш", "Щ", "Ъ", "Ы", "Ь", 
	"Э", "Ю", "Я"
]
var focus = 0
var letter = 0

func _ready() -> void:
	temp.visible = is_actived
	area.body_entered.connect(func(body: Node3D) -> void:
		if body.is_class("CharacterBody3D"):
			is_player_nearby = true
			LEVELS.msg_player.emit("actived_puzle", "actived_puzle_breaker_panel")
	)
	area.body_exited.connect(func(body: Node3D) -> void:
		if body.is_class("CharacterBody3D"):
			is_player_nearby = false
			temp.visible = false
	)


func _physics_process(delta: float) -> void:
	if is_player_nearby and Input.is_action_just_pressed("ui_get_object"):
		is_actived = true
		temp.visible = is_actived
		LEVELS.listen_moved_player.emit(false)
	if is_actived and Input.is_action_just_pressed("ui_drop_item"):
		is_actived = false
		temp.visible = is_actived
		LEVELS.listen_moved_player.emit(true)
	if is_actived:	
		handle_letter()
		change_focus()
		resolve_code()
		
		
func resolve_code() -> void:
	if Input.is_action_just_pressed("ui_accept"):
		var input_code := ""
		for x in temp_panel.get_children():
			input_code += (x as Label).text
			valid_code(input_code)


func change_focus() -> void:
	if Input.is_action_just_pressed("ui_left"):
		focus -= 1
	elif Input.is_action_just_pressed("ui_right"):
		focus += 1
	if focus < 0:
		focus = temp_panel.get_child_count() - 1
	elif focus >= temp_panel.get_child_count():
		focus = 0


func handle_letter() -> void:
	if Input.is_action_just_pressed("ui_up"):
		letter -= 1
	elif Input.is_action_just_pressed("ui_down"):
		letter += 1
	if letter >= len(letters):
		letter = 0
	elif letter < 0:
		letter = len(letters) -1
	(temp_panel.get_child(focus) as Label).text = letters[letter]


func valid_code(input_code: String) -> void:
	if input_code == code:
		LEVELS.listen_moved_player.emit(true)
		LEVELS.msg_player.emit("msg_valid_code", "code_valid")
	else:
		LEVELS.msg_player.emit("msg_valid_code", "code_not_valid")
