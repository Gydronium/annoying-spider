extends Node2D

@export var move_speed: float = 200.0
@export var turn_speed: float = 0.8
@export var player_move: bool = false
@export var move_thres: float = 200

var is_stepping: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    var dir = 0.0
    var a_dir = 0.0
    
    if (player_move):
        dir = Input.get_axis('ui_down', 'ui_up')
        a_dir = Input.get_axis('ui_right', 'ui_left')
    else:
        var mouse_pos = get_global_mouse_position()
        
        a_dir = clamp(rotation - global_position.direction_to(mouse_pos).angle() - PI/2, -1, 1)
        
        var dist_to_mouse = global_position.distance_to(mouse_pos)
        if dist_to_mouse > move_thres:
            dir = clamp(dist_to_mouse, 0, 1)
    
    if (abs(a_dir) > 0.1):
        rotation -= a_dir * turn_speed * delta
        is_stepping = true
    else:
        is_stepping = false
    
    if !is_stepping:
        var add = Vector2(0, (-dir) * move_speed * delta).rotated(rotation)
        position += add
    #translate(Vector2(0, -dir) * move_speed * delta)
