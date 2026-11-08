extends Node3D

@onready var player: CharacterBody3D = $PlayerCar
@onready var mission_label: Label = $CanvasLayer/Label
@onready var pickup_marker: Node3D = $PickupMarker
@onready var dropoff_marker: Node3D = $DropoffMarker

var timer := 32.0
var mission_stage := "pickup"
var mission_complete := false

func _ready() -> void:
    pickup_marker.visible = true
    dropoff_marker.visible = false
    update_label()

func _process(delta: float) -> void:
    if mission_complete:
        return

    timer -= delta
    if timer <= 0.0:
        mission_stage = "failed"
        timer = 0.0
        update_label()
        return

    var target = pickup_marker if mission_stage == "pickup" else dropoff_marker
    var distance = player.global_position.distance_to(target.global_position)

    if distance < 4.0:
        if mission_stage == "pickup":
            mission_stage = "dropoff"
            pickup_marker.visible = false
            dropoff_marker.visible = true
            timer += 12.0
        else:
            mission_complete = true
            mission_stage = "success"
            timer = 0.0

    update_label()

func update_label() -> void:
    match mission_stage:
        "pickup":
            mission_label.text = "Mission: pick up the package at the market\nTime: %.1f s" % timer
        "dropoff":
            mission_label.text = "Mission: deliver the package to the rooftop drop-off\nTime: %.1f s" % timer
        "success":
            mission_label.text = "Delivery complete!\nNew district unlocked."
        "failed":
            mission_label.text = "Mission failed.\nRestart the scene to try again."
