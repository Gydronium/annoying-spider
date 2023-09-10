extends Node2D

@export var step_target: Node2D
@export var step_distance: float = 100.0
@export var distance_to_body: float = 400.0

@export var body: Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    var to_step = global_position.distance_to(step_target.global_position)
    var to_body = global_position.distance_to(body.global_position)
    if abs(to_step) > step_distance:
    #|| abs(to_body) > distance_to_body:
        step()
    

func step():
    var target_pos = step_target.global_position
    var half_way = (global_position + step_target.global_position)
    
    var t = get_tree().create_tween();
#    t.tween_property(self, "global_position", halfWay + owner.basis.y, 0.1)
    t.tween_property(self, "global_position", target_pos, 0.15)
