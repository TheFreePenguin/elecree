extends Resource


export(Array) var data = [{
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
  "basexp": 50
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
	totalhp = int ((data[creature].basehp * level) / 20) + dnahp
	totalat = int ((data[creature].baseat * level) / 20) + dnaat
	totaldf = int ((data[creature].basehp * level) / 20) + dnadf
	totalsp = int ((data[creature].basesp * level) / 20) + dnasp
	totalst = int ((data[creature].basest * level) / 20) + dnast
	return totalat

func _input(ev):
	var returnValue = _calculateStats(15,15,15,15,15,15,0)
	if ev is InputEventKey and ev.scancode == KEY_K:
		_calculateStats(15,15,15,15,15,15,0)
		print(returnValue)
