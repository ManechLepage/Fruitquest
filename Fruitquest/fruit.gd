extends RigidBody2D

enum FruitType {
	BLUEBERRY = 0,
	STRAWBERRY = 1,
	CHERRY = 2
}

var velocity = 3
var default_velocity = velocity

@export var type: FruitType

func _physics_process(delta):
	position.x += velocity

func _on_sides_body_entered(body):
	velocity = -velocity
	if body.name == "Player":
		body.take_damage()

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		body.jump()
		queue_free()
