# Neon Flight City

This repository is a minimal Godot 4 starter project for a neon-lit driving and flight prototype inspired by Taipei.

## Play the game

[Play Neon Flight City](https://olivialu0924-star.github.io/neon-flight-city/)

> The web demo link will work after GitHub Pages is configured and a successful web build is deployed. If it currently shows a 404, the game has not been published yet.

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
