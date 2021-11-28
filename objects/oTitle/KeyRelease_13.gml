randomize();
roomtogo = irandom(2);
global.hasUp = false;
global.hasDown = false;
global.hasNeutral = false;
global.lastRoom = RoomTitle;

switch (roomtogo) {
	case 0:
		global.lastRoom = RoomCave;
		break;
	case 1:
		global.lastRoom = RoomForest;
		break;
	case 2:
		global.lastRoom = RoomSky;
		break;
}

room_goto(global.lastRoom);
