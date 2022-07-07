extends KinematicBody2D

var vel = Vector2()
var candjump = false

const gravity = 40
const fallspeed = 600
const movespeed = 500
const jumpheight = -800

func _physics_process(_delta):
	vel.y += gravity
	if gravity > fallspeed: vel.y = fallspeed
	vel = move_and_slide(vel, Vector2.UP)

func _input(_event: InputEvent) -> void:
	if Input.is_action_pressed("ui_left"):
		vel.x = -movespeed
	elif Input.is_action_pressed("ui_right"):
		vel.x = movespeed
	else:
		vel.x = 0
	
	if Input.is_action_just_released("ui_up") && vel.y < 0:
# warning-ignore:integer_division
		vel.y = -fallspeed /2
	if Input.is_action_just_pressed("ui_up") && is_on_floor():
		vel.y = jumpheight
	
	match(is_on_floor()):
		true:
			candjump = true
		false:
			if Input.is_action_just_pressed("ui_up") && candjump:
				vel.y = jumpheight
				candjump = false
