extends CharacterBody2D
class_name Player

const SPEED = 150.0
var max_life = 30
var life = max_life
var atk_power = 10
var max_munition = 3
var munition = max_munition
var curr_area: GridArea = null

@onready var vida: Label = $"../HUD/Control/HBoxContainer/HBoxContainer/vida"
@onready var municao: Label = $"../HUD/Control/HBoxContainer/HBoxContainer2/municao"

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready() -> void:
	pass

func _input(event):
	if (event.is_action_pressed("attack") and munition > 0 and $Area2D/atkTimer.is_stopped()):
		$Area2D.monitoring= true
		$Area2D/Sprite2D.visible = true
		$Area2D/atkTimer.start()
		munition -= 1
		#print(munition)

func _process(delta: float) -> void:
	vida.text = str(life)
	municao.text = str(munition)

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
	if (life > 0 and $Timer.is_stopped()):
		life -= atk_power
		$Timer.start()
		print(life)
	
	if(life <= 0):
		get_tree().change_scene_to_file("res://scenes/HUD/morte.tscn")
		return

func heal(healing):
	if(life<max_life):
		life += healing
		print(life)
		
func recharge():
	munition = max_munition

func _on_area_2d_body_entered(body):
	if(body.is_in_group("enemy")):
		body.attacked()

func _on_atk_timer_timeout():
	$Area2D.monitoring = false
	$Area2D/Sprite2D.visible = false


func _on_detection_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("area")):
		#areas.append(area)
		curr_area = area
