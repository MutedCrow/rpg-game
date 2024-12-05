############ GLOBAL ############

extends Node



@onready var enemy_scene = preload("res://Scenes/Gunslinger.tscn")
@onready var bullet = preload("res://Scripts/Bullet.gd")
#@onready var pickups_scene = preload()


const below = 0
const ground = 1
const above = 2
