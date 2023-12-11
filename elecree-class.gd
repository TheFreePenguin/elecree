extends Resource

class_name Elecree

var dict = preload("res://creatures.tres").data

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
export(int) var recharge: int


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
