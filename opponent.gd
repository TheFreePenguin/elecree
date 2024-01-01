extends Node2D
onready var global = get_node("/root/GlobalVars")
onready var wildgen = global.wildgen

# Arrays for the AI
var low_stamina: Array = ["Tackle", "Defend"]
var stamina_10: Array = []
var stamina_20: Array = []
var stamina_30: Array = []
var stamina_40: Array = []
var stamina_50: Array = []
var stamina_60: Array = []
var stamina_70: Array = []
var stamina_80: Array = []
var stamina_90: Array = []
var high_stamina: Array = []

var data: Elecree
var test_int: int = 4

func _ready():
	if global.wild:
		print(wildgen)
		data = Elecree.new(wildgen[0], wildgen[1], wildgen[2], wildgen[3], wildgen[4], wildgen[5], wildgen[6])

func get_attack_scores() -> Array:
	var attacks: Array = data.attacks.duplicate()
	var attack_scores: Array
	for i in attacks:
		attack_scores.push_back(0)
	for i in attacks.size():
		if low_stamina.has(attacks[i]):
			attack_scores[i] += 1 if data.currentst <= 10 else 0
		if stamina_10.has(attacks[i]):
			attack_scores[i] += 1 if data.currentst >= 10 else -(20 - data.currentst) / 10
		if stamina_20.has(attacks[i]):
			attack_scores[i] += 2 if data.currentst >= 20 else -(30 - data.currentst) / 10
		if stamina_30.has(attacks[i]):
			attack_scores[i] += 3 if data.currentst >= 30 else -(40 - data.currentst) / 10
		if stamina_40.has(attacks[i]):
			attack_scores[i] += 4 if data.currentst >= 40 else -(50 - data.currentst) / 10
		if stamina_50.has(attacks[i]):
			attack_scores[i] += 5 if data.currentst >= 50 else -(60 - data.currentst) / 10
		if stamina_60.has(attacks[i]):
			attack_scores[i] += 6 if data.currentst >= 60 else -(70 - data.currentst) / 10
		if stamina_70.has(attacks[i]):
			attack_scores[i] += 7 if data.currentst >= 70 else -(80 - data.currentst) / 10
		if stamina_80.has(attacks[i]):
			attack_scores[i] += 8 if data.currentst >= 80 else -(90 - data.currentst) / 10
		if stamina_90.has(attacks[i]):
			attack_scores[i] += 9 if data.currentst >= 10 else -(100 - data.currentst) / 10
	return attack_scores
		
func sort_by_score(a, b) -> bool:
	var scores: Array = get_attack_scores()
	return scores[data.attacks.find(a)] < scores[data.attacks.find(b)]

func enemy_ai() -> String:
	var attacks: Array = data.attacks.duplicate()
	attacks.sort_custom(self, "sort_by_score")
	attacks.invert()
	return attacks[0]
