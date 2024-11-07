extends CharacterBody2D


const SPEED = 150.0
var max_life = 100
var life = max_life

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction_x = Input.get_axis("ui_left", "ui_right")
	var direction_y = Input.get_axis("ui_up", "ui_down")
	if direction_x or direction_y:
		velocity.x = direction_x * SPEED
		velocity.y = direction_y * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
	
func take_dmg(atk_power):
	if (life >= 0 and $Timer.is_stopped()):
		life -= atk_power
		$Timer.start()
		print(life)

func heal(healing):
	if(life<=max_life):
		life += healing
		print(life)
		
