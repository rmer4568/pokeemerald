SlateportCity_SternsShipyard_1F_MapScripts::
	map_script MAP_SCRIPT_ON_TRANSITION, SlateportCity_SternsShipyard_1F_OnTransition
	map_script MAP_SCRIPT_ON_FRAME_TABLE, SlateportCity_SternsShipyard_1F_OnFrame
	.byte 0

SlateportCity_SternsShipyard_1F_OnTransition:
	call_if_eq VAR_SLATEPORT_CITY_STATE, 2, SlateportCity_SternsShipyard_1F_EventScript_MoveCivilians
	end

SlateportCity_SternsShipyard_1F_EventScript_MoveCivilians::
	clearflag FLAG_INTERACTED_WITH_DOCK_STERNS_SHIPYARD
	setobjectxyperm LOCALID_STERNS_SHIPYARD_1F_SCIENTIST, 5, 3
	setobjectmovementtype LOCALID_STERNS_SHIPYARD_1F_SCIENTIST, MOVEMENT_TYPE_FACE_RIGHT
	setobjectxyperm LOCALID_STERNS_SHIPYARD_1F_RICH_BOY, 3, 2
	setobjectmovementtype LOCALID_STERNS_SHIPYARD_1F_RICH_BOY, MOVEMENT_TYPE_FACE_RIGHT
	setobjectxyperm LOCALID_STERNS_SHIPYARD_1F_GENTLEMAN, 1, 3
	setobjectmovementtype LOCALID_STERNS_SHIPYARD_1F_GENTLEMAN, MOVEMENT_TYPE_FACE_RIGHT
	return

SlateportCity_SternsShipyard_1F_EventScript_Scientist::
	lock
	faceplayer
	goto_if_set FLAG_SYS_GAME_CLEAR, SlateportCity_SternsShipyard_1F_EventScript_ScientistNormal
	goto_if_eq VAR_SLATEPORT_CITY_STATE, 2, SlateportCity_SternsShipyard_1F_EventScript_ScientistAqua
	goto_if_lt VAR_SLATEPORT_CITY_STATE, 2, SlateportCity_SternsShipyard_1F_EventScript_ScientistNormal
	goto SlateportCity_SternsShipyard_1F_EventScript_ScientistAqua
	end

SlateportCity_SternsShipyard_1F_EventScript_ScientistNormal::
	msgbox SlateportCity_SternsShipyard_1F_Text_SlateportIdealForRockets, MSGBOX_DEFAULT
	release
	end

SlateportCity_SternsShipyard_1F_EventScript_ScientistAqua::
	msgbox SlateportCity_SternsShipyard_1F_Text_WhyWouldAquaStealRocketFuel, MSGBOX_DEFAULT
	release
	end

SlateportCity_SternsShipyard_1F_EventScript_Gentleman::
	lock
	faceplayer
	goto_if_set FLAG_SYS_GAME_CLEAR, SlateportCity_SternsShipyard_1F_EventScript_GentlemanNormal
	goto_if_eq VAR_SLATEPORT_CITY_STATE, 2, SlateportCity_SternsShipyard_1F_EventScript_GentlemanAqua
	goto_if_lt VAR_SLATEPORT_CITY_STATE, 2, SlateportCity_SternsShipyard_1F_EventScript_GentlemanNormal
	goto SlateportCity_SternsShipyard_1F_EventScript_GentlemanAqua
	end

SlateportCity_SternsShipyard_1F_EventScript_GentlemanNormal::
	msgbox SlateportCity_SternsShipyard_1F_Text_WouldveLikedToBeAstronaut, MSGBOX_DEFAULT
	release
	end

SlateportCity_SternsShipyard_1F_EventScript_GentlemanAqua::
	msgbox SlateportCity_SternsShipyard_1F_Text_AquaCantGetAwayWithThis, MSGBOX_DEFAULT
	release
	end

SlateportCity_SternsShipyard_1F_EventScript_RichBoy::
	lock
	faceplayer
	goto_if_set FLAG_SYS_GAME_CLEAR, SlateportCity_SternsShipyard_1F_EventScript_RichBoyNormal
	goto_if_eq VAR_SLATEPORT_CITY_STATE, 2, SlateportCity_SternsShipyard_1F_EventScript_RichBoyAqua
	goto_if_lt VAR_SLATEPORT_CITY_STATE, 2, SlateportCity_SternsShipyard_1F_EventScript_RichBoyNormal
	goto SlateportCity_SternsShipyard_1F_EventScript_RichBoyAqua
	end

