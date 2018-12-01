extends Node

enum GAME_STATE{
	START_SCREEN,
	GAME_SCREEN
}

#Bullets
enum BULLET_TYPE{STANDARD, THIN, HEAVY, ROUND}
const BULLET_TYPE_ANIM = {STANDARD : "Standard", THIN : "Thin", HEAVY : "Heavy", ROUND : "Round"}
const BULLET_ATTRIBUTES = {
	STANDARD	: {"Damage" : 5,	"Speed" : 2,	"Penetration" : 1},
	THIN		: {"Damage" : 5,	"Speed" : 5,	"Penetration" : 5},
	HEAVY		: {"Damage" : 15,	"Speed" : 1,	"Penetration" : 2},
	ROUND		: {"Damage" : 10,	"Speed" : 3,	"Penetration" : 1},
}



const G_CHARACTER = "Character"
const G_PLAYER = "Player"
const G_ENEMY = "Character"
const G_BULLET = "Bullet"
const G_BULLET_PLAYER = "BulletPlayer"
const G_BULLET_ENEMY = "BulletEnemy"