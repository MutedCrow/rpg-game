############ GLOBAL ############

extends Node



@onready var enemy_scene = preload("res://Scenes/Gunslinger.tscn")
@onready var bullet_scene = preload("res://Scenes/Bullet.tscn")
#@onready var pickups_scene = preload()


const below = 0
const ground = 1
const above = 2
const spawns = 3
