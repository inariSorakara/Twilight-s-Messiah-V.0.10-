extends dialogue
class_name NyaDialogue

#region  GLOBAL VARIABLES

#Things Nya says depending on the state
var state_dialogues:Dictionary = {"Idle":{"0": ["Well", "Now what?"],
"1":["Let's get moving"],
"2": ["What now?"]},
"In_Menu":{"0": ["What?"], "1": ["Say"], "2":["Yes?"]},
"Move_Action":{"0":["Where are we going?"],
"1": ["Finally"],
"2": ["Onwards"]},
"Confirming_Room": {"0":["You sure?"], "1":["Here?"],"2":["On it!"]},
"Soma_Action":"",
"Arts_Action":"",
"Inventory_Action":"",
"Wait_Action":"",
"Call_Nya_Action":"",
"Choosing_Direction":"",
"Moving":"",
"Event_Found":""}

#Player notifications
var player_notifications:Dictionary = {"Confirming_Message":{"0": ["Press Confirm or Negate"]}}

#Things Nya says when encountering an event
var event_dialogues:Dictionary = {"Quartz":{"0": ["We don't have enough memoria yet.", "Let's come back later."],
"1":["Stairs, here?", "I'm getting an weird feeling from above", "Shall we go on?"]}}
#endregion
