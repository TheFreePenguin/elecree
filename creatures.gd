extends Resource

const attack_list = [ "Tackle", "Defend"]
const stamina_cost = [ 3,        0      ]

const data = [{
  "name": "TestMonster",
  "edeviceid": 00,
  "edeviceentry": "This is a test monster used for debugging. It should not be seen in the final release",
  "edeviceheight": 1.0,
  "edeviceweight": 10.0,
  "basehp": 30,
  "baseat": 30,
  "basedf": 30,
  "basesp": 30,
  "basest": 30,
  "basexp": 50,
  "attacks": ["", "", "Tackle"]
}]

func _ready():
	print("Initialized creatures.gd")

func _calculateStats(dnahp,dnaat,dnadf,dnasp,dnast,level,creature):
# warning-ignore:unused_variable
	var totalhp
	var totalat
# warning-ignore:unused_variable
	var totaldf
# warning-ignore:unused_variable
	var totalsp
# warning-ignore:unused_variable
	var totalst
	var hpstr
	var atstr
	var dfstr
	var spstr
	var ststr
	totalhp = int ((data[creature].basehp * level) / 10) + ( dnahp * level )
	totalat = int ((data[creature].baseat * level) / 10) + ( dnaat * level )
	totaldf = int ((data[creature].basehp * level) / 10) + ( dnadf * level )
	totalsp = int ((data[creature].basesp * level) / 10) + ( dnasp * level )
	totalst = int ((data[creature].basest * level) / 10) + ( dnast * level )
	hpstr = str(totalhp)
	atstr = str(totalat)
	dfstr = str(totaldf)
	spstr = str(totalsp)
	ststr = str(totalst)
	
	
	return "HP: " + hpstr + " AT: " + atstr + " DF: " + dfstr + " SP: " + spstr + " ST: " + ststr

# func _input(ev):
	#var returnValue = _calculateStats(15,15,15,15,15,15,0)
	#if ev is InputEventKey and ev.scancode == KEY_K:
		#_calculateStats(15,15,15,15,15,15,0)
		#print(returnValue)
