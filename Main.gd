extends Node2D

var gameState = Constants.START_SCREEN

func _ready():
	pass

func _on_StartGame_S_START_GAME():
	$Transition.hide()

func _on_Transition_S_TRANSITION_HIDE_FINISHED():
	match(gameState):
		# We need to load the game
		Constants.START_SCREEN:
			#Load Game
			pass