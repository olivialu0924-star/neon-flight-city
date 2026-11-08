# Neon Flight City

This repository is a minimal Godot 4 starter project for a neon-lit driving and flight prototype inspired by Taipei.

## Included
- One playable car scene
- Basic driving movement
- Flight toggle with limited airtime
- One timed package-delivery mission
- A compact city block with roads and buildings

## How to run
1. Open this folder in Godot 4.
2. Import the project.
3. Press Play.

## Controls
- W / S: accelerate and brake
- A / D: steer
- F: toggle flight mode
- Space: lift upward while flying
- Shift: boost speed while airborne

## Goal
Pick up the package at the market, then fly to the rooftop drop-off before the timer expires.

## Project structure
- `project.godot` — Godot project settings
- `scenes/Main.tscn` — main game scene
- `scripts/CarController.gd` — driving and flight logic
- `scripts/Main.gd` — mission logic and UI

## Next ideas
- Add real traffic cars
- Add drift handling and camera shake
- Add district unlocking and car upgrades
- Add more missions and rooftops
