extends CharacterBody3D

@export var drive_speed := 12.0
@export var flight_speed := 18.0
@export var turn_speed := 2.2
@export var flight_duration := 4.5
@export var landed_height := 1.2

var flight_time := 4.5
var is_flying := false

func _ready() -> void:
    position.y = landed_height

func _unhandled_input(event: InputEvent) -> void:
    if event.is_action_pressed("toggle_flight"):
        if is_flying:
            is_flying = false
            position.y = landed_height
        elif flight_time > 0.1:
            is_flying = true

func _physics_process(delta: float) -> void:
    var turn_input = Input.get_axis("turn_left", "turn_right")
    var drive_input = Input.get_axis("move_back", "move_forward")
    rotation.y -= turn_input * delta * turn_speed

    if is_flying:
        flight_time = max(0.0, flight_time - delta)
        if flight_time <= 0.0:
            is_flying = false
            position.y = landed_height

        var lift_input = Input.get_axis("move_down", "move_up")
        var forward = -transform.basis.z.normalized()
        var boost_multiplier = 1.0 + Input.get_action_strength("boost") * 0.8

        velocity = forward * drive_input * flight_speed * boost_multiplier
        velocity.y = lift_input * flight_speed * 0.75
        move_and_slide()
        position.y = clamp(position.y, 1.0, 12.0)
        return

    if position.y > landed_height:
        position.y = lerp(position.y, landed_height, delta * 8.0)

    position.y = landed_height
    var forward = -transform.basis.z.normalized()
    velocity.x = forward.x * drive_input * drive_speed
    velocity.z = forward.z * drive_input * drive_speed
    velocity.y = 0.0
    move_and_slide()

func _process(delta: float) -> void:
    if not is_flying and flight_time < flight_duration:
        flight_time = min(flight_duration, flight_time + delta * 0.25)
