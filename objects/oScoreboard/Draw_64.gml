/// @description Esse objeto escreve as pontuações na tela

scoreWin = (bdEnd == 1) ? "WIN" : "LOSE";

timeMin = 0;
timeHour = 0;

if (bdSessionTime >= 60) timeMin = floor(bdSessionTime / 60);
if (timeMin >= 60) timeHour = floor(timeMin / 60);
timeSec = bdSessionTime % 60;

scoreTime = string(timeHour) + ":" + string(timeMin % 60) + ":" + string(timeSec);

strScore = "End: " + scoreWin + " | Stages: " + string(bdStages) + " | Lives: " + string(bdLives) + " | Time: " + scoreTime;

draw_set_color(c_black);
draw_text_transformed(x, y, strScore,2,2,0);