SlateportCity_SternsShipyard_1F_EventScript_RichBoyNormal::
	msgbox SlateportCity_SternsShipyard_1F_Text_WishOrdinaryPeopleCouldGoIntoSpace, MSGBOX_DEFAULT
	release
	end

SlateportCity_SternsShipyard_1F_EventScript_RichBoyAqua::
	msgbox SlateportCity_SternsShipyard_1F_Text_DoesAquaWantToGoToSpace, MSGBOX_DEFAULT
	release
	end

SlateportCity_SternsShipyard_1F_EventScript_Matt::
	lockall
	msgbox SlateportCity_SternsShipyard_1F_Text_MattDontInterfere, MSGBOX_DEFAULT
	releaseall
	end

SlateportCity_SternsShipyard_1F_EventScript_Steven::
	lockall
	goto_if_set FLAG_INTERACTED_WITH_STEVEN_STERNS_SHIPYARD, SlateportCity_SternsShipyard_1F_EventScript_ReadyForBattlePrompt
	setflag FLAG_INTERACTED_WITH_STEVEN_STERNS_SHIPYARD
	msgbox SlateportCity_SternsShipyard_1F_Text_StevenWhyStealRocketFuel, MSGBOX_DEFAULT
	msgbox SlateportCity_SternsShipyard_1F_Text_MattUseFuelToEruptVolcano, MSGBOX_DEFAULT
	closemessage
	delay 30
	playse SE_NOT_EFFECTIVE
	switch VAR_FACING
	case DIR_SOUTH, SlateportCity_SternsShipyard_1F_EventScript_StevenFightMovementSouth
	applymovement LOCALID_STERNS_SHIPYARD_1F_STEVEN, SlateportCity_SternsShipyard_1F_Movement_StevenFight
	waitmovement 0
	releaseall
	end

SlateportCity_SternsShipyard_1F_EventScript_StevenFightMovementSouth::
	applymovement LOCALID_STERNS_SHIPYARD_1F_STEVEN, SlateportCity_SternsShipyard_1F_Movement_StevenFightSouth
	waitmovement 0
	releaseall
	end

SlateportCity_SternsShipyard_1F_Movement_StevenFight:
	lock_facing_direction
	walk_fast_up
	walk_fast_up
	unlock_facing_direction
	delay_16
	delay_16
	walk_slow_down
	walk_slow_down
	step_end

SlateportCity_SternsShipyard_1F_Movement_StevenFightSouth:
	face_left
	lock_facing_direction
	walk_fast_right
	walk_fast_right
	unlock_facing_direction
	delay_16
	delay_16
	walk_slow_left
	walk_slow_left
	face_down
	step_end

SlateportCity_SternsShipyard_1F_EventScript_ReadyForBattlePrompt::
	applymovement VAR_LAST_TALKED, Common_Movement_FacePlayer
	waitmovement 0
	msgbox SlateportCity_SternsShipyard_1F_Text_StevenAreYouReadyToBattle, MSGBOX_YESNO
	goto_if_eq VAR_RESULT, YES, SlateportCity_SternsShipyard_1F_EventScript_ChoosePartyForMultiBattle
	msgbox SlateportCity_SternsShipyard_1F_Text_StevenHurryGetReadyQuickly, MSGBOX_DEFAULT
	closemessage
	applymovement VAR_LAST_TALKED, Common_Movement_WalkInPlaceFasterDown
	waitmovement 0
	releaseall
	end

SlateportCity_SternsShipyard_1F_EventScript_ChoosePartyForMultiBattle::
	applymovement VAR_LAST_TALKED, Common_Movement_WalkInPlaceFasterDown
	waitmovement 0
	special SavePlayerParty
	fadescreen FADE_TO_BLACK
	special ChooseHalfPartyForBattle
	goto_if_ne VAR_RESULT, 0, SlateportCity_SternsShipyard_1F_EventScript_DoStevenMultiBattle
	special LoadPlayerParty
	goto SlateportCity_SternsShipyard_1F_EventScript_ReadyForBattlePrompt

SlateportCity_SternsShipyard_1F_EventScript_DoStevenMultiBattle::
	special ReducePlayerPartyToSelectedMons
	frontier_set FRONTIER_DATA_SELECTED_MON_ORDER
	setvar VAR_0x8004, SPECIAL_BATTLE_STEVEN
	setvar VAR_0x8005, 0
	special DoSpecialTrainerBattle
	frontier_saveparty
	special LoadPlayerParty
	switch VAR_RESULT
	case 1, SlateportCity_SternsShipyard_1F_EventScript_DefeatedMattGrunt
	fadescreen FADE_TO_BLACK
	special SetCB2WhiteOut

