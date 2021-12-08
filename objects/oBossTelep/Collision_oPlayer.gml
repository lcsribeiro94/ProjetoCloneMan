/// @description Insert description here
// You can write your code in this editor

global.session_stage++;

switch (room) {
	case RoomCave:
		global.lastRoom = RoomCaveBoss;
		room_goto(RoomCaveBoss);
		break;
	case RoomSky:
		global.lastRoom = RoomSkyBoss;
		room_goto(RoomSkyBoss);
		break;
	case RoomForest:
		global.lastRoom = RoomForestBoss;
		room_goto(RoomForestBoss);
		break;
}