extends RigidBody2D
@onready var tmr_base_player_resource = $tmrBasePlayerResource

@export var tmrDespawnMin = 1
@export var tmrDespawnMax = 1
var playerResourceType = Global.PlayerResourceType.LEAVES

var resourceScene
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Called when the node enters the scene tree for the first time.
func _ready():
	startDespawnTimer()
	#setResourceScene()

#func _physics_process(delta):
	#velocity.y += gravity * delta
	#move_and_slide()

func _on_tmr_base_player_resource_timeout():
	match playerResourceType:
		Global.PlayerResourceType.LEAVES:
			get_parent().spawnTree(global_position)
	queue_free()

func startDespawnTimer():
	tmr_base_player_resource.start(randi_range(tmrDespawnMin, tmrDespawnMax))


func _on_a_2d_base_player_resource_body_entered(_body):
	#Log.print("Body detected")
	pass

#func setResourceScene():
	#match playerResourceType:
		#Global.PlayerResourceType.LEAVES:
			#resourceScene = preload("res://scenes/res/tree_res/newRes.tscn")
#
##TODO pqq isso n ta funcionando?
#func spawnResource():
	#var newResource = resourceScene.instantiate()
	##get_parent().add_sibling(newResource)
	#add_child(newResource)
	#newResource.global_position = global_position
	