SlateportCity_SternsShipyard_1F_EventScript_DefeatedMattGrunt::
	msgbox SlateportCity_SternsShipyard_1F_Text_MattWeFailedIsAquaAlsoMisguided, MSGBOX_DEFAULT
	closemessage
	delay 20
	applymovement LOCALID_STERNS_SHIPYARD_MATT, Common_Movement_WalkInPlaceFasterLeft
	applymovement LOCALID_STERNS_SHIPYARD_GRUNT, Common_Movement_WalkInPlaceFasterDown
	waitmovement 0
	delay 60
	applymovement LOCALID_STERNS_SHIPYARD_MATT, Common_Movement_WalkInPlaceFasterUp
	applymovement LOCALID_STERNS_SHIPYARD_GRUNT, Common_Movement_WalkInPlaceFasterRight
	waitmovement 0
	delay 20
	msgbox SlateportCity_SternsShipyard_1F_Text_MattWeWillGiveUp, MSGBOX_DEFAULT
	closemessage
	setvar VAR_SLATEPORT_CITY_STATE, 3
	fadedefaultbgm
	fadescreen FADE_TO_BLACK
	setvar VAR_SLATEPORT_STERNS_SHIPYARD_STATE, 3
	setflag FLAG_HIDE_SLATEPORT_CITY_STERNS_SHIPYARD_1F_TEAM_
	setflag FLAG_HIDE_SLATEPORT_CITY_TEAM_MAGMA
	removeobject LOCALID_STERNS_SHIPYARD_GRUNT
	removeobject LOCALID_STERNS_SHIPYARD_MATT
	setobjectxy LOCALID_STERNS_SHIPYARD_1F_SCIENTIST, 5, 6
	turnobject LOCALID_STERNS_SHIPYARD_1F_SCIENTIST, DIR_SOUTH
	setobjectxy LOCALID_STERNS_SHIPYARD_1F_GENTLEMAN, 11, 8
	turnobject LOCALID_STERNS_SHIPYARD_1F_GENTLEMAN, DIR_NORTH
	setobjectxy LOCALID_STERNS_SHIPYARD_1F_RICH_BOY, 6, 2
	turnobject LOCALID_STERNS_SHIPYARD_1F_RICH_BOY, DIR_NORTH
	call SlateportCity_SternsShipyard_1F_EventScript_StevenFacePlayer
	fadescreen FADE_FROM_BLACK
	msgbox SlateportCity_SternsShipyard_1F_Text_StevenThankYouComeSeeMeAtHome, MSGBOX_DEFAULT
	closemessage
	fadescreen FADE_TO_BLACK
	setflag FLAG_DEFEATED_MAGMA_SHIP_YARD
	removeobject LOCALID_STERNS_SHIPYARD_1F_SCIENTIST
	setobjectxyperm LOCALID_STERNS_SHIPYARD_1F_SCIENTIST, 5, 6
	setobjectmovementtype LOCALID_STERNS_SHIPYARD_1F_SCIENTIST, MOVEMENT_TYPE_WANDER_AROUND
	addobject LOCALID_STERNS_SHIPYARD_1F_SCIENTIST
	fadescreen FADE_FROM_BLACK
#ifdef BUGFIX
	releaseall
#endif
	end

SlateportCity_SternsShipyard_1F_EventScript_StevenFacePlayer::
	switch VAR_FACING
	case DIR_SOUTH, SlateportCity_SternsShipyard_1F_EventScript_StevenFacePlayerSouth
	case DIR_WEST, SlateportCity_SternsShipyard_1F_EventScript_StevenFacePlayerWest
	return

SlateportCity_SternsShipyard_1F_EventScript_StevenFacePlayerSouth::
	turnobject LOCALID_STERNS_SHIPYARD_1F_STEVEN, DIR_NORTH
	return

SlateportCity_SternsShipyard_1F_EventScript_StevenFacePlayerWest::
	turnobject LOCALID_STERNS_SHIPYARD_1F_STEVEN, DIR_EAST
	return

SlateportCity_SternsShipyard_1F_EventScript_MattTrainer::
	trainerbattle TRAINER_BATTLE_SET_TRAINER_A, TRAINER_MATT_SLATEPORT, LOCALID_NONE, SlateportCity_SternsShipyard_1F_Text_JustWantToExpandLand, SlateportCity_SternsShipyard_1F_Text_JustWantToExpandLand
	end

SlateportCity_SternsShipyard_1F_EventScript_GruntTrainer::
	trainerbattle TRAINER_BATTLE_SET_TRAINER_B, TRAINER_GRUNT_SLATEPORT, LOCALID_NONE, SlateportCity_SternsShipyard_Text_GruntDefeat, SlateportCity_SternsShipyard_Text_GruntDefeat
	end

