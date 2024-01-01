extends Resource

class_name Elecree

var dict = preload("res://creatures.tres").data
var atk_list = preload("res://creatures.tres").attack_list
var stamina_cost = preload("res://creatures.tres").stamina_cost

enum StatusEffect {OK, Burn, Poison}

export(int) var stathp: int
export(int) var statat: int
export(int) var statdf: int
export(int) var statsp: int
export(int) var statst: int
export(int) var species: int
export(int) var currenthp: int
export(int) var currentat: int
export(int) var currentdf: int
export(int) var currentsp: int
export(int) var currentst: int
export(int) var status: int
export(int) var level: int
export(float) var recharge: float
export(Array) var attacks: Array


func burn():
	if status == StatusEffect.OK:
		status = StatusEffect.Burn

func poison():
	if status == StatusEffect.OK:
		status = StatusEffect.Poison

func _init(dnahp: int, dnaat: int, dnadf: int, dnasp: int, dnast: int, lv: int, id: int):
	stathp = int ((dict[id].basehp * lv) / 10) + ( dnahp * lv )
	statat = int ((dict[id].baseat * lv) / 10) + ( dnaat * lv )
	statdf = int ((dict[id].basedf * lv) / 10) + ( dnadf * lv )
	statsp = int ((dict[id].basesp * lv) / 10) + ( dnasp * lv )
	statst = int ((dict[id].basest * lv) / 10) + ( dnast * lv )
	species = id
	currenthp = stathp
	currentat = statat
	currentdf = statdf
	currentsp = statsp
	currentst = statst
	recharge = 0
	status = StatusEffect.OK
	level = lv
	attacks = generate_attacks(lv, id)

func attack(target: Elecree, attack: String):
	currentst -= stamina_cost[atk_list.find(attack)]
	match attack:
		"Tackle":
			damage(target, 30)
	recharge = 0

func damage(target: Elecree, power: int):
	var dmg: int = (power * level * (float(currentat) / float(target.currentdf))) / 10
	#print("Power" + str(power) + "Level" + str(level) + "Attack" + str(currentat) + "Defense" + str(target.currentdf))
	target.currenthp -= dmg
	print(target.currenthp)

func generate_attacks(lv: int, id: int) -> Array:
	var attacks: Array
	for i in range(0, lv):
		var new_attack: String = get_attack(i + 1, id)
		if new_attack != "":
			attacks.push_back(new_attack)
	return attacks


func get_attack(lv: int, id: int) -> String:
		if dict[id].attacks.size() < lv:
			return ""
		else:
			return dict[id].attacks[lv - 1]

func heal():
	currenthp = stathp
	currentat = statat
	currentdf = statdf
	currentsp = statsp
	currentst = statst
	status = StatusEffect.OK
