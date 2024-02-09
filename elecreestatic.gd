extends Node

class_name ElecreeStatic

static func level_up(elecree: Elecree):
	elecree.level += 1
	var fully_healed: Elecree = Elecree.new(elecree.dna_hp, elecree.dna_at, elecree.dna_df, elecree.dna_sp, elecree.dna_st, elecree.level, elecree.species)
	elecree.stathp = fully_healed.stathp
	elecree.statat = fully_healed.statat
	elecree.statdf = fully_healed.statdf
	elecree.statsp = fully_healed.statsp
	elecree.statst = fully_healed.statst

static func get_alive_creatures(array: Array) -> int:
	var creatures: int = 0
	for i in array:
		if i is Elecree && i.currenthp > 0:
			creatures += 1
	return creatures

static func select_next_alive_creature(array: Array) -> int:
	var next: int = 0
	for i in array:
		if i is Elecree && i.currenthp > 0:
			return next
		else:
			next += 1
	return -1