SlateportCity_SternsShipyard_1F_Text_SlateportIdealForRockets:
	.string "SLATEPORT has mainly sunny weather,\n"
	.string "and its winds are stable.\p"
	.string "It's an ideal location for launching\n"
	.string "rockets.$"

SlateportCity_SternsShipyard_1F_Text_WhyWouldAquaStealRocketFuel:
	.string "Why would TEAM MAGMA want to steal\n"
	.string "our rocket fuel in the first place?$"

SlateportCity_SternsShipyard_1F_Text_WouldveLikedToBeAstronaut:
	.string "If only I was a little younger, I would\n"
	.string "have liked being an astronaut…\p"
	.string "No… It's not too late!\n"
	.string "I can and will try!$"

SlateportCity_SternsShipyard_1F_Text_AquaCantGetAwayWithThis:
	.string "If TEAM MAGMA takes the rocket fuel,\n"
	.string "I won't be able to go to space!\p"
	.string "They can't be allowed to get away\n"
	.string "with such an outrage!$"

SlateportCity_SternsShipyard_1F_Text_WishOrdinaryPeopleCouldGoIntoSpace:
	.string "I wish ordinary people could go into\n"
	.string "space one day…$"

SlateportCity_SternsShipyard_1F_Text_DoesAquaWantToGoToSpace:
	.string "TEAM MAGMA…\n"
	.string "Do they want to go to space, too?$"

SlateportCity_SternsShipyard_1F_Text_WellTakeCareOfYou:
	.string "We came here to get some papers\n"
	.string "because one Grunt failed to it!\p"
	.string "If you're going to interfere,\n"
	.string "then we'll make sure you'll suffer!$"

SlateportCity_SternsShipyard_1F_Text_MattDontInterfere:
	.string "MATT: You should get away from\n"
	.string "kid before you make me mad!$"

SlateportCity_SternsShipyard_1F_Text_DockWhyTakeOver:
	.string "DOCK: TEAM AQUA…\p"
	.string "What's the point of this?$"

SlateportCity_SternsShipyard_1F_Text_MattTakeOverShipyard:
	.string "MATT: Since you're so curious\n"
	.string ", I will give you an explanation.\p"
	.string "We're taking over this Shipyard\n"
	.string "so we can get the Devon Goods!\p"
	.string "Once we will get it, our dream\n"
	.string "will become close to reality!$"

SlateportCity_SternsShipyard_1F_Text_PlayerEnoughTeam:
	.string "{PLAYER}{KUN}: Enough…\p"
	.string "of this, TEAM AQUA!$"
	
SlateportCity_SternsShipyard_1F_Text_MattInterfered:
	.string "MATT: I told you to mind your\n"
	.string "to mind your own business, kid,\l"
	.string "but you didn't so now me and my\l"
	.string "Grunt will make you regret it!$"
	
SlateportCity_SternsShipyard_1F_Text_GruntInterfered:
	.string "GRUNT: Yes, you should have not\n"
	.string "interfere in this case, kid,\l"
	.string "because you now will face both\l"
	.string "in battle!$"
	
SlateportCity_SternsShipyard_1F_Text_WallyHelp:
	.string "Wally: Two against one\n"
	.string "Is not fair so I will join\l"
	.string "in this battle too!$"

SlateportCity_SternsShipyard_1F_Text_StevenAreYouReadyToBattle:
	.string "WALLY: {PLAYER}{KUN}!\n"
	.string "Let's go into battle together!\n"
	.string "Are you ready?$"

SlateportCity_SternsShipyard_1F_Text_StevenHurryGetReadyQuickly:
	.string "STEVEN: Then, hurry!\n"
	.string "Get ready quickly!$"

SlateportCity_SternsShipyard_1F_Text_MattDefeat:
	.string "What?! I lost?!$"

SlateportCity_SternsShipyard_Text_GruntDefeat:
	.string "How can these kids\n"
	.string "Be so strong?!$"

SlateportCity_SternsShipyard_1F_Text_MattAttracted:
	.string "MATT: We failed to get the\n"
	.string "the Devon Goods...\p"
	.string "Boss'll be mad but I like strong men!\p"
	.string "You, {PLAYER}{KUN}, got me interested\n"
	.string "in you because you're adorable too!\p"
	.string "I can't wait for the next time we meet!$"
	
SlateportCity_SternsShipyard_1F_Text_DockThankYou:
	.string "DOCK: Whew, that was too tense.\p"
	.string "{PLAYER}{KUN} and WALLY,\n"
	.string "thank you for your actions.\p"
	.string "I will give you a special\p"
	.string "reward for this.$"
