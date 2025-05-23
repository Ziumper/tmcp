# Tile Map Collision Layer Project with pushing box

## Project description 

It's a minimalistic project for showcasing an issue with godot TileMapLayer Collision and
Rigidbody2D component. Each of the scenes in the project contains a simple player node and a pushing box with a Rigidbody2D node.
The player aims to push the box. Somehow on the scene with TileMapLayer, the box is blocked in halfway through. 
There seems to be an issue with collision logic for tile maps.

## Scenes Overview 

* `test_world.tscn` - it's a scene with StaticBody2D node and Simple Collision. Pushing box works as expected without any issues
* `test_tile_world.tscn` - it's a scene with TileMapLayer with physicsc layer applied on mockup.tres tile set. 

## Issue appears on:

* Godot Engine v4.4.1.stable.official.49a5bc7b6 Ubuntu 24.04.2 LTS 
