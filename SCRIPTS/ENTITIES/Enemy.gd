extends KinematicBody2D

var health: int = 3
var speed = 300
var grav = 20
var move = Vector2()

func _process(_delta: float) -> void:
	move.y += grav
	if health < 1:
		queue_free()
	move.x = +speed
	move = move_and_slide(move)

func _on_Area2D_body_entered(body: Node) -> void:
	if "Bullet" in body.name:
		health -= 1
		$AnimationPlayer.play("Hit")
		body.queue_free()
