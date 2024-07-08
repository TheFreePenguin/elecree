extends Resource

class_name Elecree

var dict = preload("res://creatures.tres").data
var atk_list = preload("res://creatures.tres").attack_list
var stamina_cost = preload("res://creatures.tres").stamina_cost

enum StatusEffect {OK, Burn, Poison, Defend}

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
var dna_hp: int
var dna_at: int
var dna_df: int
var dna_sp: int
var dna_st: int


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
	dna_hp = dnahp
	dna_at = dnaat
	dna_df = dnadf
	dna_sp = dnasp
	dna_st = dnast
	species = id
	currenthp = stathp
	currentat = statat
	currentdf = statdf
	currentsp = statsp
	currentst = statst
	recharge = 0
	status = StatusEffect.OK
	level = lv
	#print("Generating attacks with level " + str(lv))
	attacks = generate_attacks(lv, id)

func get_stamina(attack: String):
	return stamina_cost[atk_list.find(attack)]

func attack(target: Elecree, attack: String) -> Array:
	currentst -= stamina_cost[atk_list.find(attack)]
	recharge = 0
	match attack:
		"Tackle":
			damage(target, 30)
			return [""]
		"Defend":
			if status != 0:
				return ["But it failed!"]
			else:
				status = 3
				currentdf *= 1.5
				return [""]
		_:
			return [""]


func damage(target: Elecree, power: int):
	var dmg: int = (power * level * (float(currentat) / float(target.currentdf))) / 10
	#print("Power" + str(power) + "Level" + str(level) + "Attack" + str(currentat) + "Defense" + str(target.currentdf))
	target.currenthp -= dmg
	#print(target.currenthp)

func generate_attacks(lv: int, id: int) -> Array:
	var attacks: Array
	for i in range(0, lv):
		var new_attack: String = get_attack(i + 1, id)
		#print("Adding new attack " + new_attack)
		if new_attack != "":
			attacks.push_back(new_attack)
	print("Attacks" + str(attacks))
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

#func level_up():
#	level += 1
#	var fully_healed: Elecree = LevelUp.get_elecree(dna_hp, dna_at, dna_df, dna_sp, dna_st)
#	stathp = fully_healed.stathp
#	statat = fully_healed.statat
#	statdf = fully_healed.statdf
#	statsp = fully_healed.statsp
#	statst = fully_healed.statst

func get_name() -> String:
	return dict[species].name
