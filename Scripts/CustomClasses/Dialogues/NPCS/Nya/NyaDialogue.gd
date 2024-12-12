extends dialogue
class_name NyaDialogue

#region  GLOBAL VARIABLES

var state_dialogues:Dictionary = {"Idle":{"0": ["Well", "Now what?"],
"1":["Let's get moving"],
"2": ["What now?"]},
"In_Menu":{"0": ["What?"], "1": ["Say"], "2":["Yes?"]},
"Move_Action":{"0":["Where are we going?"],
"1": ["Finally"],
"2": ["Onwards"]},
"Soma_Action":"",
"Arts_Action":"",
"Inventory_Action":"",
"Wait_Action":"",
"Call_Nya_Action":"",
"Choosing_Direction":"",
"Moving":"",
"Event_Found":""}
#endregion
