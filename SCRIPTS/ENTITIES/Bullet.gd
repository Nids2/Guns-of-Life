extends KinematicBody2D

var direction = Vector2.RIGHT
var speed = 1500

func _process(delta):
	translate(direction.normalized() * speed * delta)


func _on_Screen_screen_exited() -> void:
	queue_free()


func _on_Area2D_body_entered(body: Node) -> void:
	if "wall" in body.name:
		queue_free() 
