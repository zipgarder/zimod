#include <a_samp>
#include <streamer>

#define COLOR_LIGHTBLUE 0x33CCFFAA
#define COLOR_GREEN 0x00FF00AA
#define RADIO 3000
#define COLOR_RED 0xFF0000AA
#define COLOR_YELLOW 0xFFFF00AA
#define SLOT 1
#define OKNOPRICONNECTE             1
#define OKNOPRI             1
#define MAX_HOUSES 10000
#define COLOR_ORANGE 0xFF9900AA
#define ADMINFS_MESSAGE_COLOR 0x33CCFFAA
#define PM_INCOMING_COLOR     0xFF0000AA
#define PM_OUTGOING_COLOR     0x00FF00AA
#define dcmd(%1,%2,%3) if ((strcmp((%3)[1], #%1, true, (%2)) == 0) && ((((%3)[(%2) + 1] == 0) && (dcmd_%1(playerid, "")))||(((%3)[(%2) + 1] == 32) && (dcmd_%1(playerid, (%3)[(%2) + 2]))))) return 1

new ta4ka[MAX_PLAYERS];
new ta4katest[MAX_PLAYERS];
new neon[MAX_PLAYERS][2];
new countdown[MAX_PLAYERS];
new Text:Times;
new migalki[MAX_PLAYERS][2];
new h[MAX_PLAYERS],m[MAX_PLAYERS];
new Float:RandomSpawn[][4] = {
	{2500.4712,-1678.1825,13.3651}
};
forward settime(playerid);
forward Countdown();
forward Check();
forward AutoRepair();
forward AutoFlip();
forward FireworksSystem();
forward UpdateFireworksSystem();
forward DestroyPickups();
forward Reklama();


main()
{
	print("\nИгровой мод ZiMod запущен успешно!");
}

public AutoRepair()
{
	for(new playerid=0; playerid<MAX_PLAYERS; playerid++)
	{
		if (IsPlayerInAnyVehicle(playerid))
		{
			new Float:CarHP;
			GetVehicleHealth(GetPlayerVehicleID(playerid), CarHP);
			if (CarHP < 1000)
			{
				RepairVehicle(GetPlayerVehicleID(playerid));
			}
		}
	}
	return 1;
}

public OnGameModeInit()
{
	Create3DTextLabel( "{33FF00}Добро пожаловать на {FF3300}ZiDrift\n{33FF00}Для помощи используйте {FF3300}/help", 0x008080FF, 1110.9763,-1837.4794,16.6020, 40.0, 0 );
	SetGameModeText("ZiMod 3.6");//game mode name
	UsePlayerPedAnims();
	SetTimer("Check",1000,1);//таймер для проверки
	SetTimer("Countdown",1000,1);//таймер отсчёта
	SetTimer("AutoRepair", 1000, true);

	SetTimer("settime",1000,true);
	SetTimer("Reklama",1000*60*5,1);
	Times = TextDrawCreate(551.000000, 431.000000, "ZiDrift");
	TextDrawBackgroundColor(Times, 255);
	TextDrawFont(Times, 3);
	TextDrawLetterSize(Times, 0.549999, 1.700000);
	TextDrawColor(Times, 16711935);
	TextDrawSetOutline(Times, 1);
	TextDrawSetProportional(Times, 1);
	AllowAdminTeleport(1);

	new rand = random(sizeof(RandomSpawn));	//классы
	AddPlayerClass(266,1958.3783,1343.1572,15.3746,270.1425,0,0,24,300,-1,-1);
	AddPlayerClass(267,1958.3783,1343.1572,15.3746,270.1425,0,0,24,300,-1,-1);
	AddPlayerClass(268,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(269,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(270,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(271,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(272,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);

	AddPlayerClass(283,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(284,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(285,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(286,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(287,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);

	AddPlayerClass(254,1958.3783,1343.1572,15.3746,0.0,0,0,24,300,-1,-1);
	AddPlayerClass(255,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(256,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(257,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(258,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(259,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(260,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(261,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(262,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(263,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(264,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(274,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(275,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(276,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);

	AddPlayerClass(1,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(2,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(290,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(291,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(292,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(293,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(294,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(295,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(296,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(297,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(298,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(299,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);

	AddPlayerClass(277,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(278,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(279,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(288,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(47,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(48,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(49,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(50,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(51,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(52,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(53,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(54,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(55,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(56,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(57,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(58,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(59,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(60,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(61,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(62,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(63,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(64,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(66,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(67,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(68,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(69,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(70,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(71,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(72,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(73,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(75,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(76,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(78,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(79,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(80,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(81,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(82,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(83,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(84,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(85,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(87,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(88,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(89,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(91,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(92,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(93,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(95,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(96,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(97,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(98,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(99,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(100,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(101,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(102,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(103,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(104,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(105,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(106,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(107,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(108,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(109,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(110,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(111,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(112,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(113,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(114,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(115,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(116,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(117,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(118,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(120,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(121,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(122,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(123,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(124,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(125,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(126,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(127,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(128,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(129,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(131,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(133,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(134,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(135,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(136,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(137,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(138,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(139,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(140,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(141,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(142,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(143,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(144,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(145,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(146,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(147,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(148,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(150,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(151,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(152,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(153,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(154,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(155,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(156,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(157,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(158,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(159,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(160,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(161,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(162,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(163,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(164,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(165,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(166,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(167,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(168,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(169,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(170,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(171,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(172,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(173,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(174,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(175,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(176,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(177,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(178,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(179,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(180,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(181,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(182,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(183,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(184,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(185,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(186,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(187,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(188,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(189,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(190,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(191,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(192,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(193,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(194,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(195,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(196,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(197,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(198,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(199,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(200,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(201,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(202,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(203,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(204,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(205,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(206,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(207,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(209,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(210,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(211,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(212,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(213,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(214,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(215,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(216,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(217,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(218,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(219,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(220,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(221,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(222,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(223,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(224,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(225,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(226,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(227,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(228,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(229,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(230,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(231,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(232,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(233,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(234,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(235,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(236,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(237,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(238,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(239,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(240,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(241,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(242,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(243,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(244,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(245,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(246,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(247,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(248,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(249,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(250,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(251,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);
	AddPlayerClass(253,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3],0,-1,46,-1,43,40);

	//vinewood
	//AddStaticVehicle(555,1253.09338379,-815.05462646,83.92812347,0.00000000,-1,-1); //Windsor
	//AddStaticVehicle(475,1255.63244629,-805.13385010,84.04062653,0.00000000,-1,-1); //Sabre
	//AddStaticVehicle(475,1251.90454102,-805.06829834,84.04062653,0.00000000,-1,-1); //Sabre
	//AddStaticVehicle(475,1248.42346191,-804.91534424,84.04062653,0.00000000,-1,-1); //Sabre
	//AddStaticVehicle(562,1242.04943848,-806.54766846,83.89417267,0.00000000,-1,-1); //Elegy
	//AddStaticVehicle(562,1245.28723145,-806.48223877,83.89417267,0.00000000,-1,-1); //Elegy
	//AddStaticVehicle(562,1241.76940918,-813.28118896,83.89417267,0.00000000,-1,-1); //Elegy
	//AddStaticVehicle(562,1249.87414551,-816.46203613,83.90129852,0.00000000,-1,-1); //Elegy
	//AddStaticVehicle(562,1249.42236328,-792.47430420,89.38012695,0.00000000,-1,-1); //Elegy
	CreateDynamicObject(11239,1272.38452148,-728.16247559,93.33664703,357.75000000,0.00000000,289.74011230); //object(dockbarrier2zb_sfse)(1)
	CreateDynamicObject(11239,1322.98059082,-704.77355957,92.36158752,0.49780273,0.00000000,291.48919678); //object(dockbarrier2zb_sfse)(2)
	CreateDynamicObject(11239,1322.33972168,-690.52246094,92.83650970,358.50939941,0.00000000,289.11352539); //object(dockbarrier2zb_sfse)(3)
	CreateDynamicObject(11239,1271.02136230,-713.59075928,94.51153564,359.25585938,359.54501343,291.03802490); //object(dockbarrier2zb_sfse)(4)
	CreateDynamicObject(18218,1312.07336426,-597.49517822,97.74626160,0.00000000,0.00000000,70.21002197); //object(mtbfence08)(1)
	CreateDynamicObject(18218,1287.04833984,-609.20739746,101.12139130,357.25000000,0.00000000,70.20812988); //object(mtbfence08)(2)
	CreateDynamicObject(18218,1361.13171387,-687.76483154,92.27913666,343.42791748,358.25000000,72.70309448); //object(mtbfence08)(3)
	CreateDynamicObject(18218,1141.40332031,-635.51660156,104.42617035,353.44738770,0.00000000,31.24127197); //object(mtbfence08)(4)
	CreateDynamicObject(18218,1406.99414062,-636.08984375,87.34294891,7.24548340,358.24768066,122.73922729); //object(mtbfence08)(5)
	CreateDynamicObject(18218,1384.72387695,-672.90612793,93.17919159,351.17712402,358.24768066,82.39202881); //object(mtbfence08)(6)
	CreateDynamicObject(18218,1375.44335938,-567.02734375,83.54271698,335.24230957,353.18847656,219.07836914); //object(mtbfence08)(7)
	CreateDynamicObject(18218,1275.94042969,-598.92968750,101.12139130,357.24243164,0.00000000,66.45629883); //object(mtbfence08)(8)
	CreateDynamicObject(18218,1088.99450684,-628.16839600,111.20117188,3.19665527,0.00000000,40.91461182); //object(mtbfence08)(9)
	CreateDynamicObject(18219,1056.37634277,-625.05407715,116.58195496,3.97000122,0.00000000,58.22503662); //object(mtbfence09)(1)
	CreateDynamicObject(18219,1071.46313477,-636.81896973,114.50064087,356.46606445,357.00000000,147.03500366); //object(mtbfence09)(2)
	CreateDynamicObject(18219,1045.57519531,-630.81054688,116.27574921,3.96606445,0.00000000,57.47497559); //object(mtbfence09)(3)
	CreateDynamicObject(18219,936.95532227,-683.08496094,118.59222412,346.21606445,0.00000000,94.82205200); //object(mtbfence09)(4)
	CreateDynamicObject(18219,924.74499512,-668.25616455,118.59222412,346.21215820,0.00000000,97.27252197); //object(mtbfence09)(5)
	CreateDynamicObject(18219,898.42388916,-708.59899902,109.81717682,338.95666504,359.25000000,116.80746460); //object(mtbfence09)(6)
	CreateDynamicObject(18219,920.09295654,-704.24847412,113.59207153,339.20568848,359.24743652,108.30664062); //object(mtbfence09)(7)
	CreateDynamicObject(18219,908.11145020,-727.83734131,106.51708221,336.70568848,354.24194336,114.27627563); //object(mtbfence09)(8)
	CreateDynamicObject(18219,897.84497070,-752.14739990,98.39207458,332.95349121,358.49194336,114.74230957); //object(mtbfence09)(9)
	CreateDynamicObject(18219,897.84472656,-752.14648438,98.39207458,332.95166016,358.48937988,114.74121094); //object(mtbfence09)(10)
	CreateDynamicObject(18219,887.92218018,-732.49853516,101.99229431,327.45166016,359.73937988,112.49121094); //object(mtbfence09)(11)
	CreateDynamicObject(18219,844.14410400,-793.63940430,76.34231567,345.24707031,346.60644531,73.58401489); //object(mtbfence09)(12)
	CreateDynamicObject(18219,884.83776855,-769.13305664,92.34251404,342.99536133,346.60217285,90.69592285); //object(mtbfence09)(13)
	CreateDynamicObject(18219,863.64898682,-783.82183838,83.24247742,344.24316406,345.09667969,74.41711426); //object(mtbfence09)(14)
	CreateDynamicObject(18219,819.51641846,-803.03265381,70.01068115,352.99011230,345.09155273,65.41589355); //object(mtbfence09)(15)
	CreateDynamicObject(18216,822.03527832,-780.26586914,72.67448425,352.05999756,15.88000488,190.56005859); //object(mtbfence1)(1)
	CreateDynamicObject(18219,783.01226807,-787.50555420,66.85360718,1.64514160,339.33605957,59.98760986); //object(mtbfence09)(16)
	CreateDynamicObject(8674,799.99865723,-807.04260254,66.69572449,0.00000000,357.00000000,8.70501709); //object(csrsfence02_lvs)(1)
	CreateDynamicObject(8674,784.53906250,-809.07421875,65.96806335,0.00000000,0.00000000,2.71911621); //object(csrsfence02_lvs)(2)
	CreateDynamicObject(18220,492.20401001,-1016.89550781,91.79369354,354.04501343,0.00000000,292.78997803); //object(mtbfence10)(1)
	CreateDynamicObject(18220,511.90206909,-998.03588867,88.46849060,349.28991699,356.00000000,284.03564453); //object(mtbfence10)(2)
	CreateDynamicObject(18220,183.25653076,-1406.41711426,45.41336060,353.24322510,1.95043945,115.21380615); //object(mtbfence10)(3)
	CreateDynamicObject(18220,181.89379883,-1170.66979980,55.61434555,342.32614136,1.95007324,118.77941895); //object(mtbfence10)(4)
	CreateDynamicObject(18220,197.07035828,-1147.95507812,60.36434555,6.17285156,1.95007324,299.67364502); //object(mtbfence10)(5)
	CreateDynamicObject(18220,163.07812500,-1189.98535156,51.98939896,0.68115234,1.95007324,284.02954102); //object(mtbfence10)(6)
	CreateDynamicObject(18220,671.26770020,-1042.88452148,50.95029449,1.39782715,344.95007324,128.13250732); //object(mtbfence10)(7)
	CreateDynamicObject(18220,162.71777344,-1409.57421875,44.81332397,356.46789551,1.95007324,31.23413086); //object(mtbfence10)(8)
	CreateDynamicObject(18220,241.52050781,-1322.87890625,53.66773987,356.46789551,350.94726562,101.11816406); //object(mtbfence10)(9)
	CreateDynamicObject(18220,397.22070312,-1234.48437500,51.46558380,1.14257812,350.94726562,84.72656250); //object(mtbfence10)(10)
	CreateDynamicObject(18220,603.44238281,-1119.08789062,47.51325989,2.39501953,353.44665527,330.37536621); //object(mtbfence10)(11)
	CreateDynamicObject(18220,642.83691406,-1083.98144531,47.44284439,1.39526367,344.94873047,106.29272461); //object(mtbfence10)(12)
	CreateDynamicObject(18220,694.35650635,-1002.96301270,51.67533875,3.85025024,344.94873047,120.87805176); //object(mtbfence10)(13)
	CreateDynamicObject(18220,1006.31250000,-784.30364990,101.43162537,5.08013916,356.44323730,284.36682129); //object(mtbfence10)(14)
	CreateDynamicObject(18220,749.45996094,-934.07714844,55.35037994,359.12109375,355.68786621,290.08300781); //object(mtbfence10)(15)
	CreateDynamicObject(8674,1025.73693848,-791.89428711,102.86946869,0.75000000,354.50000000,17.11499023); //object(csrsfence02_lvs)(3)
	CreateDynamicObject(8674,1082.13879395,-765.85449219,108.71701050,0.74707031,354.49584961,7.36120605); //object(csrsfence02_lvs)(4)
	CreateDynamicObject(12921,1244.44470215,-733.94714355,96.80424500,0.00000000,0.00000000,289.27499390); //object(sw_farment01)(1)
	CreateDynamicObject(17037,1235.22021484,-728.96038818,97.03719330,357.75000000,0.25000000,293.75997925); //object(cuntw_carport2_)(1)
	CreateDynamicObject(1976,1411.96740723,-617.56396484,88.81216431,0.00000000,0.00000000,266.90997314); //object(w_test)(1)
	CreateDynamicObject(1222,1401.48352051,-653.87774658,91.31628418,0.00000000,0.00000000,0.00000000); //object(barrel3)(1)
	CreateDynamicObject(1222,1399.37109375,-657.27209473,91.96942139,0.00000000,0.00000000,0.00000000); //object(barrel3)(2)
	CreateDynamicObject(1222,1397.06225586,-661.11688232,92.82727051,0.00000000,0.00000000,0.00000000); //object(barrel3)(3)
	CreateDynamicObject(1222,1349.29418945,-569.84356689,89.25022888,0.00000000,0.00000000,0.00000000); //object(barrel3)(4)
	CreateDynamicObject(1222,1337.48022461,-574.07281494,91.62543488,0.00000000,0.00000000,0.00000000); //object(barrel3)(5)
	CreateDynamicObject(1222,1252.19812012,-608.21136475,101.09958649,0.00000000,0.00000000,0.00000000); //object(barrel3)(6)
	CreateDynamicObject(1222,1258.97607422,-608.27593994,103.97601318,0.00000000,0.00000000,0.00000000); //object(barrel3)(7)
	CreateDynamicObject(1222,1262.95324707,-605.44311523,103.61735535,0.00000000,0.00000000,0.00000000); //object(barrel3)(8)
	CreateDynamicObject(1222,1270.74084473,-618.13153076,102.87844849,0.00000000,0.00000000,0.00000000); //object(barrel3)(9)
	CreateDynamicObject(1222,1265.38061523,-620.55987549,103.26860046,0.00000000,0.00000000,0.00000000); //object(barrel3)(10)
	CreateDynamicObject(1222,1158.11914062,-640.09161377,103.39943695,0.00000000,0.00000000,0.00000000); //object(barrel3)(11)
	CreateDynamicObject(1222,1125.19042969,-632.46289062,105.01345825,0.00000000,0.00000000,0.00000000); //object(barrel3)(12)
	CreateDynamicObject(1222,1119.90551758,-632.60314941,106.32041931,0.00000000,0.00000000,0.00000000); //object(barrel3)(13)
	CreateDynamicObject(1222,1005.40112305,-643.12463379,120.86266327,0.00000000,0.00000000,0.00000000); //object(barrel3)(14)
	CreateDynamicObject(1222,1003.04656982,-643.95880127,120.98595428,0.00000000,0.00000000,0.00000000); //object(barrel3)(15)
	CreateDynamicObject(1222,1001.01391602,-644.88641357,121.07382965,0.00000000,0.00000000,0.00000000); //object(barrel3)(16)
	CreateDynamicObject(1222,933.38519287,-656.41052246,119.45359802,0.00000000,0.00000000,0.00000000); //object(barrel3)(17)
	CreateDynamicObject(1222,906.38342285,-691.93725586,113.94023132,0.00000000,0.00000000,0.00000000); //object(barrel3)(18)
	CreateDynamicObject(1222,907.38208008,-688.81103516,114.63664246,0.00000000,0.00000000,0.00000000); //object(barrel3)(19)
	CreateDynamicObject(1222,909.64379883,-684.42443848,115.56820679,0.00000000,0.00000000,0.00000000); //object(barrel3)(20)
	CreateDynamicObject(1222,912.89514160,-681.08386230,115.99917603,0.00000000,0.00000000,0.00000000); //object(barrel3)(21)
	CreateDynamicObject(1222,805.98504639,-806.29425049,66.80753326,0.00000000,0.00000000,0.00000000); //object(barrel3)(22)
	CreateDynamicObject(1222,508.24877930,-927.15075684,75.70549011,0.00000000,0.00000000,0.00000000); //object(barrel3)(23)
	CreateDynamicObject(1222,506.65557861,-939.99847412,77.71740723,0.00000000,0.00000000,0.00000000); //object(barrel3)(24)
	CreateDynamicObject(1222,501.46838379,-1006.91802979,90.38364410,0.00000000,0.00000000,0.00000000); //object(barrel3)(25)
	CreateDynamicObject(1222,410.65045166,-1007.85766602,91.95027924,0.00000000,0.00000000,0.00000000); //object(barrel3)(26)
	CreateDynamicObject(1222,407.87298584,-1008.01702881,91.88504028,0.00000000,0.00000000,0.00000000); //object(barrel3)(27)
	CreateDynamicObject(1222,289.56488037,-1096.81701660,82.57524872,0.00000000,0.00000000,0.00000000); //object(barrel3)(28)
	CreateDynamicObject(1222,291.19219971,-1100.99108887,82.44524384,0.00000000,0.00000000,0.00000000); //object(barrel3)(29)
	CreateDynamicObject(1222,208.32284546,-1134.09216309,62.63312912,0.00000000,0.00000000,0.00000000); //object(barrel3)(30)
	CreateDynamicObject(1222,211.38076782,-1131.19274902,62.99439240,0.00000000,0.00000000,0.00000000); //object(barrel3)(31)
	CreateDynamicObject(1222,217.82662964,-1127.50451660,63.75838470,0.00000000,0.00000000,0.00000000); //object(barrel3)(32)
	CreateDynamicObject(1222,223.03546143,-1125.87609863,64.51033020,0.00000000,0.00000000,0.00000000); //object(barrel3)(33)
	CreateDynamicObject(1222,150.37162781,-1199.89978027,50.21736908,0.00000000,0.00000000,0.00000000); //object(barrel3)(34)
	CreateDynamicObject(1222,170.36241150,-1391.74963379,47.77999115,0.00000000,0.00000000,0.00000000); //object(barrel3)(35)
	CreateDynamicObject(1222,202.00099182,-1385.66040039,48.52035522,0.00000000,0.00000000,0.00000000); //object(barrel3)(36)
	CreateDynamicObject(1222,199.06173706,-1388.33605957,48.00099182,0.00000000,0.00000000,0.00000000); //object(barrel3)(37)
	CreateDynamicObject(1222,209.87446594,-1351.89526367,50.27656174,0.00000000,0.00000000,0.00000000); //object(barrel3)(38)
	CreateDynamicObject(1222,211.30595398,-1350.14697266,50.40404129,0.00000000,0.00000000,0.00000000); //object(barrel3)(39)
	CreateDynamicObject(1222,213.50889587,-1348.82824707,50.53567123,0.00000000,0.00000000,0.00000000); //object(barrel3)(40)
	CreateDynamicObject(1222,264.79052734,-1332.21203613,52.75268173,0.00000000,0.00000000,0.00000000); //object(barrel3)(41)
	CreateDynamicObject(1222,263.30139160,-1333.23522949,52.70021057,0.00000000,0.00000000,0.00000000); //object(barrel3)(43)
	CreateDynamicObject(1222,261.87420654,-1334.33337402,52.64924240,0.00000000,0.00000000,0.00000000); //object(barrel3)(44)
	CreateDynamicObject(1222,285.37091064,-1317.79614258,53.42681503,0.00000000,0.00000000,0.00000000); //object(barrel3)(45)
	CreateDynamicObject(1222,304.58038330,-1354.49780273,23.29575729,0.00000000,0.00000000,0.00000000); //object(barrel3)(46)
	CreateDynamicObject(1222,283.85931396,-1318.85278320,53.37773132,0.00000000,0.00000000,0.00000000); //object(barrel3)(47)
	CreateDynamicObject(1222,282.44836426,-1319.90417480,53.33553696,0.00000000,0.00000000,0.00000000); //object(barrel3)(48)
	CreateDynamicObject(1222,281.07849121,-1320.80065918,53.29212570,0.00000000,0.00000000,0.00000000); //object(barrel3)(49)
	CreateDynamicObject(1222,279.40310669,-1322.08374023,53.23595047,0.00000000,0.00000000,0.00000000); //object(barrel3)(50)
	CreateDynamicObject(1222,335.68386841,-1288.32617188,53.70001221,0.00000000,0.00000000,0.00000000); //object(barrel3)(51)
	CreateDynamicObject(1222,333.77755737,-1289.22778320,53.70001221,0.00000000,0.00000000,0.00000000); //object(barrel3)(52)
	CreateDynamicObject(1222,331.71759033,-1290.53649902,53.70001221,0.00000000,0.00000000,0.00000000); //object(barrel3)(53)
	CreateDynamicObject(1222,329.33148193,-1291.52709961,53.70001221,0.00000000,0.00000000,0.00000000); //object(barrel3)(54)
	CreateDynamicObject(1222,381.27099609,-1241.24426270,52.69118500,0.00000000,0.00000000,0.00000000); //object(barrel3)(55)
	CreateDynamicObject(1222,377.81314087,-1243.36596680,53.01886368,0.00000000,0.00000000,0.00000000); //object(barrel3)(56)
	CreateDynamicObject(1222,373.94726562,-1244.17785645,53.47394562,0.00000000,0.00000000,0.00000000); //object(barrel3)(57)
	CreateDynamicObject(1222,605.47509766,-1111.52172852,46.82185364,0.00000000,0.00000000,0.00000000); //object(barrel3)(58)
	CreateDynamicObject(1222,608.52850342,-1110.19995117,46.65509033,0.00000000,0.00000000,0.00000000); //object(barrel3)(59)
	CreateDynamicObject(1222,612.31872559,-1106.78564453,46.52270126,0.00000000,0.00000000,0.00000000); //object(barrel3)(60)
	CreateDynamicObject(1222,629.45245361,-1115.90893555,46.22140503,0.00000000,0.00000000,0.00000000); //object(barrel3)(61)
	CreateDynamicObject(1222,675.42712402,-1042.25659180,49.95164108,0.00000000,0.00000000,0.00000000); //object(barrel3)(62)
	CreateDynamicObject(1222,680.27209473,-1035.00659180,50.31716156,0.00000000,0.00000000,0.00000000); //object(barrel3)(63)
	CreateDynamicObject(1222,798.97460938,-879.56433105,58.64400482,0.00000000,0.00000000,0.00000000); //object(barrel3)(64)
	CreateDynamicObject(1222,805.76257324,-875.36657715,60.93883514,0.00000000,0.00000000,0.00000000); //object(barrel3)(65)
	CreateDynamicObject(1222,833.27917480,-865.67968750,68.50798798,0.00000000,0.00000000,0.00000000); //object(barrel3)(66)
	CreateDynamicObject(1222,837.09283447,-875.62384033,68.26512909,0.00000000,0.00000000,0.00000000); //object(barrel3)(67)
	CreateDynamicObject(1222,833.75189209,-876.99456787,68.26512909,0.00000000,0.00000000,0.00000000); //object(barrel3)(68)
	CreateDynamicObject(1222,830.66802979,-878.45892334,68.25255585,0.00000000,0.00000000,0.00000000); //object(barrel3)(69)
	CreateDynamicObject(1222,937.11523438,-834.89379883,94.29386139,0.00000000,0.00000000,0.00000000); //object(barrel3)(70)
	CreateDynamicObject(1222,931.44323730,-837.97576904,93.81705475,0.00000000,0.00000000,0.00000000); //object(barrel3)(71)
	CreateDynamicObject(1222,927.23999023,-840.71826172,93.45554352,0.00000000,0.00000000,0.00000000); //object(barrel3)(72)
	CreateDynamicObject(1222,923.37060547,-842.63513184,93.13568878,0.00000000,0.00000000,0.00000000); //object(barrel3)(73)
	CreateDynamicObject(1222,994.63922119,-794.53765869,99.40617371,0.00000000,0.00000000,0.00000000); //object(barrel3)(74)
	CreateDynamicObject(1222,1018.99945068,-774.99731445,102.41915894,0.00000000,0.00000000,0.00000000); //object(barrel3)(75)
	CreateDynamicObject(1222,1022.85510254,-777.90600586,102.42423248,0.00000000,0.00000000,0.00000000); //object(barrel3)(76)
	CreateDynamicObject(1222,1018.00555420,-778.81433105,101.96015167,0.00000000,0.00000000,0.00000000); //object(barrel3)(77)
	CreateDynamicObject(1222,1076.30566406,-765.58483887,107.10494995,0.00000000,0.00000000,0.00000000); //object(barrel3)(78)
	CreateDynamicObject(1222,1071.84948730,-762.58032227,106.32182312,0.00000000,0.00000000,0.00000000); //object(barrel3)(79)
	CreateDynamicObject(1222,1084.33093262,-776.50970459,107.78250122,0.00000000,0.00000000,0.00000000); //object(barrel3)(80)
	CreateDynamicObject(1222,1079.80883789,-777.34594727,107.38788605,0.00000000,0.00000000,0.00000000); //object(barrel3)(81)
	CreateDynamicObject(1222,1075.68688965,-777.88208008,107.08756256,0.00000000,0.00000000,0.00000000); //object(barrel3)(82)
	CreateDynamicObject(1222,1244.27709961,-725.87835693,94.92636108,0.00000000,0.00000000,0.00000000); //object(barrel3)(83)
	CreateDynamicObject(1222,1240.30310059,-728.36218262,94.97270203,0.00000000,0.00000000,0.00000000); //object(barrel3)(84)
	CreateDynamicObject(1222,1231.36743164,-733.03540039,95.55207062,0.00000000,0.00000000,0.00000000); //object(barrel3)(85)
	CreateDynamicObject(1222,1350.73718262,-680.20538330,92.04203796,0.00000000,0.00000000,0.00000000); //object(barrel3)(86)
	CreateDynamicObject(1222,1354.00439453,-678.82867432,92.47928619,0.00000000,0.00000000,0.00000000); //object(barrel3)(87)
	CreateDynamicObject(1222,1083.22851562,-623.16296387,112.00064850,0.00000000,0.00000000,0.00000000); //object(barrel3)(88)
	CreateDynamicObject(1222,1122.25988770,-632.52911377,105.73506165,0.00000000,0.00000000,0.00000000); //object(barrel3)(89)
	CreateDynamicObject(16776,1350.43237305,-698.97479248,90.71424866,4.19000244,0.00000000,179.36495972); //object(des_cockbody)(1)
	CreateDynamicObject(10397,1293.99194336,-711.32824707,95.46125793,8.00000000,359.75000000,21.83499146); //object(hc_stadlight1_sfs)(1)
	CreateDynamicObject(2886,1245.81091309,-738.38116455,95.01042938,0.00000000,0.00000000,294.49499512); //object(sec_keypad)(1)
	CreateDynamicObject(1210,1232.56311035,-733.21276855,95.09844208,0.00000000,0.00000000,23.27001953); //object(briefcase)(1)
	CreateDynamicObject(2061,1231.76367188,-733.68438721,95.25838470,0.00000000,0.00000000,21.83499146); //object(cj_shells1)(1)
	CreateDynamicObject(1350,1254.97387695,-733.46002197,93.40153503,0.00000000,0.00000000,292.50997925); //object(cj_traffic_light4)(1)
	CreateDynamicObject(1232,1409.42114258,-619.88586426,85.51596832,0.00000000,0.00000000,0.00000000); //object(streetlamp1)(1)
	CreateDynamicObject(1232,1403.71057129,-585.83001709,80.10076141,0.00000000,0.00000000,0.00000000); //object(streetlamp1)(2)
	CreateDynamicObject(1232,1344.54443359,-571.75665283,92.36463928,0.00000000,0.00000000,0.00000000); //object(streetlamp1)(3)
	CreateDynamicObject(1232,1337.45776367,-586.17205811,94.85404968,0.00000000,0.00000000,0.00000000); //object(streetlamp1)(4)
	CreateDynamicObject(1232,1260.61389160,-607.02661133,106.02983093,0.00000000,0.00000000,0.00000000); //object(streetlamp1)(5)
	CreateDynamicObject(1232,1081.83227539,-623.03094482,114.35849762,0.00000000,0.00000000,0.00000000); //object(streetlamp1)(6)
	CreateDynamicObject(1232,985.22015381,-647.00250244,123.47516632,0.00000000,0.00000000,0.00000000); //object(streetlamp1)(7)
	CreateDynamicObject(1232,894.44323730,-760.10833740,98.86382294,0.00000000,0.00000000,0.00000000); //object(streetlamp1)(8)
	CreateDynamicObject(1232,557.92468262,-908.68414307,69.98642731,0.00000000,0.00000000,0.00000000); //object(streetlamp1)(9)
	CreateDynamicObject(1232,142.06802368,-1291.00012207,47.71102142,0.00000000,0.00000000,0.00000000); //object(streetlamp1)(10)
	CreateDynamicObject(1232,170.41192627,-1390.23364258,50.12850952,0.00000000,0.00000000,0.00000000); //object(streetlamp1)(11)
	CreateDynamicObject(16442,1267.45202637,-618.78186035,104.36456299,0.00000000,0.00000000,194.53002930); //object(desn2_stripsigs1)(1)
	CreateDynamicObject(1825,1235.76464844,-730.59735107,94.80340576,0.00000000,2.25000000,0.00000000); //object(kb_table_chairs1)(1)
	CreateDynamicObject(1226,1389.38134766,-667.73370361,96.84304810,0.00000000,0.00000000,0.00000000); //object(lamppost3)(1)
	CreateDynamicObject(1226,1401.61633301,-651.94836426,94.33677673,0.00000000,0.00000000,0.00000000); //object(lamppost3)(2)
	CreateDynamicObject(1226,1369.64123535,-567.16729736,88.10899353,0.00000000,0.00000000,89.32501221); //object(lamppost3)(3)
	CreateDynamicObject(1226,1296.32714844,-603.92993164,102.99044037,0.00000000,0.00000000,296.47998047); //object(lamppost3)(4)
	CreateDynamicObject(1226,1264.54760742,-604.87133789,106.50233459,0.00000000,0.00000000,0.00000000); //object(lamppost3)(5)
	CreateDynamicObject(1226,1197.73999023,-633.69342041,106.88238525,0.00000000,0.00000000,276.62994385); //object(lamppost3)(6)
	CreateDynamicObject(1226,1192.94055176,-621.52026367,106.88249207,0.00000000,0.00000000,53.59500122); //object(lamppost3)(7)
	CreateDynamicObject(1226,1062.00109863,-623.44067383,118.97878265,0.00000000,0.00000000,280.59997559); //object(lamppost3)(8)
	CreateDynamicObject(1226,971.38287354,-634.88659668,124.74300385,0.00000000,0.00000000,0.00000000); //object(lamppost3)(9)
	CreateDynamicObject(1226,944.12030029,-670.28509521,123.25410461,0.00000000,0.00000000,0.00000000); //object(lamppost3)(10)
	CreateDynamicObject(1226,912.04364014,-683.34240723,119.16013336,0.00000000,0.00000000,140.93499756); //object(lamppost3)(11)
	CreateDynamicObject(1226,924.89495850,-694.40966797,119.66194916,0.00000000,0.00000000,0.00000000); //object(lamppost3)(12)
	CreateDynamicObject(1226,923.45019531,-696.81427002,119.38590240,0.00000000,0.00000000,0.00000000); //object(lamppost3)(13)
	CreateDynamicObject(1226,905.34240723,-694.92187500,116.66868591,0.00000000,0.00000000,164.75500488); //object(lamppost3)(14)
	CreateDynamicObject(1226,886.85644531,-762.37908936,98.38565826,0.00000000,0.00000000,0.00000000); //object(lamppost3)(15)
	CreateDynamicObject(1226,882.26855469,-747.93829346,100.28084564,0.00000000,0.00000000,129.02502441); //object(lamppost3)(16)
	CreateDynamicObject(1226,862.86102295,-766.90991211,89.61988068,0.00000000,0.00000000,121.08502197); //object(lamppost3)(17)
	CreateDynamicObject(1226,804.62170410,-806.33441162,70.03250885,0.00000000,0.00000000,274.64501953); //object(lamppost3)(18)
	CreateDynamicObject(1226,771.62658691,-813.85919189,69.00217438,0.00000000,0.00000000,0.00000000); //object(lamppost3)(19)
	CreateDynamicObject(1226,771.90240479,-791.17822266,68.82360840,0.00000000,0.00000000,95.28002930); //object(lamppost3)(20)
	CreateDynamicObject(1226,661.10852051,-898.77355957,66.31480408,0.00000000,0.00000000,0.00000000); //object(lamppost3)(21)
	CreateDynamicObject(1226,646.26080322,-887.66711426,66.04538727,0.00000000,0.00000000,115.13003540); //object(lamppost3)(22)
	CreateDynamicObject(1226,520.40863037,-897.86651611,74.95420074,0.00000000,0.00000000,140.93499756); //object(lamppost3)(23)
	CreateDynamicObject(1226,508.34207153,-933.75280762,79.98278809,0.00000000,0.00000000,168.72503662); //object(lamppost3)(24)
	CreateDynamicObject(1226,514.48101807,-989.25415039,90.51309204,0.00000000,0.00000000,0.00000000); //object(lamppost3)(25)
	CreateDynamicObject(1226,473.69836426,-1024.05346680,95.66733551,0.00000000,0.00000000,0.00000000); //object(lamppost3)(29)
	CreateDynamicObject(1226,500.79199219,-1008.80664062,93.57212067,0.00000000,0.00000000,0.00000000); //object(lamppost3)(30)
	CreateDynamicObject(1226,289.86257935,-1098.97546387,85.53942871,0.00000000,0.00000000,0.00000000); //object(lamppost3)(31)
	CreateDynamicObject(1226,287.31115723,-1094.84350586,86.31204224,0.00000000,0.00000000,0.00000000); //object(lamppost3)(32)
	CreateDynamicObject(1226,263.57141113,-1117.35266113,81.44820404,0.00000000,0.00000000,142.92004395); //object(lamppost3)(33)
	CreateDynamicObject(1226,259.90380859,-1120.78710938,80.72808075,0.00000000,0.00000000,123.07003784); //object(lamppost3)(34)
	CreateDynamicObject(1226,253.37496948,-1147.03686523,78.21880341,0.00000000,0.00000000,0.00000000); //object(lamppost3)(35)
	CreateDynamicObject(1226,246.51936340,-1147.50915527,77.21734619,0.00000000,0.00000000,0.00000000); //object(lamppost3)(36)
	CreateDynamicObject(1226,260.08648682,-1144.77685547,78.88256836,0.00000000,0.00000000,0.00000000); //object(lamppost3)(37)
	CreateDynamicObject(1226,219.65896606,-1125.07861328,67.59033966,0.00000000,0.00000000,121.08502197); //object(lamppost3)(38)
	CreateDynamicObject(1226,213.18260193,-1129.04785156,66.68775940,0.00000000,0.00000000,125.05505371); //object(lamppost3)(39)
	CreateDynamicObject(1226,208.33361816,-1131.52221680,66.19905853,0.00000000,0.00000000,136.96502686); //object(lamppost3)(40)
	CreateDynamicObject(1226,166.33242798,-1186.49316406,55.80247879,0.00000000,0.00000000,123.07003784); //object(lamppost3)(41)
	CreateDynamicObject(1226,163.74346924,-1222.17016602,46.96490097,0.00000000,0.00000000,0.00000000); //object(lamppost3)(42)
	CreateDynamicObject(1226,178.03340149,-1205.51562500,52.42467499,0.00000000,0.00000000,0.00000000); //object(lamppost3)(43)
	CreateDynamicObject(1226,156.20266724,-1377.58593750,52.84606552,0.00000000,0.00000000,0.00000000); //object(lamppost3)(46)
	CreateDynamicObject(1226,186.28962708,-1403.52319336,49.19467545,0.00000000,0.00000000,0.00000000); //object(lamppost3)(47)
	CreateDynamicObject(1226,181.08247375,-1410.42785645,48.48181152,0.00000000,0.00000000,0.00000000); //object(lamppost3)(48)
	CreateDynamicObject(1226,174.86782837,-1416.77770996,47.69363785,0.00000000,0.00000000,0.00000000); //object(lamppost3)(49)
	CreateDynamicObject(1226,156.78353882,-1407.70458984,48.74791718,0.00000000,0.00000000,0.00000000); //object(lamppost3)(50)
	CreateDynamicObject(1226,162.90936279,-1412.39550781,47.84764099,0.00000000,0.00000000,0.00000000); //object(lamppost3)(51)
	CreateDynamicObject(1226,199.79792786,-1387.20056152,51.49699402,0.00000000,0.00000000,0.00000000); //object(lamppost3)(52)
	CreateDynamicObject(1226,209.19456482,-1350.32641602,53.72365570,0.00000000,0.00000000,0.00000000); //object(lamppost3)(53)
	CreateDynamicObject(1226,244.98016357,-1316.28820801,56.83303833,0.00000000,0.00000000,0.00000000); //object(lamppost3)(54)
	CreateDynamicObject(1226,263.70257568,-1335.07800293,56.10049820,0.00000000,0.00000000,0.00000000); //object(lamppost3)(55)
	CreateDynamicObject(1226,331.85501099,-1290.14782715,58.14426804,0.00000000,0.00000000,0.00000000); //object(lamppost3)(56)
	CreateDynamicObject(1226,396.85260010,-1233.72705078,54.66538239,0.00000000,0.00000000,0.00000000); //object(lamppost3)(57)
	CreateDynamicObject(1226,569.62512207,-1192.02380371,52.10385132,0.00000000,0.00000000,0.00000000); //object(lamppost3)(58)
	CreateDynamicObject(1226,605.11627197,-1109.27514648,51.39933395,0.00000000,0.00000000,0.00000000); //object(lamppost3)(59)
	CreateDynamicObject(1226,608.32690430,-1106.41491699,51.13420105,0.00000000,0.00000000,0.00000000); //object(lamppost3)(60)
	CreateDynamicObject(1226,601.10693359,-1131.79602051,50.25518799,0.00000000,0.00000000,0.00000000); //object(lamppost3)(61)
	CreateDynamicObject(1226,629.42877197,-1115.62109375,49.59315491,0.00000000,0.00000000,0.00000000); //object(lamppost3)(62)
	CreateDynamicObject(1226,627.21807861,-1094.34558105,52.37442017,0.00000000,0.00000000,0.00000000); //object(lamppost3)(63)
	CreateDynamicObject(1226,638.06823730,-1085.14221191,50.89460373,0.00000000,0.00000000,0.00000000); //object(lamppost3)(64)
	CreateDynamicObject(1226,644.24914551,-1080.70812988,51.09255219,0.00000000,0.00000000,0.00000000); //object(lamppost3)(65)
	CreateDynamicObject(1226,662.54431152,-1054.29650879,52.67029572,0.00000000,0.00000000,0.00000000); //object(lamppost3)(66)
	CreateDynamicObject(1226,681.15325928,-1032.92687988,53.87639999,0.00000000,0.00000000,0.00000000); //object(lamppost3)(67)
	CreateDynamicObject(1226,686.08062744,-1015.45880127,54.99857330,0.00000000,0.00000000,0.00000000); //object(lamppost3)(68)
	CreateDynamicObject(1226,703.80584717,-990.39703369,55.07268143,0.00000000,0.00000000,0.00000000); //object(lamppost3)(69)
	CreateDynamicObject(1226,716.70379639,-970.23114014,57.13665390,0.00000000,0.00000000,0.00000000); //object(lamppost3)(70)
	CreateDynamicObject(1226,726.88543701,-956.86950684,58.35350037,0.00000000,0.00000000,0.00000000); //object(lamppost3)(71)
	CreateDynamicObject(1226,739.66864014,-941.53106689,58.45489502,0.00000000,0.00000000,0.00000000); //object(lamppost3)(72)
	CreateDynamicObject(1226,830.67559814,-878.52990723,73.00762939,0.00000000,0.00000000,0.00000000); //object(lamppost3)(73)
	CreateDynamicObject(1226,836.27386475,-877.49206543,71.25066376,0.00000000,0.00000000,0.00000000); //object(lamppost3)(74)
	CreateDynamicObject(1226,834.48748779,-864.59362793,72.08514404,0.00000000,0.00000000,0.00000000); //object(lamppost3)(75)
	CreateDynamicObject(1226,858.95898438,-856.17224121,79.80172729,0.00000000,0.00000000,0.00000000); //object(lamppost3)(76)
	CreateDynamicObject(1226,864.87829590,-853.76831055,80.17848969,0.00000000,0.00000000,0.00000000); //object(lamppost3)(77)
	CreateDynamicObject(1226,925.51550293,-842.95330811,96.64979553,0.00000000,0.00000000,0.00000000); //object(lamppost3)(78)
	CreateDynamicObject(1226,929.57543945,-840.57812500,96.97010803,0.00000000,0.00000000,0.00000000); //object(lamppost3)(79)
	CreateDynamicObject(1226,934.36657715,-837.99517822,97.35578918,0.00000000,0.00000000,0.00000000); //object(lamppost3)(80)
	CreateDynamicObject(1226,992.07208252,-794.15911865,103.50201416,0.00000000,0.00000000,0.00000000); //object(lamppost3)(81)
	CreateDynamicObject(1226,998.82867432,-787.65771484,103.39389038,0.00000000,0.00000000,0.00000000); //object(lamppost3)(82)
	CreateDynamicObject(1226,1019.83349609,-777.18096924,105.69866943,0.00000000,0.00000000,0.00000000); //object(lamppost3)(83)
	CreateDynamicObject(1226,1020.45721436,-794.48364258,104.88574219,0.00000000,0.00000000,0.00000000); //object(lamppost3)(84)
	CreateDynamicObject(1226,1076.64538574,-778.01989746,110.48265076,0.00000000,0.00000000,0.00000000); //object(lamppost3)(85)
	CreateDynamicObject(1226,1080.80908203,-777.01391602,110.91291809,0.00000000,0.00000000,0.00000000); //object(lamppost3)(86)
	CreateDynamicObject(1226,1073.84216309,-766.51513672,110.37097931,0.00000000,0.00000000,0.00000000); //object(lamppost3)(87)
	CreateDynamicObject(1226,173.37011719,-1182.13574219,56.69085693,0.00000000,0.00000000,123.06884766); //object(lamppost3)(89)
	CreateDynamicObject(1226,156.87004089,-1194.14184570,54.83742142,0.00000000,0.00000000,123.06884766); //object(lamppost3)(90)
	//drift island
	//AddStaticVehicle(562,-872.23309326,558.36602783,5.54981613,0.00000000,-1,-1); //Elegy
	//AddStaticVehicle(562,-876.05651855,558.42041016,5.54981613,0.00000000,-1,-1); //Elegy
	//AddStaticVehicle(562,-872.47137451,565.15521240,5.54981613,0.00000000,-1,-1); //Elegy
	//AddStaticVehicle(562,-875.70642090,564.84960938,5.54981613,0.00000000,-1,-1); //Elegy
	//AddStaticVehicle(475,-885.82690430,574.75878906,4.69626617,0.00000000,-1,-1); //Sabre
	//AddStaticVehicle(475,-881.63806152,574.61071777,4.94626617,0.00000000,-1,-1); //Sabre
	//AddStaticVehicle(475,-878.24597168,574.48107910,4.94626617,0.00000000,-1,-1); //Sabre
	//AddStaticVehicle(555,-884.99554443,560.31231689,5.82664061,0.00000000,-1,-1); //Windsor
	//AddStaticVehicle(555,-881.24176025,560.38562012,6.57664061,0.00000000,-1,-1); //Windsor
	//AddStaticVehicle(555,-882.92230225,567.04278564,5.57664061,0.00000000,-1,-1); //Windsor
	CreateDynamicObject(10946,-828.62701416,506.04324341,3.62499857,0.00000000,0.00000000,0.00000000); //object(fuuuuuuuck_sfs)(1)
	CreateDynamicObject(10946,-828.51562500,553.94531250,3.66345406,0.00000000,0.00000000,180.10986328); //object(fuuuuuuuck_sfs)(4)
	CreateDynamicObject(3281,-879.90875244,549.58843994,3.06702852,0.00000000,0.00000000,65.50500488); //object(mtb_banner1)(3)
	CreateDynamicObject(3281,-875.91796875,554.52636719,3.06702852,0.00000000,0.00000000,0.00000000); //object(mtb_banner1)(4)
	CreateDynamicObject(7834,-856.28125000,539.85351562,6.03849077,0.00000000,0.00000000,179.36279297); //object(vegasnfrates08)(1)
	CreateDynamicObject(7834,-828.83636475,547.26965332,6.03849077,0.00000000,0.00000000,90.39276123); //object(vegasnfrates08)(2)
	CreateDynamicObject(8341,-794.98828125,519.85742188,5.51940107,0.00000000,0.00000000,359.71984863); //object(vgsfrates12)(1)
	CreateDynamicObject(8883,-831.15917969,517.71289062,5.47404718,0.00000000,0.00000000,0.00000000); //object(vgsefrght01)(2)
	CreateDynamicObject(8884,-800.68316650,494.16351318,5.47404718,0.00000000,0.00000000,89.79501343); //object(vgsefrght02)(3)
	CreateDynamicObject(8884,-855.20336914,488.65161133,5.47404718,0.00000000,0.00000000,89.79125977); //object(vgsefrght02)(4)
	CreateDynamicObject(8884,-856.76379395,505.45642090,5.52404737,0.00000000,359.96691895,179.65942383); //object(vgsefrght02)(5)
	CreateDynamicObject(8886,-883.17663574,513.56030273,5.47404718,0.00000000,0.00000000,288.53997803); //object(vgsefrght04)(10)
	CreateDynamicObject(7516,-798.32025146,567.57519531,6.03654671,0.00000000,0.00000000,269.93994141); //object(vegasnfrates02)(1)
	CreateDynamicObject(3281,-795.38513184,539.21405029,2.99202824,0.00000000,0.00000000,89.08041382); //object(mtb_banner1)(6)
	CreateDynamicObject(3281,-844.68267822,522.26385498,3.06702852,0.00000000,0.00000000,0.41198730); //object(mtb_banner1)(6)
	CreateDynamicObject(3281,-827.07965088,507.52645874,3.06702852,0.00000000,0.00000000,91.07714844); //object(mtb_banner1)(6)
	CreateDynamicObject(3281,-795.33911133,542.80328369,2.99202824,0.00000000,0.00000000,89.07714844); //object(mtb_banner1)(6)
	CreateDynamicObject(3281,-843.79852295,557.08099365,3.06702852,0.00000000,0.00000000,179.63714600); //object(mtb_banner1)(6)
	CreateDynamicObject(3281,-795.35058594,555.57910156,2.96702814,0.00000000,0.00000000,89.07714844); //object(mtb_banner1)(6)
	CreateDynamicObject(3281,-795.29101562,546.39062500,2.99202824,0.00000000,0.00000000,89.07714844); //object(mtb_banner1)(6)
	CreateDynamicObject(3281,-810.27996826,557.50030518,3.06702852,0.00000000,0.00000000,179.32122803); //object(mtb_banner1)(6)
	CreateDynamicObject(3281,-815.69641113,562.95861816,3.06702852,0.00000000,0.00000000,89.57507324); //object(mtb_banner1)(6)
	CreateDynamicObject(3281,-806.68719482,557.52380371,3.06702852,0.00000000,0.00000000,182.09680176); //object(mtb_banner1)(6)
	CreateDynamicObject(3281,-876.77081299,510.32287598,3.06702852,0.00000000,0.00000000,0.41198730); //object(mtb_banner1)(6)
	CreateDynamicObject(3281,-841.08685303,522.25122070,3.06702852,0.00000000,0.00000000,0.41198730); //object(mtb_banner1)(6)
	CreateDynamicObject(3281,-837.51141357,522.22534180,3.06702852,0.00000000,0.00000000,0.41198730); //object(mtb_banner1)(6)
	CreateDynamicObject(3281,-865.96020508,527.84826660,3.06702852,0.00000000,0.00000000,269.83520508); //object(mtb_banner1)(6)
	CreateDynamicObject(3281,-864.19494629,522.47637939,3.06702852,0.00000000,0.00000000,0.10913086); //object(mtb_banner1)(6)
	CreateDynamicObject(3281,-856.99652100,522.41497803,3.06702852,0.00000000,0.00000000,359.93408203); //object(mtb_banner1)(6)
	CreateDynamicObject(3281,-860.58874512,522.44158936,3.06702852,0.00000000,0.00000000,359.93408203); //object(mtb_banner1)(6)
	CreateDynamicObject(3281,-878.42578125,552.85742188,3.06702852,0.00000000,0.00000000,65.50048828); //object(mtb_banner1)(3)
	CreateDynamicObject(3281,-881.40631104,546.31854248,3.06702852,0.00000000,0.00000000,65.50048828); //object(mtb_banner1)(3)
	CreateDynamicObject(3281,-873.15686035,510.34448242,3.06702852,0.00000000,0.00000000,0.41198730); //object(mtb_banner1)(6)
	CreateDynamicObject(3281,-804.91796875,484.81933594,3.06702852,0.00000000,0.00000000,89.07714844); //object(mtb_banner1)(6)
	CreateDynamicObject(3281,-827.04467773,516.01562500,3.06702852,0.00000000,0.00000000,91.07666016); //object(mtb_banner1)(6)
	CreateDynamicObject(3281,-827.04467773,516.01562500,3.06702852,0.00000000,0.00000000,91.07666016); //object(mtb_banner1)(6)
	CreateDynamicObject(3281,-865.94238281,524.28808594,3.06702852,0.00000000,0.00000000,269.83520508); //object(mtb_banner1)(6)
	CreateDynamicObject(3281,-872.32781982,554.51379395,3.06702852,0.00000000,0.00000000,0.00000000); //object(mtb_banner1)(4)
	CreateDynamicObject(3281,-870.50073242,556.29779053,3.06702852,0.00000000,0.00000000,89.59002686); //object(mtb_banner1)(4)
	CreateDynamicObject(3281,-882.16632080,542.88720703,3.06702852,0.00000000,0.00000000,89.58801270); //object(mtb_banner1)(4)
	CreateDynamicObject(3281,-870.47595215,563.45086670,3.06702852,0.00000000,0.00000000,89.58801270); //object(mtb_banner1)(4)
	CreateDynamicObject(3281,-870.41748047,567.02075195,3.06702852,0.00000000,0.00000000,89.58801270); //object(mtb_banner1)(4)
	CreateDynamicObject(3281,-870.47363281,559.87792969,3.06702852,0.00000000,0.00000000,89.58801270); //object(mtb_banner1)(4)
	CreateDynamicObject(3281,-882.17529297,539.22534180,3.06702852,0.00000000,0.00000000,89.58801270); //object(mtb_banner1)(4)
	CreateDynamicObject(3281,-882.18383789,535.57525635,3.06702852,0.00000000,0.00000000,89.58801270); //object(mtb_banner1)(4)
	CreateDynamicObject(3281,-882.19470215,531.89697266,3.06702852,0.00000000,0.00000000,89.58801270); //object(mtb_banner1)(4)
	CreateDynamicObject(3281,-882.22271729,528.30895996,3.06702852,0.00000000,0.00000000,89.58801270); //object(mtb_banner1)(4)
	CreateDynamicObject(3281,-882.25915527,524.72393799,3.06702852,0.00000000,0.00000000,89.58801270); //object(mtb_banner1)(4)
	CreateDynamicObject(3281,-882.30371094,521.12176514,3.06702852,0.00000000,0.00000000,89.58801270); //object(mtb_banner1)(4)
	CreateDynamicObject(17969,-843.67144775,482.30874634,3.36633110,0.00000000,0.00000000,269.71997070); //object(hub_graffitti)(1)
	CreateDynamicObject(3463,-875.89654541,508.95614624,2.04626656,0.00000000,0.00000000,0.00000000); //object(vegaslampost2)(1)
	CreateDynamicObject(3463,-865.21893311,523.03497314,2.04626656,0.00000000,0.00000000,0.00000000); //object(vegaslampost2)(2)
	CreateDynamicObject(3463,-870.59893799,555.32873535,2.04626656,0.00000000,0.00000000,0.00000000); //object(vegaslampost2)(3)
	CreateDynamicObject(3463,-815.11834717,558.34973145,2.04626656,0.00000000,0.00000000,0.00000000); //object(vegaslampost2)(4)
	CreateDynamicObject(3463,-831.67974854,507.75546265,2.04626656,0.00000000,0.00000000,0.00000000); //object(vegaslampost2)(5)
	CreateDynamicObject(3281,-815.65167236,566.54919434,3.06702852,0.00000000,0.00000000,89.57153320); //object(mtb_banner1)(6)
	CreateDynamicObject(3281,-815.68572998,559.37622070,3.06702852,0.00000000,0.00000000,90.80657959); //object(mtb_banner1)(6)
	CreateDynamicObject(3281,-813.88464355,557.57427979,3.06702852,0.00000000,0.00000000,178.89514160); //object(mtb_banner1)(6)
	CreateDynamicObject(3281,-803.10552979,557.63604736,3.06702852,0.00000000,0.00000000,182.09289551); //object(mtb_banner1)(6)
	CreateDynamicObject(16092,-874.37475586,531.03796387,2.04626560,0.00000000,0.00000000,89.84002686); //object(des_pipestrut05)(1)
	CreateDynamicObject(7655,-855.11517334,519.67895508,8.23618698,0.00000000,358.01501465,85.35501099); //object(bunting06)(1)
	CreateDynamicObject(7655,-816.56640625,499.22656250,8.52464199,0.00000000,0.00000000,0.00000000); //object(bunting06)(2)
	CreateDynamicObject(7655,-816.56640625,499.22656250,8.52464199,0.00000000,0.00000000,0.00000000); //object(bunting06)(3)
	CreateDynamicObject(7655,-806.27667236,558.01910400,9.02464199,0.00000000,0.00000000,55.58001709); //object(bunting06)(4)
	CreateDynamicObject(1215,-866.26843262,542.40991211,2.61058974,0.00000000,0.00000000,0.00000000); //object(bollardlight)(1)
	CreateDynamicObject(1215,-856.10211182,557.31353760,2.61058974,0.00000000,0.00000000,0.00000000); //object(bollardlight)(2)
	CreateDynamicObject(1215,-826.43847656,557.30108643,2.69885683,0.00000000,0.00000000,0.00000000); //object(bollardlight)(3)
	CreateDynamicObject(1215,-816.13861084,577.79534912,2.61058974,0.00000000,0.00000000,0.00000000); //object(bollardlight)(4)
	CreateDynamicObject(1215,-811.31970215,547.38061523,2.61058974,0.00000000,0.00000000,0.00000000); //object(bollardlight)(5)
	CreateDynamicObject(1215,-800.82348633,557.60620117,2.61058974,0.00000000,0.00000000,0.00000000); //object(bollardlight)(6)
	CreateDynamicObject(1215,-795.39288330,553.72106934,2.61058974,0.00000000,0.00000000,0.00000000); //object(bollardlight)(7)
	CreateDynamicObject(1215,-795.34765625,548.23144531,2.61058974,0.00000000,0.00000000,0.00000000); //object(bollardlight)(8)
	CreateDynamicObject(1215,-795.17413330,522.56097412,2.57213426,0.00000000,0.00000000,0.00000000); //object(bollardlight)(9)
	CreateDynamicObject(1215,-794.74005127,537.73968506,2.61058974,0.00000000,0.00000000,0.00000000); //object(bollardlight)(10)
	CreateDynamicObject(1215,-804.97058105,522.35491943,2.57213426,0.00000000,0.00000000,0.00000000); //object(bollardlight)(11)
	CreateDynamicObject(1215,-811.37390137,537.40319824,2.61058974,0.00000000,0.00000000,0.00000000); //object(bollardlight)(12)
	CreateDynamicObject(1215,-827.64764404,520.73028564,2.57213426,0.00000000,0.00000000,0.00000000); //object(bollardlight)(13)
	CreateDynamicObject(1215,-804.23773193,505.63381958,2.57213426,0.00000000,0.00000000,0.00000000); //object(bollardlight)(14)
	CreateDynamicObject(1215,-804.74291992,487.22183228,2.57213426,0.00000000,0.00000000,0.00000000); //object(bollardlight)(15)
	CreateDynamicObject(1215,-804.85107422,482.36691284,2.57213426,0.00000000,0.00000000,0.00000000); //object(bollardlight)(16)
	CreateDynamicObject(1215,-826.78521729,496.16918945,2.57213426,0.00000000,0.00000000,0.00000000); //object(bollardlight)(17)
	CreateDynamicObject(1215,-836.31066895,496.32916260,2.57213426,0.00000000,0.00000000,0.00000000); //object(bollardlight)(18)
	CreateDynamicObject(1215,-850.92242432,500.08834839,2.57213426,0.00000000,0.00000000,0.00000000); //object(bollardlight)(19)
	CreateDynamicObject(1215,-850.25097656,510.27239990,2.83612537,0.00000000,0.00000000,0.00000000); //object(bollardlight)(20)
	CreateDynamicObject(1215,-868.24896240,509.97341919,2.57213426,0.00000000,0.00000000,0.00000000); //object(bollardlight)(21)
	CreateDynamicObject(1215,-881.43817139,519.29779053,2.57213426,0.00000000,0.00000000,0.00000000); //object(bollardlight)(22)
	CreateDynamicObject(1215,-866.43432617,527.49578857,2.57213426,0.00000000,0.00000000,0.00000000); //object(bollardlight)(23)
	CreateDynamicObject(1215,-870.44854736,554.38629150,2.61058974,0.00000000,0.00000000,0.00000000); //object(bollardlight)(24)
	CreateDynamicObject(1262,-877.97302246,530.29803467,9.51682377,0.00000000,0.00000000,182.62005615); //object(mtraffic4)(1)
	CreateDynamicObject(1262,-869.95751953,530.01940918,9.51682377,0.00000000,0.00000000,182.61474609); //object(mtraffic4)(3)
	CreateDynamicObject(8397,-873.20416260,492.22293091,12.00781059,0.00000000,0.00000000,0.00000000); //object(luxorpillar01_lvs)(1)
	CreateDynamicObject(12943,-787.24011230,541.83032227,1.69626582,0.00000000,0.00000000,359.00000000); //object(sw_shed07)(1)
	CreateDynamicObject(1215,-794.93920898,538.20513916,2.61058974,0.00000000,0.00000000,0.00000000); //object(bollardlight)(8)
	CreateDynamicObject(1215,-779.63616943,545.42675781,2.61058974,0.00000000,0.00000000,0.00000000); //object(bollardlight)(8)
	CreateDynamicObject(1215,-779.55822754,537.95281982,2.61058974,0.00000000,0.00000000,0.00000000); //object(bollardlight)(8)
	CreateDynamicObject(16151,-791.45446777,539.14422607,2.34626746,0.00000000,0.00000000,270.67498779); //object(ufo_bar)(1)
	CreateDynamicObject(1667,-789.03564453,540.13610840,3.09026527,0.00000000,0.00000000,1.98498535); //object(propwineglass1)(1)
	CreateDynamicObject(1667,-789.72967529,540.07641602,3.06526518,0.00000000,0.00000000,0.00000000); //object(propwineglass1)(2)
	CreateDynamicObject(643,-788.62548828,544.62390137,2.51673794,0.00000000,0.00000000,0.00000000); //object(kb_chr_tbl_test)(1)
	CreateDynamicObject(643,-783.73687744,539.64605713,2.51673794,0.00000000,0.00000000,0.00000000); //object(kb_chr_tbl_test)(2)
	CreateDynamicObject(1670,-788.66735840,544.53894043,2.91681790,0.00000000,0.00000000,0.00000000); //object(propcollecttable)(1)
	CreateDynamicObject(1775,-785.96502686,545.13684082,3.14330292,0.00000000,0.00000000,0.00000000); //object(cj_sprunk1)(1)
	CreateDynamicObject(2837,-783.33343506,544.15014648,2.91681790,0.00000000,0.00000000,0.00000000); //object(gb_takeaway02)(1)
	CreateDynamicObject(643,-783.31054688,544.22851562,2.51673794,0.00000000,0.00000000,0.00000000); //object(kb_chr_tbl_test)(4)
	CreateDynamicObject(2860,-784.04022217,539.63348389,2.93340707,0.00000000,0.00000000,0.00000000); //object(gb_kitchtakeway05)(1)
	CreateDynamicObject(3515,-775.23632812,554.06304932,4.01647377,0.00000000,0.00000000,0.00000000); //object(vgsfountain)(1)
	CreateDynamicObject(7388,-782.11352539,536.15417480,2.04626656,0.00000000,0.00000000,0.00000000); //object(vrockpole)(1)
	CreateDynamicObject(13562,-884.07757568,513.98236084,9.11369133,0.00000000,0.00000000,0.00000000); //object(bigsprunkpole)(1)
	CreateDynamicObject(2672,-784.44409180,566.51025391,2.32572865,0.00000000,0.00000000,0.00000000); //object(proc_rubbish_4)(1)


	//------ Ниже все тачки мода, в этой версии исправлены баги теперь они расставлены ровно :D

	AddStaticVehicle(415,1593.82390000,1448.42270000,10.60020000,102.40010000,11,1); //Cheetah
	AddStaticVehicle(411,1594.69800000,1444.89500000,10.55570000,101.44390000,10,66); //Infernus
	AddStaticVehicle(562,1594.60250000,1439.97900000,10.48690000,274.85180000,45,39); //Elegy
	AddStaticVehicle(429,1594.57210000,1436.91420000,10.50840000,275.52860000,74,6); //Banshee
	AddStaticVehicle(541,1910.00590000,-2235.91580000,13.13200000,184.10440000,61,47); //Bullet
	AddStaticVehicle(558,1913.60600000,-2236.34620000,13.14200000,182.27300000,41,104); //Uranus
	AddStaticVehicle(402,1918.65500000,-2234.89330000,13.37840000,185.08520000,121,45); //Buffalo
	AddStaticVehicle(400,1924.80910000,-2234.69750000,13.58960000,183.85380000,39,67); //Landstalker
	AddStaticVehicle(429,-1324.89440000,-205.02600000,13.83080000,225.67620000,99,36); //Banshee
	AddStaticVehicle(565,-1329.95720000,-210.30780000,13.72870000,225.61770000,77,15); //Flash
	AddStaticVehicle(475,-1335.64000000,-216.51620000,13.90540000,223.80900000,101,121); //Sabre
	AddStaticVehicle(410,-1341.14890000,-221.94610000,13.80220000,225.56520000,87,42); //Manana
	AddStaticVehicle(507,-1347.11020000,-227.28990000,13.96760000,226.36650000,90,125); //Elegant
	AddStaticVehicle(422,9.10650000,1165.50660000,19.58550000,2.12810000,101,25); //Bobcat
	AddStaticVehicle(463,19.80590000,1163.71030000,19.15040000,346.33260000,11,11); //Freeway
	AddStaticVehicle(463,12.57400000,1232.28480000,18.88220000,121.86700000,22,22); //Freeway
	AddStaticVehicle(434,-110.84730000,1133.71130000,19.70910000,359.70000000,2,2); //Hotknife
	AddStaticVehicle(586,69.46330000,1217.01890000,18.33040000,158.93450000,10,1); //Wayfarer
	AddStaticVehicle(586,-199.41850000,1223.04050000,19.26240000,176.70010000,25,1); //Wayfarer
	AddStaticVehicle(605,-340.25980000,1177.48460000,19.55650000,182.61760000,43,8); //Sadler
	AddStaticVehicle(476,325.41210000,2538.59990000,17.51840000,181.29640000,71,77); //Rustler
	AddStaticVehicle(476,291.09750000,2540.04100000,17.52760000,182.72060000,7,6); //Rustler
	AddStaticVehicle(576,384.23650000,2602.17630000,16.09260000,192.48580000,72,1); //Tornado
	AddStaticVehicle(586,423.80120000,2541.68700000,15.97080000,338.24260000,10,1); //Wayfarer
	AddStaticVehicle(586,-244.00470000,2724.54390000,62.20770000,51.58250000,10,1); //Wayfarer
	AddStaticVehicle(586,-311.14140000,2659.43290000,62.45130000,310.96010000,27,1); //Wayfarer
	AddStaticVehicle(406,547.46330000,843.02040000,-39.84060000,285.29480000,1,1); //Dumper
	AddStaticVehicle(406,625.19790000,828.98730000,-41.44970000,71.33600000,1,1); //Dumper
	AddStaticVehicle(486,680.79970000,919.05100000,-40.47350000,105.91450000,1,1); //Dozer
	AddStaticVehicle(486,674.39940000,927.75180000,-40.60870000,128.61160000,1,1); //Dozer
	AddStaticVehicle(543,596.80640000,866.25780000,-43.26170000,186.83590000,67,8); //Sadler
	AddStaticVehicle(543,835.08380000,836.83700000,11.87390000,14.89200000,8,90); //Sadler
	AddStaticVehicle(549,843.18930000,838.80930000,12.51770000,18.23480000,79,39); //Tampa
	AddStaticVehicle(605,319.38030000,740.24040000,6.78140000,271.25930000,8,90); //Sadler
	AddStaticVehicle(400,-235.97670000,1045.86230000,19.81580000,180.08060000,75,1); //Landstalker
	AddStaticVehicle(599,-211.59400000,998.98570000,19.84370000,265.49350000,-1,1); //Police Ranger
	AddStaticVehicle(422,-304.06200000,1024.11110000,19.57140000,94.18120000,96,25); //Bobcat
	AddStaticVehicle(588,-290.22290000,1317.02760000,54.18710000,81.75290000,1,1); //Hotdog
	AddStaticVehicle(424,-330.23990000,1514.30220000,75.13880000,179.15140000,2,2); //BF Injection
	AddStaticVehicle(451,-290.31450000,1567.15340000,75.06540000,133.16940000,61,61); //Turismo
	AddStaticVehicle(470,280.49140000,1945.61430000,17.63170000,310.32780000,43,-1); //Patriot
	AddStaticVehicle(470,272.28620000,1949.47130000,17.63670000,285.97140000,43,-1); //Patriot
	AddStaticVehicle(470,271.61220000,1961.23860000,17.63730000,251.90810000,43,-1); //Patriot
	AddStaticVehicle(470,279.87050000,1966.23620000,17.64360000,228.47090000,43,-1); //Patriot
	AddStaticVehicle(548,292.23170000,1923.64400000,19.28980000,235.33790000,1,1); //Cargobob
	AddStaticVehicle(433,277.64370000,1985.75590000,18.07720000,270.40790000,43,-1); //Barracks
	AddStaticVehicle(433,277.44770000,1994.83290000,18.07730000,267.73780000,43,-1); //Barracks
	AddStaticVehicle(568,-441.34380000,2215.70260000,42.24890000,191.79530000,41,29); //Bandito
	AddStaticVehicle(568,-422.29560000,2225.26120000,42.24650000,0.06160000,41,29); //Bandito
	AddStaticVehicle(568,-371.79730000,2234.55270000,42.34970000,285.94810000,41,29); //Bandito
	AddStaticVehicle(568,-360.11590000,2203.42720000,42.30390000,113.64460000,41,29); //Bandito
	AddStaticVehicle(468,-660.73850000,2315.26420000,138.38660000,358.76430000,6,6); //Sanchez
	AddStaticVehicle(460,-1029.26480000,2237.22170000,42.26790000,260.57320000,1,3); //Skimmer
	AddStaticVehicle(419,95.05680000,1056.55300000,13.40680000,192.14610000,13,76); //Esperanto
	AddStaticVehicle(429,114.74160000,1048.35170000,13.28900000,174.97520000,1,2); //Banshee
	AddStaticVehicle(466,124.24800000,1075.18350000,13.35120000,174.53340000,78,76); //Glendale
	AddStaticVehicle(411,-290.00650000,1759.49580000,42.41540000,89.75710000,116,1); //Infernus
	AddStaticVehicle(522,-302.56490000,1777.73490000,42.25140000,238.50390000,6,25); //NRG-500
	AddStaticVehicle(522,-302.96500000,1776.11520000,42.25880000,239.98740000,8,82); //NRG-500
	AddStaticVehicle(533,-301.04040000,1750.85170000,42.39660000,268.75850000,75,1); //Feltzer
	AddStaticVehicle(535,-866.17740000,1557.27000000,23.83190000,269.32630000,31,1); //Slamvan
	AddStaticVehicle(550,-799.30620000,1518.15560000,26.74880000,88.52950000,53,53); //Sunrise
	AddStaticVehicle(522,-867.86120000,1544.52820000,22.54190000,296.09230000,3,3); //NRG-500
	AddStaticVehicle(554,-904.29780000,1553.82690000,25.92290000,266.69850000,34,30); //Yosemite
	AddStaticVehicle(429,-237.71570000,2594.88040000,62.38280000,178.68020000,1,2); //Banshee
	AddStaticVehicle(431,-160.58150000,2693.71850000,62.20310000,89.41330000,47,74); //Bus
	AddStaticVehicle(463,-196.30120000,2774.43950000,61.47750000,303.84020000,22,22); //Freeway
	AddStaticVehicle(483,-204.18270000,2608.73680000,62.69560000,179.99140000,1,5); //Camper
	AddStaticVehicle(490,-295.47560000,2674.91410000,62.74340000,359.33780000,-1,-1); //FBI Rancher
	AddStaticVehicle(500,-301.52930000,2687.60130000,62.77230000,87.95090000,28,119); //Mesa
	AddStaticVehicle(500,-301.66990000,2680.32930000,62.73930000,89.79250000,13,119); //Mesa
	AddStaticVehicle(519,-1341.10790000,-254.37870000,15.07010000,321.63380000,1,1); //Shamal
	AddStaticVehicle(519,-1371.17750000,-232.39670000,15.06760000,315.60910000,1,1); //Shamal
	AddStaticVehicle(552,-1396.20280000,-196.82980000,13.84340000,286.27200000,56,56); //Utility
	AddStaticVehicle(552,-1312.45090000,-284.46920000,13.84170000,354.35460000,56,56); //Utility
	AddStaticVehicle(552,-1393.59950000,-521.07700000,13.84410000,187.13240000,56,56); //Utility
	AddStaticVehicle(513,-1355.66320000,-488.95620000,14.71570000,191.25470000,48,18); //Stunt
	AddStaticVehicle(513,-1374.45800000,-499.14620000,14.74820000,220.40570000,54,34); //Stunt
	AddStaticVehicle(583,1879.95940000,-2349.19190000,13.08750000,11.09920000,1,1); //Tug
	AddStaticVehicle(583,1620.96970000,-2431.07520000,13.09510000,126.33410000,1,1); //Tug
	AddStaticVehicle(583,1545.15640000,-2409.21140000,13.09530000,23.55810000,1,1); //Tug
	AddStaticVehicle(583,1656.37020000,-2651.79130000,13.08740000,352.76190000,1,1); //Tug
	AddStaticVehicle(519,1642.98500000,-2425.20630000,14.47440000,159.87450000,1,1); //Shamal
	AddStaticVehicle(519,1734.13110000,-2426.75630000,14.47340000,172.20360000,1,1); //Shamal
	AddStaticVehicle(415,-680.98820000,955.44950000,11.90320000,84.27540000,36,1); //Cheetah
	AddStaticVehicle(460,-816.39510000,2222.73750000,43.00450000,268.18610000,1,3); //Skimmer
	AddStaticVehicle(460,-94.68850000,455.40180000,1.57190000,250.54730000,1,3); //Skimmer
	AddStaticVehicle(460,1624.59010000,565.85680000,1.78170000,200.52920000,1,3); //Skimmer
	AddStaticVehicle(460,1639.35670000,572.27200000,1.53110000,206.61600000,1,3); //Skimmer
	AddStaticVehicle(460,2293.42190000,517.55140000,1.75370000,270.78890000,1,3); //Skimmer
	AddStaticVehicle(460,2354.46900000,518.52840000,1.74500000,270.22140000,1,3); //Skimmer
	AddStaticVehicle(460,772.42930000,2912.55790000,1.07530000,69.67060000,1,3); //Skimmer
	AddStaticVehicle(560,2133.07690000,1019.23660000,10.52590000,90.52650000,9,39); //Sultan
	AddStaticVehicle(560,2142.40230000,1408.56750000,10.52580000,0.36600000,17,1); //Sultan
	AddStaticVehicle(560,2196.33400000,1856.84690000,10.52570000,179.80700000,21,1); //Sultan
	AddStaticVehicle(560,2103.41460000,2069.15140000,10.52490000,270.14510000,33,-1); //Sultan
	AddStaticVehicle(560,2361.80420000,2210.99510000,10.38480000,178.73660000,37,-1); //Sultan
	AddStaticVehicle(560,-1993.24650000,241.53290000,34.87740000,310.01170000,41,29); //Sultan
	AddStaticVehicle(559,-1989.32350000,270.14470000,34.83210000,88.68220000,58,8); //Jester
	AddStaticVehicle(559,-1946.24160000,273.24820000,35.13020000,126.42000000,60,1); //Jester
	AddStaticVehicle(558,-1956.82570000,271.49410000,35.09840000,71.74990000,24,1); //Uranus
	AddStaticVehicle(562,-1952.88940000,258.86040000,40.70820000,51.71720000,17,1); //Elegy
	AddStaticVehicle(411,-1949.86890000,266.57590000,40.77760000,216.48820000,112,1); //Infernus
	AddStaticVehicle(429,-1988.03470000,305.42420000,34.85530000,87.07250000,2,1); //Banshee
	AddStaticVehicle(559,-1657.66600000,1213.61950000,6.90620000,282.69530000,13,8); //Jester
	AddStaticVehicle(560,-1658.37220000,1213.22360000,13.38060000,37.90520000,52,39); //Sultan
	AddStaticVehicle(558,-1660.89940000,1210.75890000,20.78750000,317.60980000,36,1); //Uranus
	AddStaticVehicle(550,-1645.24010000,1303.98830000,6.84820000,133.60130000,7,7); //Sunrise
	AddStaticVehicle(460,-1333.19600000,903.76600000,1.55680000,0.50950000,46,32); //Skimmer
	AddStaticVehicle(411,113.86110000,1068.61820000,13.33950000,177.13300000,116,1); //Infernus
	AddStaticVehicle(429,159.51990000,1185.11600000,14.73240000,85.57690000,1,2); //Banshee
	AddStaticVehicle(411,612.46780000,1694.41260000,6.71920000,302.55390000,75,1); //Infernus
	AddStaticVehicle(522,661.76090000,1720.98940000,6.56410000,19.12310000,6,25); //NRG-500
	AddStaticVehicle(522,660.05540000,1719.11870000,6.56420000,12.76990000,8,82); //NRG-500
	AddStaticVehicle(567,711.42070000,1947.52080000,5.40560000,179.38100000,90,96); //Savanna
	AddStaticVehicle(567,1031.84350000,1920.37260000,11.33690000,89.49780000,97,96); //Savanna
	AddStaticVehicle(567,1112.37540000,1747.87370000,10.69230000,270.92780000,102,114); //Savanna
	AddStaticVehicle(567,1641.68020000,1299.21130000,10.68690000,271.48910000,97,96); //Savanna
	AddStaticVehicle(567,2135.87570000,1408.45120000,10.68670000,180.45620000,90,96); //Savanna
	AddStaticVehicle(567,2262.26390000,1469.22020000,14.91770000,91.19190000,99,81); //Savanna
	AddStaticVehicle(567,2461.73800000,1345.53850000,10.69750000,0.93170000,114,1); //Savanna
	AddStaticVehicle(567,2804.43650000,1332.53480000,10.62830000,271.76820000,88,64); //Savanna
	AddStaticVehicle(560,2805.16850000,1361.40040000,10.45480000,270.23400000,17,1); //Sultan
	AddStaticVehicle(567,2633.98320000,2205.70610000,10.68680000,180.00760000,93,64); //Savanna
	AddStaticVehicle(567,2119.97510000,2049.31270000,10.54230000,180.19630000,93,64); //Savanna
	AddStaticVehicle(567,2785.02610000,-1835.03740000,9.68740000,226.98520000,93,64); //Savanna
	AddStaticVehicle(567,2787.89750000,-1876.25830000,9.69660000,0.58040000,99,81); //Savanna
	AddStaticVehicle(411,2771.29930000,-1841.56200000,9.48700000,20.76780000,116,1); //Infernus
	AddStaticVehicle(420,1713.93190000,1467.83540000,10.52190000,342.80060000,6,1); //Taxi
	AddStaticVehicle(522,2133.04830000,1009.00790000,10.38520000,90.43760000,6,25); //NRG-500
	AddStaticVehicle(481,1321.15330000,1253.77380000,13.83750000,6.35950000,6,25); //BMX
	AddStaticVehicle(481,1317.18970000,1254.08480000,13.84420000,0.59670000,6,25); //BMX
	AddStaticVehicle(557,1332.56100000,1780.66830000,10.39090000,263.48580000,6,25); //Monster B
	AddStaticVehicle(557,1336.91580000,1791.29260000,10.40010000,261.39500000,6,25); //Monster B
	AddStaticVehicle(522,1401.58370000,1771.16260000,10.38110000,176.89500000,6,25); //NRG-500
	AddStaticVehicle(522,1398.08850000,1771.51920000,10.39180000,180.19690000,6,25); //NRG-500
	AddStaticVehicle(522,1395.10670000,1771.13700000,10.38400000,180.49890000,6,25); //NRG-500
	AddStaticVehicle(560,-234.60820000,2595.38280000,62.27210000,179.23770000,6,25); //Sultan
	AddStaticVehicle(487,-251.61670000,2585.08540000,63.13540000,266.44870000,6,25); //Maverick
	AddStaticVehicle(448,2099.47880000,2205.17680000,10.39090000,4.44130000,6,25); //Pizzaboy
	AddStaticVehicle(448,2096.91550000,2206.33180000,10.38360000,350.46410000,6,25); //Pizzaboy
	AddStaticVehicle(448,2091.77690000,2206.29710000,10.39640000,359.86390000,6,25); //Pizzaboy
	AddStaticVehicle(448,2088.05220000,2206.16500000,10.39120000,10.78020000,6,25); //Pizzaboy
	AddStaticVehicle(420,2039.18050000,1554.73490000,10.43220000,359.68310000,123,1); //Taxi
	AddStaticVehicle(560,2039.26120000,1569.30070000,10.43530000,359.68360000,123,1); //Sultan
	AddStaticVehicle(411,2039.34920000,1585.19450000,10.43550000,359.68500000,123,1); //Infernus
	AddStaticVehicle(415,2039.41350000,1596.85670000,10.43480000,359.68470000,123,1); //Cheetah
	AddStaticVehicle(439,2039.22710000,1330.65970000,10.37790000,178.60810000,16,16); //Stallion
	AddStaticVehicle(415,2039.44930000,1339.80250000,10.37650000,178.60680000,16,16); //Cheetah
	AddStaticVehicle(411,2039.65940000,1348.42460000,10.37960000,178.60540000,16,16); //Infernus
	AddStaticVehicle(560,2038.01140000,996.25930000,10.39950000,178.32870000,11,1); //Sultan
	AddStaticVehicle(415,2038.17030000,1037.66760000,10.40340000,180.51130000,11,1); //Cheetah
	AddStaticVehicle(560,-2355.12260000,-1631.33200000,483.39360000,253.34210000,33,-1); //Sultan
	AddStaticVehicle(560,-2354.38570000,-1628.05350000,483.38400000,261.93240000,33,-1); //Sultan
	AddStaticVehicle(560,-2354.30570000,-1624.23750000,483.37300000,263.43820000,33,-1); //Sultan
	AddStaticVehicle(522,-2350.21260000,-1607.24110000,483.33000000,252.45620000,33,-1); //NRG-500
	AddStaticVehicle(522,-2350.00610000,-1603.75460000,483.32460000,257.52230000,33,-1); //NRG-500
	AddStaticVehicle(522,-2347.83670000,-1600.22110000,483.32480000,257.75700000,33,-1); //NRG-500
	AddStaticVehicle(560,-2352.99190000,-1620.90820000,483.36390000,268.83760000,33,-1); //Sultan
	AddStaticVehicle(560,-2351.82400000,-1616.73250000,483.35090000,269.04250000,33,-1); //Sultan
	AddStaticVehicle(522,-2346.75000000,-1596.58910000,483.30480000,255.61660000,33,-1); //NRG-500
	AddStaticVehicle(522,-2344.27610000,-1594.00940000,483.30420000,246.12440000,33,-1); //NRG-500
	AddStaticVehicle(522,-2343.24000000,-1590.28770000,483.28290000,248.16190000,33,-1); //NRG-500
	AddStaticVehicle(487,-2326.28100000,-1640.45700000,483.40810000,225.04900000,33,-1); //Maverick
	AddStaticVehicle(487,-2321.96730000,-1632.15030000,483.40740000,279.43330000,33,-1); //Maverick
	AddStaticVehicle(487,-2315.21240000,-1621.62660000,483.44420000,241.16950000,33,-1); //Maverick
	AddStaticVehicle(476,-2288.15840000,-1666.94410000,482.27520000,261.85230000,33,-1); //Rustler
	AddStaticVehicle(476,-2287.96610000,-1659.95910000,482.54390000,263.64080000,33,-1); //Rustler
	AddStaticVehicle(476,-2286.39040000,-1652.15880000,482.81020000,264.28890000,33,-1); //Rustler
	AddStaticVehicle(476,-2284.71580000,-1642.48330000,483.14690000,266.46190000,33,-1); //Rustler
	AddStaticVehicle(411,-2317.15380000,-1683.94170000,481.82550000,310.87830000,33,-1); //Infernus
	AddStaticVehicle(411,-2319.87720000,-1681.13760000,482.03490000,315.20930000,33,-1); //Infernus
	AddStaticVehicle(411,-2322.59010000,-1678.82670000,482.21850000,314.46060000,33,-1); //Infernus
	AddStaticVehicle(411,-2325.68600000,-1676.85950000,482.39190000,317.82270000,33,-1); //Infernus
	AddStaticVehicle(560,-1427.92680000,-301.47860000,13.72280000,230.74220000,123,1); //Sultan
	AddStaticVehicle(560,-1419.71250000,-309.82000000,13.72720000,221.24690000,123,1); //Sultan
	AddStaticVehicle(560,-1412.09360000,-318.95090000,13.72700000,215.14330000,123,1); //Sultan
	AddStaticVehicle(560,-1404.86680000,-329.97120000,13.72710000,211.29620000,123,1); //Sultan
	AddStaticVehicle(560,-1397.41590000,-347.43930000,13.72710000,200.90260000,123,1); //Sultan
	AddStaticVehicle(560,-1393.23860000,-366.66270000,13.72710000,188.78650000,123,1); //Sultan
	AddStaticVehicle(411,1411.33000000,-2313.19240000,13.27400000,179.15180000,64,64); //Infernus
	AddStaticVehicle(411,1407.96545410,-2313.64428711,13.27400017,179.85168457,64,64); //Infernus
	AddStaticVehicle(411,1404.68652344,-2313.67578125,13.27400017,178.16528320,64,64); //Infernus
	AddStaticVehicle(411,1410.59440000,-2261.52860000,13.27400000,0.50180000,64,64); //Infernus
	AddStaticVehicle(411,1406.83980000,-2261.82740000,13.27390000,358.79380000,64,64); //Infernus
	AddStaticVehicle(411,1403.84810000,-2261.42360000,13.27400000,0.54400000,64,64); //Infernus
	AddStaticVehicle(411,2206.79830000,1277.20510000,10.65840000,89.51370000,18,1); //Infernus
	AddStaticVehicle(560,2205.48540000,1281.21340000,10.65850000,93.36240000,18,1); //Sultan
	AddStaticVehicle(411,2205.16410000,1285.00170000,10.65870000,89.72320000,18,1); //Infernus
	AddStaticVehicle(560,2204.83060000,1288.80570000,10.65750000,91.31760000,18,1); //Sultan
	AddStaticVehicle(411,2203.70510000,1293.48710000,10.65890000,88.49650000,18,1); //Infernus
	AddStaticVehicle(487,2207.46510000,1316.05400000,10.65820000,90.40190000,18,1); //Maverick
	AddStaticVehicle(487,2207.66750000,1252.07430000,10.65880000,92.34950000,18,1); //Maverick
	AddStaticVehicle(416,1596.43650000,1839.23550000,10.65830000,359.59120000,18,1); //Ambulance
	AddStaticVehicle(416,1601.01460000,1839.23060000,10.65790000,0.66580000,18,1); //Ambulance
	AddStaticVehicle(416,1605.21130000,1839.12870000,10.66190000,358.97830000,18,1); //Ambulance
	AddStaticVehicle(416,1609.61100000,1839.03540000,10.65860000,0.61550000,18,1); //Ambulance
	AddStaticVehicle(407,1770.37710000,2072.13570000,10.51750000,182.73260000,83,36); //Firetruck
	AddStaticVehicle(407,1764.05470000,2070.53910000,10.51770000,184.69100000,83,36); //Firetruck
	AddStaticVehicle(407,1757.64940000,2070.12260000,10.51760000,180.94940000,83,36); //Firetruck
	AddStaticVehicle(407,1750.94370000,2070.35110000,10.51760000,180.83930000,83,36); //Firetruck
	AddStaticVehicle(406,2420.89310000,1931.11820000,5.71280000,271.42500000,83,36); //Dumper
	AddStaticVehicle(406,2421.17410000,1916.24690000,5.71290000,268.77880000,83,36); //Dumper
	AddStaticVehicle(486,2486.53390000,1923.30810000,9.46270000,358.52670000,83,36); //Dozer
	AddStaticVehicle(486,2486.93600000,1938.74280000,9.61960000,358.48340000,83,36); //Dozer
	AddStaticVehicle(486,2487.30420000,1952.72460000,10.11560000,358.46100000,83,36); //Dozer
	AddStaticVehicle(490,1588.67800000,-1341.38810000,16.31620000,358.17160000,-1,-1); //FBI Rancher
	AddStaticVehicle(490,1556.76650000,-1319.87500000,16.31610000,271.65230000,-1,-1); //FBI Rancher
	AddStaticVehicle(490,1574.68020000,-1319.35820000,16.31020000,271.64720000,-1,-1); //FBI Rancher
	AddStaticVehicle(487,1544.32650000,-1353.31300000,329.30600000,269.00260000,8,8); //Maverick
	AddStaticVehicle(492,2499.77610000,-1655.20210000,13.25110000,84.12200000,16,16); //Greenwood
	AddStaticVehicle(517,2461.40480000,-1663.91630000,13.21580000,269.72620000,16,16); //Majestic
	AddStaticVehicle(492,2465.62480000,-1653.08560000,13.22430000,91.38650000,16,16); //Greenwood
	AddStaticVehicle(492,2443.16020000,-1642.55030000,13.28940000,182.47860000,16,16); //Greenwood
	AddStaticVehicle(492,2362.16552734,-1672.11437988,13.37829971,174.27740479,16,16); //Greenwood
	AddStaticVehicle(492,2329.56570000,-1676.89820000,14.15190000,90.70560000,16,16); //Greenwood
	AddStaticVehicle(466,1996.92070000,-1119.16890000,26.61280000,35.69530000,15,15); //Glendale
	AddStaticVehicle(491,1984.83410000,-1141.28090000,25.61290000,90.33180000,42,42); //Virgo
	AddStaticVehicle(492,2042.93070000,-1130.40700000,24.03010000,92.02310000,-1,-1); //Greenwood
	AddStaticVehicle(517,2078.01562500,-1135.26831055,23.81491852,1.69824219,5,5); //Majestic
	AddStaticVehicle(492,1987.68710000,-1275.55020000,23.65200000,0.05450000,5,5); //Greenwood
	AddStaticVehicle(466,1919.41960000,-1130.27210000,24.71200000,88.29690000,67,67); //Glendale
	AddStaticVehicle(517,1905.01420000,-1130.26600000,24.35120000,89.22190000,5,5); //Majestic
	AddStaticVehicle(416,2029.45760000,-1446.64160000,16.90540000,93.03800000,1,3); //Ambulance
	AddStaticVehicle(416,2001.18570000,-1430.76750000,15.02160000,179.84790000,1,3); //Ambulance
	AddStaticVehicle(416,2038.58310000,-1428.16860000,16.90720000,90.63590000,1,3); //Ambulance
	AddStaticVehicle(402,1776.03030000,-1888.79490000,13.21810000,179.36990000,15,15); //Buffalo
	AddStaticVehicle(492,1777.14710000,-1914.68310000,13.21900000,268.69490000,7,7); //Greenwood
	AddStaticVehicle(474,1803.89200000,-1933.26920000,13.21780000,89.86960000,111,111); //Hermes
	AddStaticVehicle(517,1803.87280000,-1919.55080000,13.22430000,88.92070000,15,15); //Majestic
	AddStaticVehicle(491,1803.81840000,-1913.55260000,13.22740000,89.34570000,1,1); //Virgo
	AddStaticVehicle(466,1844.63260000,-1870.92400000,13.21770000,180.84490000,-1,-1); //Glendale
	AddStaticVehicle(466,1834.95950000,-1870.66830000,13.21970000,0.53440000,9,9); //Glendale
	AddStaticVehicle(418,1735.12120000,-1859.94930000,13.32390000,269.57050000,49,49); //Moonbeam
	AddStaticVehicle(492,1815.53860000,-1771.38600000,13.37850000,178.56630000,15,15); //Greenwood
	AddStaticVehicle(593,1721.02510000,-2462.40840000,13.38620000,88.21840000,15,18); //Dodo
	AddStaticVehicle(593,1959.88450000,-2635.72360000,13.37850000,49.91830000,15,18); //Dodo
	AddStaticVehicle(405,2052.35110000,-1904.91380000,13.37860000,179.11710000,63,63); //Sentinel
	AddStaticVehicle(492,2065.74930000,-1904.69260000,13.37860000,181.31900000,15,15); //Greenwood
	AddStaticVehicle(410,2065.20460000,-1919.29140000,13.37860000,2.43120000,22,22); //Manana
	AddStaticVehicle(500,2094.77860000,-1815.35060000,13.21450000,269.40080000,7,7); //Mesa
	AddStaticVehicle(505,1978.40170000,-1727.70020000,15.80040000,91.31840000,7,7); //Rancher
	AddStaticVehicle(500,1928.61070000,-1795.09590000,13.20940000,92.65250000,15,15); //Mesa
	AddStaticVehicle(521,1945.58030000,-1380.01460000,18.40870000,206.19660000,22,22); //FCR-900
	AddStaticVehicle(481,1885.68900000,-1360.12560000,19.14060000,90.69430000,1,1); //BMX
	AddStaticVehicle(481,1885.77820000,-1363.66460000,19.14060000,90.69430000,-1,-1); //BMX
	AddStaticVehicle(481,1869.53020000,-1364.93740000,19.14060000,267.93570000,8,8); //BMX
	AddStaticVehicle(400,1423.00420000,-880.92240000,50.45960000,176.56140000,113,1); //Landstalker
	AddStaticVehicle(405,1528.66610000,-812.90700000,71.93930000,88.87210000,63,63); //Sentinel
	AddStaticVehicle(505,1320.84440000,-867.90800000,39.67040000,89.45420000,40,1); //Rancher
	AddStaticVehicle(492,1305.74520000,-916.89620000,39.08120000,86.46400000,11,11); //Greenwood
	AddStaticVehicle(410,1219.19150000,-873.32730000,42.98980000,102.97160000,22,22); //Manana
	AddStaticVehicle(500,1174.75790000,-921.29970000,43.42660000,284.09240000,7,7); //Mesa
	AddStaticVehicle(466,1088.14530000,-932.41630000,43.13210000,92.21170000,40,1); //Glendale
	AddStaticVehicle(418,996.09370000,-912.32840000,42.27200000,304.83320000,15,15); //Moonbeam
	AddStaticVehicle(505,996.38490000,-917.09380000,42.27190000,302.54200000,15,15); //Rancher
	AddStaticVehicle(491,997.35190000,-928.45090000,42.27210000,124.54770000,1,1); //Virgo
	AddStaticVehicle(402,822.54030000,-1030.25420000,25.17730000,125.71720000,15,15); //Buffalo
	AddStaticVehicle(521,773.64310000,-1212.82390000,13.65230000,232.57960000,40,1); //FCR-900
	AddStaticVehicle(458,668.20030000,-1274.58190000,13.55330000,357.47710000,65,65); //Solair
	AddStaticVehicle(567,996.19780000,-1104.24740000,23.92050000,271.87680000,3,3); //Savanna
	AddStaticVehicle(458,1022.42420000,-1052.60860000,31.70520000,3.58210000,100,100); //Solair
	AddStaticVehicle(517,1072.04160000,-1102.53080000,24.88160000,268.92130000,9,9); //Majestic
	AddStaticVehicle(517,1210.48740000,-1173.29330000,22.69420000,180.41130000,39,39); //Majestic
	AddStaticVehicle(400,1221.66090000,-1197.32470000,20.40760000,0.77210000,60,60); //Landstalker
	AddStaticVehicle(500,1276.53500000,-1098.40870000,26.12450000,90.40770000,1,1); //Mesa
	AddStaticVehicle(402,1226.51550000,-988.89870000,43.57280000,2.76110000,-1,-1); //Buffalo
	AddStaticVehicle(418,1375.85250000,-1128.71110000,24.50650000,89.64340000,-1,-1); //Moonbeam
	AddStaticVehicle(419,1389.81350000,-1165.48970000,23.91250000,179.34000000,81,81); //Esperanto
	AddStaticVehicle(410,1398.93740000,-1164.95360000,23.92220000,1.21030000,7,7); //Manana
	AddStaticVehicle(466,1469.98030000,-1232.77530000,13.80050000,88.23420000,41,41); //Glendale
	AddStaticVehicle(418,1277.31680000,-1249.45730000,14.40210000,183.92560000,7,7); //Moonbeam
	AddStaticVehicle(542,1283.03250000,-1319.05470000,13.51200000,118.79680000,63,63); //Clover
	AddStaticVehicle(418,1093.92750000,-1375.65910000,13.87360000,60.99740000,26,26); //Moonbeam
	AddStaticVehicle(400,1010.01560000,-1366.69780000,13.43900000,270.99550000,40,1); //Landstalker
	AddStaticVehicle(421,967.24220000,-1355.99600000,13.44240000,0.35000000,32,32); //Washington
	AddStaticVehicle(421,955.23260000,-1367.04590000,13.57330000,179.28410000,7,7); //Washington
	AddStaticVehicle(402,911.60820000,-1368.85440000,13.38240000,3.16260000,26,26); //Buffalo
	AddStaticVehicle(405,922.79100000,-1368.39260000,13.38230000,181.87350000,3,3); //Sentinel
	AddStaticVehicle(492,904.44270000,-1455.21850000,13.22380000,271.10470000,76,76); //Greenwood
	AddStaticVehicle(405,883.33200000,-1523.32070000,13.64700000,270.27820000,86,86); //Sentinel
	AddStaticVehicle(400,782.46370000,-1630.42810000,13.47520000,89.78970000,40,1); //Landstalker
	AddStaticVehicle(421,782.51120000,-1633.73330000,13.47520000,90.04420000,-1,-1); //Washington
	AddStaticVehicle(542,782.59260000,-1620.08590000,13.47520000,271.47850000,1,1); //Clover
	AddStaticVehicle(402,782.82740000,-1608.80940000,13.47490000,88.99920000,40,1); //Buffalo
	AddStaticVehicle(542,782.61880000,-1601.85060000,13.47520000,270.55100000,32,32); //Clover
	AddStaticVehicle(533,971.76390000,-1577.82580000,13.54880000,269.90480000,7,7); //Feltzer
	AddStaticVehicle(475,1076.99270000,-1766.70650000,13.45730000,270.58360000,16,16); //Sabre
	AddStaticVehicle(533,1084.95060000,-1766.74380000,13.45490000,89.48260000,25,25); //Feltzer
	AddStaticVehicle(475,1098.12150000,-1758.09420000,13.44580000,91.91460000,-1,-1); //Sabre
	AddStaticVehicle(475,943.32740000,-1820.09750000,12.84740000,175.38170000,20,20); //Sabre
	AddStaticVehicle(418,650.27550000,-1879.03780000,4.41360000,267.82800000,65,65); //Moonbeam
	AddStaticVehicle(492,468.35400000,-1760.22330000,5.74470000,354.28240000,40,1); //Greenwood
	AddStaticVehicle(492,334.04030000,-1809.46570000,4.57880000,178.71690000,-1,-1); //Greenwood
	AddStaticVehicle(405,314.89670000,-1807.59530000,4.60240000,359.61380000,4,1); //Sentinel
	AddStaticVehicle(421,311.60740000,-1789.45190000,4.66220000,357.69780000,1,1); //Washington
	AddStaticVehicle(405,352.49820000,-1731.80730000,5.89140000,1.76480000,4,1); //Sentinel
	AddStaticVehicle(475,185.79300000,-1744.82100000,4.40700000,94.20380000,-1,-1); //Sabre
	AddStaticVehicle(400,133.22480000,-1488.62190000,18.79210000,58.92170000,4,1); //Landstalker
	AddStaticVehicle(475,167.89950000,-1342.05090000,69.74760000,184.17270000,19,19); //Sabre
	AddStaticVehicle(491,254.01360000,-1358.58330000,53.20170000,308.04290000,71,71); //Virgo
	AddStaticVehicle(400,336.19160000,-1298.59070000,54.31620000,211.51870000,4,1); //Landstalker
	AddStaticVehicle(491,404.98770000,-1262.62340000,50.96000000,23.56140000,107,107); //Virgo
	AddStaticVehicle(475,615.86640000,-1103.49890000,46.92410000,128.06010000,7,7); //Sabre
	AddStaticVehicle(500,560.60360000,-1278.20120000,17.33800000,39.46340000,113,1); //Mesa
	AddStaticVehicle(517,544.66860000,-1283.75430000,17.33610000,225.04300000,102,102); //Majestic
	AddStaticVehicle(500,620.24470000,-1514.58460000,15.11700000,180.40920000,64,64); //Mesa
	AddStaticVehicle(500,683.80940000,-1547.51050000,14.94390000,271.92290000,42,42); //Mesa
	AddStaticVehicle(542,741.13770000,-1342.46090000,13.61520000,92.46490000,45,45); //Clover
	AddStaticVehicle(533,780.77640000,-1351.07840000,13.63380000,89.40110000,6,6); //Feltzer
	AddStaticVehicle(475,861.82560000,-1368.89470000,13.63920000,182.67950000,1,1); //Sabre
	AddStaticVehicle(533,1149.62740000,-1411.15090000,13.68480000,92.65260000,103,103); //Feltzer
	AddStaticVehicle(402,1389.84700000,-1437.60360000,13.64700000,178.24530000,63,63); //Buffalo
	AddStaticVehicle(521,1463.53260000,-1500.29030000,13.63920000,271.02170000,-1,-1); //FCR-900
	AddStaticVehicle(542,1378.64830000,-1660.95800000,13.59450000,357.52380000,53,53); //Clover
	AddStaticVehicle(490,1461.28906250,-1741.32568359,13.63920021,357.92358398,-1,-1); //FBI Rancher
	AddStaticVehicle(490,1507.62270000,-1747.22500000,13.63920000,0.67490000,-1,-1); //FBI Rancher
	AddStaticVehicle(517,1535.75930000,-1668.86710000,13.47520000,0.19940000,1,1); //Majestic
	AddStaticVehicle(500,1719.41390000,-1607.64660000,13.63920000,180.55460000,47,47); //Mesa
	AddStaticVehicle(475,1874.65880000,-1619.31870000,13.63920000,270.04020000,1,1); //Sabre
	AddStaticVehicle(517,1933.19980000,-1593.53880000,13.65240000,358.68600000,2,2); //Majestic
	AddStaticVehicle(421,1960.68200000,-1711.16700000,16.06110000,88.93290000,-1,-1); //Washington
	AddStaticVehicle(402,2012.22770000,-1737.83310000,13.64320000,90.59110000,13,13); //Buffalo
	AddStaticVehicle(567,2041.17200000,-1689.29090000,13.63920000,181.49890000,3,3); //Savanna
	AddStaticVehicle(421,2026.47910000,-1605.28600000,13.63900000,89.37000000,1,1); //Washington
	AddStaticVehicle(567,2364.52690000,-1753.78380000,13.55110000,271.33650000,3,3); //Savanna
	AddStaticVehicle(421,2431.40060000,-1773.03200000,13.63940000,89.38500000,64,64); //Washington
	AddStaticVehicle(542,2373.63750000,-1927.43480000,13.47520000,179.09590000,46,46); //Clover
	AddStaticVehicle(567,2383.55740000,-1927.48450000,13.47520000,2.35100000,3,3); //Savanna
	AddStaticVehicle(405,2467.27930000,-1937.76940000,13.49220000,271.38330000,1,1); //Sentinel
	AddStaticVehicle(475,2495.76270000,-1952.55980000,13.52540000,178.92110000,113,1); //Sabre
	AddStaticVehicle(405,2476.40060000,-1953.08020000,13.52150000,358.55260000,-1,-1); //Sentinel
	AddStaticVehicle(533,2677.17680000,-1937.67030000,13.49310000,271.51340000,16,16); //Feltzer
	AddStaticVehicle(475,2685.06860000,-1992.36940000,13.64780000,180.21510000,77,77); //Sabre
	AddStaticVehicle(405,2685.11300000,-2018.13400000,13.63550000,1.58270000,113,1); //Sentinel
	AddStaticVehicle(475,2787.65040000,-1997.72440000,13.46860000,269.49870000,1,1); //Sabre
	AddStaticVehicle(533,2784.81270000,-1989.48320000,13.55960000,46.73610000,4,4); //Feltzer
	AddStaticVehicle(402,2776.24630000,-1908.93300000,12.09780000,0.28210000,1,1); //Buffalo
	AddStaticVehicle(421,2860.75390000,1893.13060000,11.02540000,180.94940000,113,1); //Washington
	AddStaticVehicle(418,2781.20070000,-1838.82790000,9.88580000,26.41040000,18,18); //Moonbeam
	AddStaticVehicle(505,2763.49050000,-1846.02980000,9.82900000,203.92370000,-1,3); //Rancher
	AddStaticVehicle(466,2660.75120000,-1822.43140000,9.40230000,100.37620000,113,1); //Glendale
	AddStaticVehicle(505,2658.60690000,-1797.70340000,9.39790000,272.05250000,3,-1); //Rancher
	AddStaticVehicle(542,2676.68408203,-1674.25024414,9.51560020,181.14801025,113,1); //Clover
	AddStaticVehicle(542,2648.31050000,-1586.71550000,14.60740000,359.18320000,-1,-1); //Clover
	AddStaticVehicle(400,2662.51440000,-1594.29590000,13.34750000,90.20460000,113,1); //Landstalker
	AddStaticVehicle(458,2659.19750000,-1429.53430000,30.56590000,269.28870000,3,3); //Solair
	AddStaticVehicle(491,2659.35770000,-1437.40370000,30.57640000,87.03490000,7,7); //Virgo
	AddStaticVehicle(500,2504.63570000,-1426.03320000,28.64740000,179.89770000,16,16); //Mesa
	AddStaticVehicle(458,2456.56230000,-1366.15660000,24.00570000,359.97260000,15,15); //Solair
	AddStaticVehicle(474,2465.34990000,-1350.38600000,25.17180000,89.28190000,34,34); //Hermes
	AddStaticVehicle(492,2392.42480000,-1251.26050000,23.97870000,91.36790000,18,18); //Greenwood
	AddStaticVehicle(474,2343.15310000,-1295.41370000,24.14040000,92.01900000,19,19); //Hermes
	AddStaticVehicle(410,2354.74490000,-1306.55240000,24.06550000,272.37040000,16,16); //Manana
	AddStaticVehicle(517,2197.07540000,-1285.72440000,24.31050000,178.61790000,113,1); //Majestic
	AddStaticVehicle(410,2162.83010000,-1269.06320000,23.98530000,347.95810000,-1,-1); //Manana
	AddStaticVehicle(405,2161.74340820,-1182.60009766,23.91020012,271.61669922,12,12); //Sentinel
	AddStaticVehicle(521,2147.48970000,-1166.90220000,23.91260000,91.50720000,19,19); //FCR-900
	AddStaticVehicle(402,2161.10107422,-1172.31372070,23.91220093,88.84643555,113,1); //Buffalo
	AddStaticVehicle(418,2161.66796875,-1148.31494141,24.47299957,270.27575684,1,1); //Moonbeam
	AddStaticVehicle(474,2217.30883789,-1170.15283203,25.81889915,92.62573242,15,15); //Hermes
	AddStaticVehicle(542,2207.03760000,-1156.92410000,25.82400000,268.38740000,13,13); //Clover
	AddStaticVehicle(542,2175.22830000,-995.29100000,63.06520000,168.59340000,16,16); //Clover
	AddStaticVehicle(475,2133.92285156,-1138.39392090,25.28890038,51.22167969,113,1); //Sabre
	AddStaticVehicle(492,2052.58860000,-1104.17080000,24.56890000,89.92780000,1,1); //Greenwood
	AddStaticVehicle(419,1585.96450000,-1011.62520000,23.99870000,184.71550000,16,16); //Esperanto
	AddStaticVehicle(474,1567.15770000,-1011.85470000,24.00310000,0.50460000,5,5); //Hermes
	AddStaticVehicle(419,1593.25900000,-1057.68120000,23.99840000,130.69340000,2,2); //Esperanto
	AddStaticVehicle(533,1628.41440000,-1089.63790000,23.99810000,87.94890000,65,65); //Feltzer
	AddStaticVehicle(400,1656.84350000,-1089.02750000,24.00000000,91.42110000,113,1); //Landstalker
	AddStaticVehicle(533,1675.52870000,-1102.48250000,23.99860000,264.61670000,60,60); //Feltzer
	AddStaticVehicle(500,1717.93910000,-1069.65190000,23.99860000,1.59950000,14,14); //Mesa
	AddStaticVehicle(492,1723.39380000,-1060.26140000,24.01710000,178.60890000,113,1); //Greenwood
	AddStaticVehicle(598,1544.91015625,-1651.44335938,5.98290014,88.02246094,-1,-1); //Police Car (LVPD)
	AddStaticVehicle(609,2229.07200000,-2126.87380000,13.47250000,134.47430000,-1,-1); //Boxville
	AddStaticVehicle(609,2151.33250000,-2147.20260000,13.61680000,135.19930000,-1,-1); //Boxville
	AddStaticVehicle(609,2180.52760000,-2299.17800000,13.61330000,228.77510000,-1,-1); //Boxville
	AddStaticVehicle(609,2279.96920000,-2328.93770000,13.61470000,140.34400000,-1,-1); //Boxville
	AddStaticVehicle(609,2465.55540000,-2244.70610000,13.61390000,89.04320000,-1,-1); //Boxville
	AddStaticVehicle(609,2502.07350000,-2419.96410000,13.69080000,225.15160000,-1,-1); //Boxville
	AddStaticVehicle(414,2567.90480000,-2415.39870000,13.72880000,315.16260000,-1,-1); //Mule
	AddStaticVehicle(414,2762.39060000,-2389.21780000,13.72660000,359.14020000,-1,-1); //Mule
	AddStaticVehicle(414,2742.97140000,-2469.47220000,13.74210000,88.95860000,-1,-1); //Mule
	AddStaticVehicle(414,2671.08620000,-2462.06010000,13.73590000,89.59200000,-1,-1); //Mule
	AddStaticVehicle(609,2670.95410000,-2456.39260000,13.70850000,88.19980000,-1,-1); //Boxville
	AddStaticVehicle(609,2455.57590000,-2586.39650000,13.72280000,0.03300000,-1,-1); //Boxville
	AddStaticVehicle(414,2226.97000000,-2699.30000000,13.63950000,2.69590000,-1,-1); //Mule
	AddStaticVehicle(603,1578.60160000,-1877.99020000,13.29980000,269.85960000,-1,-1); //Phoenix
	AddStaticVehicle(603,1575.24630000,-1848.24690000,13.29590000,0.75040000,-1,-1); //Phoenix
	AddStaticVehicle(603,1364.62560000,-1261.76420000,13.28860000,359.56340000,-1,-1); //Phoenix
	AddStaticVehicle(402,1364.66000000,-1295.91870000,13.28840000,0.97030000,-1,-1); //Buffalo
	AddStaticVehicle(492,1335.87870000,-1311.90550000,13.28880000,178.21280000,-1,-1); //Greenwood
	AddStaticVehicle(466,1508.52380000,-1291.14160000,14.59370000,91.13470000,-1,-1); //Glendale
	AddStaticVehicle(609,1447.91220000,-1282.58610000,13.61130000,0.58160000,-1,-1); //Boxville
	AddStaticVehicle(405,1448.07510000,-1417.60570000,13.60980000,180.44070000,-1,-1); //Sentinel
	AddStaticVehicle(475,1153.54470000,-2054.53690000,69.06930000,270.13100000,-1,-1); //Sabre
	AddStaticVehicle(491,1150.07670000,-2047.03030000,69.06860000,271.37970000,-1,-1); //Virgo
	AddStaticVehicle(475,1149.52510000,-2029.64510000,69.06940000,270.86620000,-1,-1); //Sabre
	AddStaticVehicle(603,1151.14860000,-2016.79910000,69.08010000,269.79240000,-1,-1); //Phoenix
	AddStaticVehicle(405,1242.84590000,-1833.30730000,13.26940000,185.76570000,-1,-1); //Sentinel
	AddStaticVehicle(414,1268.15720000,-1797.72780000,13.50010000,181.38850000,-1,-1); //Mule
	AddStaticVehicle(418,1274.11080000,-1797.29920000,13.48940000,178.18760000,-1,-1); //Moonbeam
	AddStaticVehicle(418,1290.49580000,-1738.02840000,13.63990000,359.49390000,-1,-1); //Moonbeam
	AddStaticVehicle(421,1185.21120000,-1705.21950000,13.56680000,268.53880000,-1,-1); //Washington
	AddStaticVehicle(421,1277.85960000,-1613.49840000,13.43070000,270.23430000,-1,-1); //Washington
	AddStaticVehicle(410,1274.97230000,-1547.21780000,13.20710000,90.71410000,-1,-1); //Manana
	AddStaticVehicle(402,1275.73220000,-1538.70140000,13.38930000,88.83090000,-1,-1); //Buffalo
	AddStaticVehicle(603,347.84290000,-1556.99950000,33.14110000,146.53250000,-1,-1); //Phoenix
	AddStaticVehicle(400,519.58260000,-1640.95070000,17.75130000,184.63050000,-1,-1); //Landstalker
	AddStaticVehicle(484,730.59780000,-1497.21630000,0.23880000,176.29680000,-1,-1); //Marquis
	AddStaticVehicle(484,722.13010000,-1508.51210000,0.01100000,180.73170000,-1,-1); //Marquis
	AddStaticVehicle(484,721.53080000,-1633.75170000,0.20940000,176.45410000,-1,-1); //Marquis
	AddStaticVehicle(484,720.14590000,-1701.59880000,0.25620000,180.82950000,-1,-1); //Marquis
	AddStaticVehicle(579,2182.76030000,-1910.75110000,13.20380000,357.91880000,-1,-1); //Huntley
	AddStaticVehicle(579,2272.96090000,-1917.69580000,13.22650000,2.92410000,-1,-1); //Huntley
	AddStaticVehicle(579,2325.21120000,-2020.91890000,13.22040000,266.14920000,-1,-1); //Huntley
	AddStaticVehicle(579,2793.44510000,-2496.70900000,13.47730000,90.29930000,-1,-1); //Huntley
	AddStaticVehicle(403,-67.09060000,-1111.27150000,1.68430000,71.17290000,-1,-1); //Linerunner
	AddStaticVehicle(515,-67.51860000,-1119.88430000,1.68460000,69.53700000,-1,-1); //Roadtrain
	AddStaticVehicle(514,-46.36840000,-1137.61000000,1.68330000,72.47100000,-1,-1); //Tanker
	AddStaticVehicle(403,-46.38500000,-1150.59360000,1.68530000,63.89810000,-1,-1); //Linerunner
	AddStaticVehicle(515,-72.40250000,-1132.40550000,1.68420000,65.91560000,-1,-1); //Roadtrain
	AddStaticVehicle(514,-81.17190000,-1191.32370000,2.35910000,67.04470000,-1,-1); //Tanker
	AddStaticVehicle(515,-375.94690000,-1446.25400000,26.33190000,0.68600000,-1,-1); //Roadtrain
	AddStaticVehicle(575,2433.77250000,-1241.48950000,24.23460000,92.76790000,126,126); //Broadway
	AddStaticVehicle(575,2409.45120000,-1238.67960000,23.64390000,179.84610000,126,126); //Broadway
	AddStaticVehicle(575,2413.44170000,-1228.09690000,24.28030000,179.23570000,126,126); //Broadway
	AddStaticVehicle(575,2431.92750000,-1224.93910000,25.12100000,179.81080000,126,126); //Broadway
	AddStaticVehicle(591,2005.96860000,-1939.80520000,13.08070000,270.36380000,-1,-1); //Trailer 3
	AddStaticVehicle(591,2044.40410000,-1939.73560000,13.07630000,270.14040000,-1,-1); //Trailer 3
	AddStaticVehicle(591,2092.72580000,-1589.21150000,13.04660000,177.73900000,-1,-1); //Trailer 3
	AddStaticVehicle(591,-75.43310000,-1156.33960000,1.75000000,62.65170000,-1,-1); //Trailer 3
	AddStaticVehicle(487,725.40260000,-1462.20980000,22.30080000,181.13430000,-1,-1); //Maverick
	AddStaticVehicle(482,1715.53920000,-2259.51880000,13.22380000,270.08480000,-1,-1); //Burrito
	AddStaticVehicle(482,1724.49000000,-2303.36770000,13.31900000,181.54270000,-1,-1); //Burrito
	AddStaticVehicle(482,1749.37260000,-2327.79220000,13.29430000,87.82080000,-1,-1); //Burrito
	AddStaticVehicle(482,1664.81990000,-2246.88500000,13.32160000,88.60330000,-1,-1); //Burrito
	AddStaticVehicle(482,2200.58544922,-2233.98925781,13.63920021,223.15063477,-1,-1); //Burrito
	AddStaticVehicle(482,2214.49438477,-2220.38452148,13.63930035,223.86657715,-1,-1); //Burrito
	AddStaticVehicle(482,2194.16750000,-2251.73900000,13.63700000,227.02090000,-1,-1); //Burrito
	AddStaticVehicle(482,2185.15330000,-2280.41720000,13.63920000,317.48220000,-1,-1); //Burrito
	AddStaticVehicle(482,2220.99218750,-2212.51660156,13.63920021,44.98474121,-1,-1); //Burrito
	AddStaticVehicle(463,2742.85600000,-1079.95980000,69.06120000,71.83060000,-1,-1); //Freeway
	AddStaticVehicle(463,2741.59420000,-1075.29590000,69.02840000,83.11070000,-1,-1); //Freeway
	AddStaticVehicle(463,2737.43160000,-1070.35380000,68.97500000,92.53580000,-1,-1); //Freeway
	AddStaticVehicle(463,2732.26290000,-1065.77910000,68.99030000,98.32970000,-1,-1); //Freeway
	AddStaticVehicle(463,2720.62300000,-1062.98710000,68.96330000,124.69570000,-1,-1); //Freeway
	AddStaticVehicle(522,1137.89340000,-2066.98490000,68.57970000,270.62630000,3,8); //NRG-500
	AddStaticVehicle(522,1140.95800000,-2004.60230000,68.57870000,272.57800000,3,8); //NRG-500
	AddStaticVehicle(411,1249.59960938,-2010.16601562,59.50640106,186.36901855,123,1); //Infernus
	AddStaticVehicle(429,1277.03690000,-2023.74680000,58.63800000,268.51090000,13,13); //Banshee
	AddStaticVehicle(568,1258.08760000,-2066.39450000,59.53340000,261.21130000,9,39); //Bandito
	AddStaticVehicle(522,1947.31740000,-2223.80050000,13.10800000,183.05830000,6,25); //NRG-500
	AddStaticVehicle(476,1900.63420000,-2623.00810000,14.25880000,359.79000000,7,6); //Rustler
	AddStaticVehicle(476,1812.75600000,-2629.25710000,14.25650000,8.10850000,7,6); //Rustler
	AddStaticVehicle(414,2630.65330000,-2136.75900000,13.64060000,1.53900000,28,1); //Mule
	AddStaticVehicle(414,2640.17900000,-2136.46920000,13.64050000,357.77290000,28,1); //Mule
	AddStaticVehicle(490,2654.11500000,-2128.61330000,13.67880000,91.86640000,-1,-1); //FBI Rancher
	AddStaticVehicle(490,2392.17870000,-2126.02170000,13.67670000,271.55330000,-1,-1); //FBI Rancher
	AddStaticVehicle(496,2380.33110000,-2009.67300000,13.27010000,88.47120000,53,56); //Blista Compact
	AddStaticVehicle(496,2814.60940000,-1089.81300000,30.46650000,184.18260000,53,56); //Blista Compact
	AddStaticVehicle(496,2340.27880000,-1259.13510000,22.22020000,354.92060000,53,56); //Blista Compact
	AddStaticVehicle(411,1791.91360000,-2116.68630000,13.12510000,264.47830000,64,1); //Infernus
	AddStaticVehicle(411,1730.05210000,-2108.04930000,13.18900000,269.61950000,64,1); //Infernus
	AddStaticVehicle(522,830.58520000,-1269.75240000,13.30360000,271.52370000,6,25); //NRG-500
	AddStaticVehicle(522,1791.69090000,-1346.11600000,15.25050000,268.53170000,3,8); //NRG-500
	AddStaticVehicle(522,1791.41890000,-1349.69690000,15.27340000,272.41100000,3,8); //NRG-500
	AddStaticVehicle(581,1777.09740000,-1346.40990000,15.34730000,353.37820000,58,1); //BF-400
	AddStaticVehicle(581,1770.98720000,-1345.92690000,15.34950000,2.48410000,58,1); //BF-400
	AddStaticVehicle(581,1768.63700000,-1369.44870000,15.34570000,177.32740000,58,1); //BF-400
	AddStaticVehicle(521,1771.07520000,-1385.26990000,15.32280000,360.00000000,87,118); //FCR-900
	AddStaticVehicle(521,1786.87540000,-1392.02710000,15.32610000,250.80150000,87,118); //FCR-900
	AddStaticVehicle(521,1785.68740000,-1404.05150000,15.30640000,165.95690000,87,118); //FCR-900
	AddStaticVehicle(521,1782.17210000,-1414.62150000,15.32430000,194.93200000,87,118); //FCR-900
	AddStaticVehicle(581,1102.88460000,-1841.71620000,13.15340000,102.46130000,58,1); //BF-400
	AddStaticVehicle(521,1082.98000000,-1820.63400000,13.16580000,358.02140000,75,13); //FCR-900
	AddStaticVehicle(424,2817.08080000,-2192.37230000,14.30300000,40.31140000,3,2); //BF Injection
	AddStaticVehicle(424,2807.54250000,-2198.98560000,15.76760000,25.68000000,3,2); //BF Injection
	AddStaticVehicle(424,2853.09940000,-2138.65140000,6.73420000,350.63420000,3,2); //BF Injection
	AddStaticVehicle(468,2595.63840000,-1059.47070000,69.24460000,0.01300000,53,53); //Sanchez
	AddStaticVehicle(468,2602.50370000,-1059.99550000,69.25230000,0.65460000,53,53); //Sanchez
	AddStaticVehicle(444,2682.03390000,-1672.63530000,9.79540000,181.63100000,32,42); //Monster
	AddStaticVehicle(466,2815.97950000,-1540.06990000,10.66370000,0.03090000,68,76); //Glendale
	AddStaticVehicle(466,2816.84640000,-1434.41250000,15.99140000,1.43430000,68,76); //Glendale
	AddStaticVehicle(573,1802.86380000,-2116.35600000,13.51470000,264.30370000,-1,1); //Duneride
	AddStaticVehicle(573,2758.38010000,-2375.15500000,13.76500000,1.37630000,55,123); //Duneride
	AddStaticVehicle(406,2758.56350000,-2512.17210000,15.16500000,359.46350000,1,1); //Dumper
	AddStaticVehicle(470,2775.91720000,-2496.61690000,13.65970000,89.86520000,43,-1); //Patriot
	AddStaticVehicle(536,2516.47920000,-1672.24960000,13.71340000,58.99780000,86,86); //Blade
	AddStaticVehicle(536,2510.53980000,-1687.13210000,13.35840000,50.91970000,86,86); //Blade
	AddStaticVehicle(451,2516.34010000,-1663.68540000,13.70620000,127.60440000,86,86); //Turismo
	AddStaticVehicle(451,2473.29440000,-1695.43880000,13.31210000,359.01420000,86,86); //Turismo
	AddStaticVehicle(587,2491.30980000,-1684.28210000,13.21610000,270.83740000,86,86); //Euros
	AddStaticVehicle(587,2205.53640000,-1173.35940000,25.52400000,270.22250000,5,5); //Euros
	AddStaticVehicle(451,2205.97558594,-1168.27441406,25.52619934,266.25207520,5,5); //Turismo
	AddStaticVehicle(536,2205.66699219,-1160.76953125,25.53050041,269.17602539,5,5); //Blade
	AddStaticVehicle(587,2216.87890000,-1161.08220000,25.52270000,264.79170000,5,5); //Euros
	AddStaticVehicle(580,2217.30400000,-1166.01980000,25.52270000,270.61330000,5,5); //Stafford
	AddStaticVehicle(412,1214.31030000,-1732.54370000,13.57580000,320.45230000,124,124); //Voodoo
	AddStaticVehicle(412,1234.40640000,-1727.99630000,13.57020000,267.49850000,124,124); //Voodoo
	AddStaticVehicle(587,1212.94150000,-1698.37430000,13.54690000,87.98010000,124,124); //Euros
	AddStaticVehicle(412,1187.88510000,-1729.43080000,13.56050000,179.16100000,124,124); //Voodoo
	AddStaticVehicle(412,1211.93540000,-1746.60930000,13.59420000,131.84720000,124,124); //Voodoo
	AddStaticVehicle(587,1827.26513672,-1694.06958008,13.47190094,94.04296875,7,7); //Euros
	AddStaticVehicle(412,1825.96789551,-1653.43176270,13.34690285,177.60858154,7,7); //Voodoo
	AddStaticVehicle(412,1911.34220000,-1776.15320000,13.38280000,179.56440000,7,7); //Voodoo
	AddStaticVehicle(412,1923.61230000,-1651.69230000,13.54690000,95.15540000,7,7); //Voodoo
	AddStaticVehicle(412,1923.75770000,-1640.55070000,13.54690000,260.11530000,7,7); //Voodoo
	AddStaticVehicle(412,1923.99280000,-1632.33080000,13.54690000,73.07690000,7,7); //Voodoo
	AddStaticVehicle(474,2806.88130000,-1183.36800000,25.13390000,220.22080000,6,6); //Hermes
	AddStaticVehicle(474,2828.75634766,-1190.24365234,25.00379944,95.47912598,6,6); //Hermes
	AddStaticVehicle(474,2831.28710000,-1163.32690000,24.73140000,2.51310000,6,6); //Hermes
	AddStaticVehicle(587,2847.96900000,-1177.16440000,24.52110000,180.59380000,6,6); //Euros
	AddStaticVehicle(474,2850.05030000,-1193.37740000,24.29920000,188.75790000,6,6); //Hermes
	AddStaticVehicle(587,2837.64090000,-1204.73650000,23.71970000,18.94150000,6,6); //Euros
	AddStaticVehicle(510,2251.92920000,-1148.06070000,26.19950000,254.64020000,35,45); //Mountain Bike
	AddStaticVehicle(558,2264.64770000,-1236.79750000,23.77240000,176.18880000,65,75); //Uranus
	AddStaticVehicle(560,2198.03640000,-1295.89500000,23.69160000,90.92960000,95,105); //Sultan
	AddStaticVehicle(561,2132.59180000,-1294.57020000,23.77140000,93.61200000,105,115); //Stratum
	AddStaticVehicle(562,2061.88090000,-1323.22420000,23.69460000,181.18160000,115,125); //Elegy
	AddStaticVehicle(560,2121.17070000,-1773.91640000,13.18870000,94.98810000,56,57); //Sultan
	AddStaticVehicle(561,2076.25320000,-1865.43050000,13.25500000,181.72260000,58,59); //Stratum
	AddStaticVehicle(562,2052.33230000,-1904.32020000,13.34310000,3.26420000,4,15); //Elegy
	AddStaticVehicle(415,1776.55830000,-1912.72880000,13.18300000,271.64150000,84,26); //Cheetah
	AddStaticVehicle(474,1776.36180000,-1925.27870000,13.18110000,271.20300000,76,49); //Hermes
	AddStaticVehicle(478,1746.80110000,-1595.14980000,13.25270000,254.65470000,55,58); //Walton
	AddStaticVehicle(479,1838.37050000,-1483.96800000,13.34270000,7.16130000,75,59); //Regina
	AddStaticVehicle(480,2348.21510000,-1161.28320000,27.12490000,272.60890000,55,25); //Comet
	AddStaticVehicle(587,2174.46679688,-2267.25292969,13.19779968,227.35656738,-1,-1); //Euros
	AddStaticVehicle(561,2160.63820000,-2281.02760000,13.19690000,227.69900000,-1,-1); //Stratum
	AddStaticVehicle(587,2218.02392578,-2216.81347656,13.36069965,46.97753906,-1,-1); //Euros
	AddStaticVehicle(561,2210.81080000,-2224.02490000,13.36060000,43.30970000,-1,-1); //Stratum
	AddStaticVehicle(561,2204.77100000,-2230.21680000,13.36100000,44.57640000,-1,-1); //Stratum
	AddStaticVehicle(412,870.24760000,-1658.42380000,13.38380000,358.08150000,1,1); //Voodoo
	AddStaticVehicle(587,874.64110000,-1657.71090000,13.39330000,356.89990000,1,1); //Euros
	AddStaticVehicle(412,879.18080000,-1657.75270000,13.38550000,355.53920000,1,1); //Voodoo
	AddStaticVehicle(587,883.64760000,-1657.71580000,13.40460000,356.70720000,1,1); //Euros
	AddStaticVehicle(412,892.39670000,-1657.74950000,13.38650000,357.59110000,1,1); //Voodoo
	AddStaticVehicle(596,1585.59619141,-1673.81591797,5.55589867,269.80224609,-1,79); //Police Car (LSPD)
	AddStaticVehicle(596,1600.13310000,-1687.94980000,5.88430000,89.90180000,-1,79); //Police Car (LSPD)
	AddStaticVehicle(596,1600.09640000,-1692.05800000,5.88140000,89.39950000,-1,79); //Police Car (LSPD)
	AddStaticVehicle(596,1599.95640000,-1695.87890000,5.88140000,90.14260000,-1,79); //Police Car (LSPD)
	AddStaticVehicle(599,1600.02550000,-1700.11190000,5.88660000,89.66370000,-1,79); //Police Ranger
	AddStaticVehicle(596,1600.06520000,-1704.39670000,5.88040000,90.05420000,-1,79); //Police Car (LSPD)
	AddStaticVehicle(427,1583.47680000,-1709.14360000,5.88420000,359.10350000,-1,79); //Enforcer
	AddStaticVehicle(599,1564.71166992,-1709.40307617,6.00769949,359.12109375,-1,79); //Police Ranger
	AddStaticVehicle(523,1538.77940000,-1645.02490000,5.88250000,0.21250000,-1,79); //HPV1000
	AddStaticVehicle(523,1544.36830000,-1667.93210000,5.87860000,89.59650000,-1,79); //HPV1000
	AddStaticVehicle(599,1604.26820000,-1629.60730000,13.50630000,89.96100000,-1,79); //Police Ranger
	AddStaticVehicle(596,1604.14900000,-1623.30050000,13.49880000,89.74420000,-1,79); //Police Car (LSPD)
	AddStaticVehicle(579,2473.47510000,-1697.71530000,13.25550000,359.82280000,86,-1); //Huntley
	AddStaticVehicle(492,2508.34350000,-1666.54970000,13.13550000,13.01430000,77,-1); //Greenwood
	AddStaticVehicle(492,2480.56470000,-1655.15720000,13.05670000,91.35370000,77,-1); //Greenwood
	AddStaticVehicle(481,2508.15160000,-1651.21170000,13.22900000,133.24020000,86,-1); //BMX
	AddStaticVehicle(481,2506.74290000,-1650.41920000,13.21810000,144.16280000,86,-1); //BMX
	AddStaticVehicle(481,2505.19820000,-1648.43440000,13.19220000,138.25310000,86,-1); //BMX
	AddStaticVehicle(567,2505.60670000,-1695.10380000,13.29320000,2.59400000,86,-1); //Savanna
	AddStaticVehicle(536,2188.90380000,-1660.07260000,14.76250000,346.92790000,5,-1); //Blade
	AddStaticVehicle(536,2186.04880000,-1672.69710000,14.21570000,345.10610000,5,-1); //Blade
	AddStaticVehicle(536,2182.26390000,-1688.32260000,13.60560000,345.38950000,5,-1); //Blade
	AddStaticVehicle(517,2164.72530000,-1702.82890000,14.95010000,0.27540000,5,-1); //Majestic
	AddStaticVehicle(517,2187.82980000,-1623.40500000,14.42230000,340.58980000,5,-1); //Majestic
	AddStaticVehicle(579,2169.88870000,-1648.77030000,14.80180000,136.49570000,5,-1); //Huntley
	AddStaticVehicle(462,2108.76370000,-1629.48520000,13.37340000,91.41950000,5,-1); //Faggio
	AddStaticVehicle(462,2179.72120000,-1662.86630000,14.76070000,52.92930000,5,-1); //Faggio
	AddStaticVehicle(462,2176.78860000,-1666.48960000,14.87220000,61.56820000,5,-1); //Faggio
	AddStaticVehicle(509,2168.34860000,-1728.95230000,13.02330000,86.38470000,5,-1); //Bike
	AddStaticVehicle(509,2139.28370000,-1728.75660000,13.02250000,89.47720000,5,-1); //Bike
	AddStaticVehicle(471,2803.48780000,-1179.29690000,24.99300000,266.83440000,6,-1); //Quad
	AddStaticVehicle(471,2803.81670000,-1188.40870000,24.95030000,267.69830000,6,-1); //Quad
	AddStaticVehicle(481,2828.24800000,-1196.83410000,24.31920000,269.92220000,6,113); //BMX
	AddStaticVehicle(481,2828.69580000,-1201.11330000,24.18950000,267.07930000,6,113); //BMX
	AddStaticVehicle(481,2827.50220000,-1170.56120000,24.53710000,270.82120000,6,113); //BMX
	AddStaticVehicle(481,2827.92160000,-1165.06740000,24.52440000,268.61230000,6,113); //BMX
	AddStaticVehicle(536,2818.43800000,-1178.97620000,24.98010000,268.64440000,6,1); //Blade
	AddStaticVehicle(536,2817.16160000,-1187.71240000,24.96330000,270.26030000,6,1); //Blade
	AddStaticVehicle(579,2822.59060000,-1548.84250000,10.66240000,88.23740000,6,1); //Huntley
	AddStaticVehicle(560,2350.57180000,-1138.30150000,27.48780000,163.25320000,9,39); //Sultan
	AddStaticVehicle(560,2322.83790000,-1133.56120000,27.11200000,339.25550000,9,39); //Sultan
	AddStaticVehicle(565,2357.75930000,-1158.33240000,27.08160000,91.51920000,42,42); //Flash
	AddStaticVehicle(565,2348.18820000,-1158.57780000,26.86160000,92.56750000,42,42); //Flash
	AddStaticVehicle(565,2333.93700000,-1159.16310000,26.53350000,93.43740000,42,42); //Flash
	AddStaticVehicle(481,2377.44210000,-1140.46660000,28.15520000,262.84550000,3,3); //BMX
	AddStaticVehicle(481,2349.78050000,-1168.99500000,27.50150000,351.68760000,3,3); //BMX
	AddStaticVehicle(481,2347.03560000,-1169.60160000,27.54150000,4.55880000,3,3); //BMX
	AddStaticVehicle(535,1885.94260000,-2020.85640000,13.15440000,180.44940000,97,1); //Slamvan
	AddStaticVehicle(535,1880.09220000,-2020.76260000,13.15390000,181.28440000,97,1); //Slamvan
	AddStaticVehicle(507,1276.26400000,-2038.86300000,58.85250000,90.63890000,-1,-1); //Elegant
	AddStaticVehicle(507,1246.55960000,-2039.17360000,59.63600000,90.61230000,-1,-1); //Elegant
	AddStaticVehicle(507,1276.94860000,-2019.14060000,58.77380000,269.65430000,-1,-1); //Elegant
	AddStaticVehicle(507,1276.79589844,-2027.60607910,58.78630066,271.53259277,-1,-1); //Elegant
	AddStaticVehicle(521,1253.97610000,-2009.79520000,59.15730000,1.80390000,-1,-1); //FCR-900
	AddStaticVehicle(521,1278.40640000,-2009.97110000,58.46200000,270.01730000,-1,-1); //FCR-900
	AddStaticVehicle(521,1244.35100000,-2032.47010000,59.44440000,267.77260000,-1,-1); //FCR-900
	AddStaticVehicle(521,1135.63540000,-2042.50000000,68.58100000,265.17230000,-1,-1); //FCR-900
	AddStaticVehicle(521,1135.72960000,-2031.10610000,68.55060000,269.17900000,-1,-1); //FCR-900
	AddStaticVehicle(487,1158.06005859,-2022.52661133,69.17710114,86.64367676,-1,-1); //Maverick
	AddStaticVehicle(487,1156.27310000,-2053.72270000,69.17920000,91.47850000,-1,-1); //Maverick
	AddStaticVehicle(487,1196.95320000,-2019.70300000,69.18630000,90.25030000,-1,-1); //Maverick
	AddStaticVehicle(487,1198.36020000,-2052.45610000,69.17880000,92.09050000,-1,-1); //Maverick
	AddStaticVehicle(409,1245.10280000,-2010.92400000,59.64780000,180.39490000,-1,-1); //Stretch
	AddStaticVehicle(409,1245.52380371,-2020.54418945,59.55419922,179.97247314,-1,-1); //Stretch
	AddStaticVehicle(497,1555.11330000,-1610.18620000,12.94780000,89.62680000,-1,7); //Police Maverick
	AddStaticVehicle(497,1597.53390000,-1610.50560000,13.00770000,88.51520000,-1,7); //Police Maverick
	AddStaticVehicle(497,1580.48100000,-1610.44170000,12.93060000,91.07290000,-1,7); //Police Maverick
	AddStaticVehicle(596,1594.83680000,-1710.56400000,5.61070000,178.83120000,-1,7); //Police Car (LSPD)
	AddStaticVehicle(596,1601.68030000,-1695.49060000,5.61160000,275.24620000,-1,7); //Police Car (LSPD)
	AddStaticVehicle(596,1601.46850000,-1682.20530000,5.61100000,270.50400000,-1,7); //Police Car (LSPD)
	AddStaticVehicle(596,1579.32040000,-1711.08590000,5.61260000,177.91550000,-1,7); //Police Car (LSPD)
	AddStaticVehicle(596,1569.89840000,-1709.39660000,5.61290000,359.59830000,-1,7); //Police Car (LSPD)
	AddStaticVehicle(596,1559.04479980,-1710.02770996,5.61199999,0.73059082,-1,7); //Police Car (LSPD)
	AddStaticVehicle(596,1545.04800000,-1679.28450000,5.61130000,269.51860000,-1,7); //Police Car (LSPD)
	AddStaticVehicle(596,1544.11242676,-1645.16210938,5.60699987,358.79699707,-1,7); //Police Car (LSPD)
	AddStaticVehicle(596,1535.94934082,-1676.29174805,13.10340023,179.41223145,-1,7); //Police Car (LSPD)
	AddStaticVehicle(523,1569.86350000,-1694.57980000,5.46180000,353.95790000,-1,7); //HPV1000
	AddStaticVehicle(523,1560.58480000,-1694.75980000,5.44650000,1.38830000,-1,7); //HPV1000
	AddStaticVehicle(523,1528.87670000,-1687.77560000,5.45860000,86.22410000,-1,7); //HPV1000
	AddStaticVehicle(523,1547.02490000,-1655.15710000,5.46100000,84.08230000,-1,7); //HPV1000
	AddStaticVehicle(567,1895.97970000,-2035.02970000,13.41400000,88.65810000,99,81); //Savanna
	AddStaticVehicle(536,1793.31570000,-2126.81980000,13.28430000,0.90000000,37,1); //Blade
	AddStaticVehicle(412,1772.96640000,-2100.24460000,13.38530000,178.99610000,29,8); //Voodoo
	AddStaticVehicle(412,1724.82370000,-2099.61230000,13.38380000,178.90660000,30,1); //Voodoo
	AddStaticVehicle(534,1699.12320000,-2098.87300000,13.27260000,179.55620000,42,42); //Remington
	AddStaticVehicle(456,1744.59970000,-2058.72610000,13.76300000,180.08840000,102,65); //Yankee
	AddStaticVehicle(443,1715.69840000,-2072.94800000,14.21860000,270.86550000,20,1); //Packer
	AddStaticVehicle(580,1938.07840000,-2083.40840000,13.36010000,89.07960000,81,81); //Stafford
	AddStaticVehicle(491,1946.51290000,-2123.77780000,13.30420000,89.96710000,71,72); //Virgo
	AddStaticVehicle(574,2156.39010000,-2146.47830000,13.27200000,316.82410000,26,26); //Sweeper
	AddStaticVehicle(420,1779.46280000,-1923.20690000,13.17040000,302.03150000,6,1); //Taxi
	AddStaticVehicle(420,1779.21150000,-1919.29970000,13.16840000,301.15510000,6,1); //Taxi
	AddStaticVehicle(420,1778.59060000,-1915.42870000,13.16870000,304.04570000,6,1); //Taxi
	AddStaticVehicle(420,1794.61610000,-1933.16850000,13.16700000,359.06590000,6,1); //Taxi
	AddStaticVehicle(420,1798.97380000,-1933.33740000,13.17070000,357.81910000,6,1); //Taxi
	AddStaticVehicle(409,1825.47660000,-1686.77560000,13.18280000,359.54020000,1,1); //Stretch
	AddStaticVehicle(409,1825.57629395,-1677.87145996,13.18120003,359.60998535,1,1); //Stretch
	AddStaticVehicle(481,1885.95500000,-1359.66800000,18.65110000,92.99810000,14,1); //BMX
	AddStaticVehicle(481,1885.88230000,-1361.93350000,18.65630000,84.37770000,26,1); //BMX
	AddStaticVehicle(481,1885.84470000,-1363.69850000,18.65540000,91.66160000,1,1); //BMX
	AddStaticVehicle(481,1918.53960000,-1415.43050000,13.07680000,99.19220000,6,6); //BMX
	AddStaticVehicle(481,1954.97160000,-1380.67410000,18.09700000,90.52380000,46,46); //BMX
	AddStaticVehicle(421,2105.01460000,-1365.63790000,23.86670000,1.46240000,40,1); //Washington
	AddStaticVehicle(518,2096.95900000,-1365.76450000,23.65530000,358.09820000,9,39); //Buccaneer
	AddStaticVehicle(421,2105.03830000,-1365.63670000,23.87250000,2.15440000,40,1); //Washington
	AddStaticVehicle(418,1934.95780000,-1118.40820000,26.57380000,180.63990000,117,227); //Moonbeam
	AddStaticVehicle(510,2000.91930000,-1120.89750000,26.36940000,236.05590000,46,46); //Mountain Bike
	AddStaticVehicle(479,2090.22950000,-1140.86100000,25.37330000,86.92420000,59,36); //Regina
	AddStaticVehicle(559,2135.17163086,-1134.78906250,25.27009392,50.98754883,58,8); //Jester
	AddStaticVehicle(496,2136.05859375,-1131.43750000,25.40469933,53.56860352,66,72); //Blista Compact
	AddStaticVehicle(560,2119.58860000,-1156.00160000,23.84990000,330.52690000,37,-1); //Sultan
	AddStaticVehicle(559,2161.96880000,-1187.68960000,23.47550000,89.52700000,60,1); //Jester
	AddStaticVehicle(566,2161.53076172,-1152.97399902,24.15509987,89.66491699,72,8); //Tahoma
	AddStaticVehicle(589,2161.17089844,-1177.37695312,23.47470093,89.32434082,124,124); //Club
	AddStaticVehicle(549,2161.57060000,-1158.37840000,23.55800000,90.61020000,72,39); //Tampa
	AddStaticVehicle(410,2217.36791992,-1157.26074219,25.38800049,270.59875488,9,1); //Manana
	AddStaticVehicle(400,2227.71260000,-1162.82310000,25.86200000,88.17830000,123,1); //Landstalker
	AddStaticVehicle(468,2228.14450000,-1152.07120000,25.50370000,90.16910000,46,46); //Sanchez
	AddStaticVehicle(550,1254.71550000,-807.85560000,83.96480000,177.40490000,11,11); //Sunrise
	AddStaticVehicle(411,1248.83190000,-804.91500000,83.88410000,178.06290000,64,1); //Infernus
	AddStaticVehicle(463,1110.06260000,-732.48990000,99.84930000,139.05970000,84,84); //Freeway
	AddStaticVehicle(415,1030.30600000,-809.65400000,101.63980000,21.67740000,36,1); //Cheetah
	AddStaticVehicle(439,2102.55740000,-1279.14480000,25.28860000,180.58650000,8,17); //Stallion
	AddStaticVehicle(481,2096.04270000,-1322.75420000,24.92440000,328.90890000,6,6); //BMX
	AddStaticVehicle(517,2217.35740000,-1330.82960000,23.84060000,87.69790000,40,36); //Majestic
	AddStaticVehicle(481,2189.68770000,-1344.80260000,23.50250000,293.22680000,46,46); //BMX
	AddStaticVehicle(492,2229.59470000,-1352.36510000,23.76800000,269.80950000,81,27); //Greenwood
	AddStaticVehicle(422,2255.34640000,-1276.51060000,25.36170000,181.17240000,97,25); //Bobcat
	AddStaticVehicle(554,2358.94430000,-1369.54250000,24.10720000,88.86980000,15,32); //Yosemite
	AddStaticVehicle(463,2350.22800000,-1352.62450000,23.55080000,268.27080000,7,7); //Freeway
	AddStaticVehicle(400,2358.40430000,-1362.47340000,24.11280000,92.37240000,113,1); //Landstalker
	AddStaticVehicle(551,2409.27220000,-1422.50330000,23.78550000,132.49830000,72,1); //Merit
	AddStaticVehicle(517,2403.02340000,-1544.04850000,23.84910000,1.32600000,51,72); //Majestic
	AddStaticVehicle(481,2393.14530000,-1469.42640000,23.51910000,155.21880000,26,1); //BMX
	AddStaticVehicle(400,2391.05640000,-1503.84190000,23.92990000,272.54080000,101,1); //Landstalker
	AddStaticVehicle(551,2189.31010000,-1465.81190000,25.33990000,269.15120000,75,1); //Merit
	AddStaticVehicle(560,1981.42130000,-1727.81140000,15.67400000,269.80120000,33,-1); //Sultan
	AddStaticVehicle(448,2115.72580000,-1782.66190000,12.98680000,319.05400000,3,6); //Pizzaboy
	AddStaticVehicle(448,2117.78830000,-1783.53420000,12.98080000,319.30850000,3,6); //Pizzaboy
	AddStaticVehicle(517,2095.62180000,-1814.69080000,13.19690000,270.03590000,43,41); //Majestic
	AddStaticVehicle(498,2253.21780000,-1775.27860000,13.61270000,358.64450000,13,120); //Boxville
	AddStaticVehicle(565,2332.73950000,-1753.95420000,13.09090000,270.56380000,7,7); //Flash
	AddStaticVehicle(536,2386.46660000,-1976.07590000,13.12020000,88.00340000,57,96); //Blade
	AddStaticVehicle(467,2871.52690000,-1435.29580000,10.53530000,180.00540000,58,8); //Oceanic
	AddStaticVehicle(560,2166.70166016,-2275.34960938,13.10050011,226.43420410,37,-1); //Sultan
	AddStaticVehicle(560,2195.86550000,-2238.56960000,13.25160000,223.80040000,56,29); //Sultan
	AddStaticVehicle(560,2207.07350000,-2256.85960000,13.26100000,314.08150000,41,29); //Sultan
	AddStaticVehicle(415,2779.30440000,-2455.75200000,13.40660000,89.50460000,25,1); //Cheetah
	AddStaticVehicle(415,2778.93900000,-2417.60010000,13.40830000,92.86280000,36,1); //Cheetah
	AddStaticVehicle(409,2780.22530000,-2494.24190000,13.45950000,89.93970000,1,1); //Stretch
	AddStaticVehicle(496,1063.12590000,-1772.84340000,13.07110000,90.57950000,66,72); //Blista Compact
	AddStaticVehicle(421,642.96070000,-1640.69480000,14.89640000,1.34880000,25,1); //Washington
	AddStaticVehicle(481,1027.92750000,-1052.23080000,31.16190000,295.33500000,46,46); //BMX
	AddStaticVehicle(565,1016.53190000,-1052.25100000,30.99920000,359.33290000,10,10); //Flash
	AddStaticVehicle(442,930.49380000,-1117.63680000,23.87880000,358.39430000,11,105); //Romero
	AddStaticVehicle(428,1455.20460000,-1748.34750000,13.66870000,0.32090000,4,75); //Securicar
	AddStaticVehicle(411,288.06560000,-1158.06580000,80.63700000,221.23810000,-1,-1); //Infernus
	AddStaticVehicle(409,284.82910000,-1162.98230000,80.71370000,221.79260000,-1,-1); //Stretch
	AddStaticVehicle(522,288.57970000,-1147.23340000,80.48080000,223.44520000,6,8); //NRG-500
	AddStaticVehicle(451,316.53730000,-1167.54280000,80.62040000,132.25000000,8,8); //Turismo
	AddStaticVehicle(451,264.27020000,-1217.05020000,74.87990000,140.84760000,36,36); //Turismo
	AddStaticVehicle(522,245.50340000,-1232.63730000,74.19780000,275.61900000,6,25); //NRG-500
	AddStaticVehicle(463,245.71450000,-1230.70640000,74.45940000,276.51990000,-1,-1); //Freeway
	AddStaticVehicle(586,246.64500000,-1228.51140000,74.67780000,280.09340000,-1,-1); //Wayfarer
	AddStaticVehicle(470,285.00150000,-1272.08700000,73.94670000,29.94450000,-1,-1); //Patriot
	AddStaticVehicle(468,286.28660000,-1268.49800000,73.60710000,28.25950000,53,53); //Sanchez
	AddStaticVehicle(468,281.28920000,-1271.48770000,73.60790000,32.24080000,3,3); //Sanchez
	AddStaticVehicle(519,1892.40750000,-2630.65160000,14.46550000,356.52280000,1,1); //Shamal
	AddStaticVehicle(519,1824.62150000,-2628.32470000,14.46620000,358.02920000,1,1); //Shamal
	AddStaticVehicle(592,2051.57060000,-2494.01440000,14.74090000,90.05430000,1,1); //Andromada
	AddStaticVehicle(487,1992.70940000,-2380.95530000,13.68740000,86.96520000,12,39); //Maverick
	AddStaticVehicle(487,1995.06100000,-2315.75540000,13.72340000,87.68720000,74,35); //Maverick
	AddStaticVehicle(513,1896.05180000,-2296.83350000,14.09060000,267.31330000,21,36); //Stunt
	AddStaticVehicle(593,1481.52260000,-2455.28100000,14.00830000,180.22550000,58,8); //Dodo
	AddStaticVehicle(493,1088.54550000,-2751.79250000,-0.29210000,88.70920000,36,13); //Jetmax
	AddStaticVehicle(493,1067.83470000,-2752.32500000,0.16220000,91.61860000,36,13); //Jetmax
	AddStaticVehicle(493,1054.67490000,-2752.02270000,-0.33580000,88.05580000,36,13); //Jetmax
	AddStaticVehicle(595,981.41140000,-2687.50220000,0.11450000,179.89660000,112,20); //Launch
	AddStaticVehicle(493,1125.06870000,-2752.13790000,0.31080000,89.90200000,36,13); //Jetmax
	AddStaticVehicle(411,166.25090000,-1341.58840000,69.40400000,179.21100000,116,1); //Infernus
	AddStaticVehicle(522,179.50480000,-1331.07020000,69.62830000,173.76310000,8,82); //NRG-500
	AddStaticVehicle(409,192.71260000,-1333.20180000,69.89950000,118.42420000,1,1); //Stretch
	AddStaticVehicle(560,160.37050000,-1340.71890000,69.58000000,209.85280000,9,39); //Sultan
	AddStaticVehicle(541,183.12110000,-1329.68840000,69.68420000,185.12900000,58,8); //Bullet
	AddStaticVehicle(421,2374.51590000,-1640.22230000,13.36160000,0.10450000,87,-1); //Washington
	AddStaticVehicle(566,2291.57180000,-1678.64160000,14.09890000,181.58740000,72,-1); //Tahoma
	AddStaticVehicle(412,2271.66530000,-1645.70860000,15.24040000,357.46910000,76,-1); //Voodoo
	AddStaticVehicle(589,2065.11990000,-1636.39320000,13.41550000,89.43060000,24,-1); //Club
	AddStaticVehicle(560,2051.44900000,-1694.71310000,13.42650000,91.10090000,-1,-1); //Sultan
	AddStaticVehicle(550,2106.57180000,-1783.15500000,13.25800000,179.75620000,57,-1); //Sunrise
	AddStaticVehicle(537,1700.42190000,-1953.65230000,14.87560000,89.82770000,1,1); //Freight
	AddStaticVehicle(522,822.29980469,-1889.01489258,12.52756500,0.00000000,-1,-1); //NRG-500
	AddStaticVehicle(454,839.60571289,-2076.57226562,0.00000000,182.00000000,-1,-1); //Tropic
	AddStaticVehicle(592,1447.33947754,-2449.99755859,14.60465622,176.00000000,-1,-1); //Andromada
	AddStaticVehicle(562,2312.32420000,1388.78040000,41.82060000,359.86360000,30,62); //Elegy
	AddStaticVehicle(562,2309.20290000,1390.40840000,41.82070000,358.32110000,6,6); //Elegy
	AddStaticVehicle(429,2305.69650000,1390.31010000,42.50000000,0.72070000,6,6); //Banshee
	AddStaticVehicle(429,2302.41460000,1389.83850000,42.50000000,359.64570000,-1,-1); //Banshee
	AddStaticVehicle(475,2299.19410000,1390.92130000,42.62300000,358.38860000,-1,-1); //Sabre
	AddStaticVehicle(475,2295.75930000,1389.19910000,42.62560000,358.91750000,1,1); //Sabre
	AddStaticVehicle(541,2292.39500000,1390.51840000,42.44540000,359.30460000,1,1); //Bullet
	AddStaticVehicle(541,2289.19750000,1390.56320000,42.44530000,358.14980000,-1,-1); //Bullet
	AddStaticVehicle(560,2285.80420000,1389.90010000,42.47230000,359.62950000,-1,-1); //Sultan
	AddStaticVehicle(560,2282.50050000,1390.10780000,42.47240000,0.40180000,6,6); //Sultan
	AddStaticVehicle(562,-314.95640000,1516.27220000,74.35690000,358.93330000,-1,-1); //Elegy
	AddStaticVehicle(562,-317.99810000,1515.91380000,74.35780000,359.27550000,6,6); //Elegy
	AddStaticVehicle(429,-320.96120000,1516.03050000,75.03780000,359.76210000,-1,-1); //Banshee
	AddStaticVehicle(429,-324.11360000,1515.46030000,75.03930000,1.18150000,6,6); //Banshee
	AddStaticVehicle(475,-327.32640000,1516.15260000,75.16340000,359.10310000,-1,-1); //Sabre
	AddStaticVehicle(475,-330.36870000,1516.02330000,75.16340000,359.75370000,6,6); //Sabre
	AddStaticVehicle(541,-333.46440000,1515.82700000,74.98410000,359.13100000,-1,-1); //Bullet
	AddStaticVehicle(560,-336.63680000,1515.34480000,75.01160000,359.82080000,-1,-1); //Sultan
	AddStaticVehicle(558,-339.74830000,1515.77750000,74.98980000,0.35740000,-1,-1); //Uranus
	AddStaticVehicle(541,1086.07260000,2306.64650000,10.44550000,178.84680000,-1,-1); //Bullet
	AddStaticVehicle(562,1080.27010000,2305.57300000,9.82130000,178.33940000,-1,-1); //Elegy
	AddStaticVehicle(475,1075.39770000,2306.00830000,10.62370000,178.88120000,-1,-1); //Sabre
	AddStaticVehicle(429,1069.47690000,2306.12960000,10.50000000,180.21890000,-1,-1); //Banshee
	AddStaticVehicle(560,1065.12980000,2306.24020000,10.47170000,178.52040000,-1,-1); //Sultan
	AddStaticVehicle(558,1059.75930000,2305.74000000,10.45000000,180.32600000,-1,-1); //Uranus
	AddStaticVehicle(562,-2391.36230000,-601.94160000,131.64890000,126.27100000,-1,-1); //Elegy
	AddStaticVehicle(475,-2393.31910000,-599.71640000,132.45020000,123.89700000,-1,-1); //Sabre
	AddStaticVehicle(560,-2394.90700000,-597.14850000,132.29970000,124.71880000,-1,-1); //Sultan
	AddStaticVehicle(541,-2396.78780000,-594.90870000,132.27350000,123.68400000,-1,-1); //Bullet
	AddStaticVehicle(429,-2398.47710000,-592.53730000,132.32810000,124.77080000,-1,-1); //Banshee
	AddStaticVehicle(411,-2400.41410000,-590.30880000,132.37550000,124.13060000,-1,-1); //Infernus
	AddStaticVehicle(558,-2402.20630000,-587.80510000,132.27940000,124.59820000,-1,-1); //Uranus
	AddStaticVehicle(562,-775.34810000,-1692.05770000,96.48040000,290.51810000,-1,-1); //Elegy
	AddStaticVehicle(411,-781.07800000,-1682.71080000,97.05460000,286.27140000,-1,-1); //Infernus
	AddStaticVehicle(475,-780.39930000,-1700.75820000,97.09360000,302.82200000,-1,-1); //Sabre
	AddStaticVehicle(560,-776.90480000,-1709.79080000,96.86550000,311.34520000,-1,-1); //Sultan
	AddStaticVehicle(429,-786.57630000,-1710.93850000,96.50770000,316.90400000,-1,-1); //Banshee
	AddStaticVehicle(541,-797.66130000,-1702.61730000,96.19430000,294.26470000,-1,-1); //Bullet
	AddStaticVehicle(562,2095.16800000,2186.33910000,10.45200000,89.73630000,58,38); //Elegy
	AddStaticVehicle(411,2070.31050000,2184.06710000,10.51680000,269.81550000,52,12); //Infernus
	AddStaticVehicle(429,2073.27950000,2158.80050000,10.50000000,358.21330000,106,75); //Banshee
	AddStaticVehicle(411,2076.13060000,2157.89110000,10.54740000,2.12770000,1,1); //Infernus
	AddStaticVehicle(487,2073.25780000,2151.59860000,19.36570000,90.05850000,28,32); //Maverick
	AddStaticVehicle(522,2055.72190000,2195.26220000,10.39110000,85.55670000,11,79); //NRG-500
	AddStaticVehicle(522,2056.02880000,2193.25390000,10.39690000,87.78650000,74,81); //NRG-500
	AddStaticVehicle(522,2056.10400000,2189.74070000,10.39040000,101.15060000,16,28); //NRG-500
	AddStaticVehicle(560,3711.69240000,1105.39260000,707.61550000,357.84690000,88,124); //Sultan
	AddStaticVehicle(560,3718.10060000,1105.53770000,707.60820000,0.49600000,88,124); //Sultan
	AddStaticVehicle(560,3724.44920000,1105.32630000,707.60880000,359.78790000,88,124); //Sultan
	AddStaticVehicle(560,3730.99540000,1105.34580000,707.60550000,0.65250000,88,124); //Sultan
	AddStaticVehicle(411,3728.67020000,1077.59330000,707.68070000,179.63160000,-1,-1); //Infernus
	AddStaticVehicle(411,3722.21360000,1077.38720000,707.68070000,181.22370000,-1,-1); //Infernus
	AddStaticVehicle(411,3712.78810000,1077.42920000,707.68070000,179.85510000,-1,-1); //Infernus
	AddStaticVehicle(451,3712.66280000,1067.71220000,707.66080000,179.59770000,6,6); //Turismo
	AddStaticVehicle(451,3719.07200000,1067.89620000,707.65920000,180.14520000,6,6); //Turismo
	AddStaticVehicle(451,3725.68120000,1067.66250000,707.65960000,179.47860000,6,6); //Turismo
	AddStaticVehicle(562,3733.49240000,1058.63230000,707.61310000,0.27960000,-1,-1); //Elegy
	AddStaticVehicle(562,3727.12990000,1058.39610000,707.61180000,0.13630000,-1,-1); //Elegy
	AddStaticVehicle(562,3720.46800000,1059.09080000,707.61270000,0.88200000,-1,-1); //Elegy
	AddStaticVehicle(541,3692.10690000,1035.47000000,707.58590000,357.80980000,-1,-1); //Bullet
	AddStaticVehicle(541,3698.43920000,1035.50890000,707.58480000,2.90440000,1,1); //Bullet
	AddStaticVehicle(475,3734.09790000,1049.49650000,707.75880000,2.23980000,104,86); //Sabre
	AddStaticVehicle(475,3726.66850000,1050.12950000,707.75620000,1.16790000,104,86); //Sabre
	AddStaticVehicle(475,3723.50630000,1035.41990000,707.75870000,178.34430000,104,86); //Sabre
	AddStaticVehicle(561,3740.31150000,1043.38810000,707.76690000,269.46130000,112,122); //Stratum
	AddStaticVehicle(561,3739.93900000,1039.92960000,707.76720000,89.93790000,112,122); //Stratum
	AddStaticVehicle(561,3734.18330000,1036.61100000,707.76680000,358.44370000,112,122); //Stratum
	AddStaticVehicle(522,3687.90770000,1083.52220000,707.52340000,264.57880000,6,6); //NRG-500
	AddStaticVehicle(522,3688.07860000,1085.42500000,707.52150000,267.50110000,6,6); //NRG-500
	AddStaticVehicle(522,3687.94210000,1087.14000000,707.52270000,275.32790000,6,6); //NRG-500
	AddStaticVehicle(522,3688.19950000,1088.76310000,707.52500000,276.84580000,6,6); //NRG-500
	AddStaticVehicle(431,3689.39970000,1098.25010000,708.05350000,181.21500000,6,6); //Bus
	AddStaticVehicle(560,3705.17190000,1117.58840000,707.71140000,179.73770000,1,1); //Sultan
	AddStaticVehicle(562,3738.51950000,1117.31650000,707.75250000,178.84150000,-1,-1); //Elegy
	AddStaticVehicle(487,2455.39580000,1911.61510000,11.06250000,0.31670000,6,6); //Maverick
	AddStaticVehicle(487,2401.36890000,1904.79330000,11.70010000,269.07770000,6,6); //Maverick
	AddStaticVehicle(487,2401.56200000,1913.80620000,11.69910000,270.88760000,6,6); //Maverick
	AddStaticVehicle(411,2436.77660000,1900.73730000,5.87760000,0.72860000,1,1); //Infernus
	AddStaticVehicle(411,2421.97510000,1923.52060000,5.74270000,269.90670000,1,1); //Infernus
	AddStaticVehicle(411,2451.52340000,1957.59250000,10.35880000,275.48960000,1,1); //Infernus
	AddStaticVehicle(411,2534.44700000,2011.35850000,10.54740000,269.78530000,1,1); //Infernus
	AddStaticVehicle(411,2426.03690000,1989.82350000,10.54740000,359.66290000,-1,-1); //Infernus
	AddStaticVehicle(411,2481.48730000,1991.40110000,10.54740000,181.07590000,6,6); //Infernus
	AddStaticVehicle(429,2463.35400000,1992.37060000,10.55530000,358.90110000,6,6); //Banshee
	AddStaticVehicle(400,2416.89310000,2060.96920000,10.90420000,181.14670000,-1,6); //Landstalker
	AddStaticVehicle(409,2360.09060000,2088.48390000,10.47190000,1.78760000,1,1); //Stretch
	AddStaticVehicle(409,2267.08080000,2153.37480000,10.47190000,88.71370000,1,1); //Stretch
	AddStaticVehicle(413,2102.80710000,2085.71120000,10.91370000,268.25410000,8,82); //Pony
	AddStaticVehicle(428,2277.84180000,2460.12870000,10.94440000,358.96770000,-1,-1); //Securicar
	AddStaticVehicle(599,2255.97220000,2476.42630000,11.00980000,179.66260000,6,-1); //Police Ranger
	AddStaticVehicle(599,2277.67040000,2443.43240000,11.00710000,2.69400000,1,-1); //Police Ranger
	AddStaticVehicle(599,2255.99780000,2443.30490000,11.00500000,358.49940000,1,1); //Police Ranger
	AddStaticVehicle(591,2192.89430000,2471.35010000,11.82660000,175.34580000,1,1); //Trailer 3
	AddStaticVehicle(515,2200.99240000,2473.71700000,11.84890000,178.10280000,1,1); //Roadtrain
	AddStaticVehicle(496,2172.29660000,1977.58020000,10.53680000,91.92940000,-1,6); //Blista Compact
	AddStaticVehicle(522,2171.12350000,1985.33680000,10.39140000,89.14330000,-1,1); //NRG-500
	AddStaticVehicle(437,2172.90800000,2004.97910000,10.95350000,88.57900000,-1,1); //Coach
	AddStaticVehicle(437,2038.99570000,1641.50600000,10.80520000,180.97320000,-1,1); //Coach
	AddStaticVehicle(420,2074.93310000,1450.44740000,10.45040000,0.92760000,1,6); //Taxi
	AddStaticVehicle(420,2074.96660000,1227.85300000,10.45290000,179.20010000,1,6); //Taxi
	AddStaticVehicle(420,2040.01400000,1131.16590000,10.45040000,180.24060000,1,6); //Taxi
	AddStaticVehicle(420,2040.11320000,1142.00280000,10.45020000,358.75290000,6,13); //Taxi
	AddStaticVehicle(405,2038.07140000,986.25070000,10.61670000,359.61020000,-1,80); //Sentinel
	AddStaticVehicle(592,1476.86670000,1767.23580000,12.01010000,180.37770000,6,91); //Andromada
	AddStaticVehicle(477,2038.98930000,1287.16890000,10.37420000,0.96590000,75,1); //ZR-350
	AddStaticVehicle(479,2018.65140000,1258.37070000,10.61840000,178.12250000,16,32); //Regina
	AddStaticVehicle(536,2009.30540000,1258.28870000,10.55790000,178.57240000,16,12); //Blade
	AddStaticVehicle(541,2005.09440000,1259.02730000,10.44510000,178.33870000,16,63); //Bullet
	AddStaticVehicle(567,2039.66000000,1258.33680000,10.53950000,0.08680000,16,119); //Savanna
	AddStaticVehicle(576,2039.59590000,1247.14040000,10.28020000,359.84500000,118,101); //Tornado
	AddStaticVehicle(600,2039.32670000,1232.05070000,10.38690000,359.59390000,118,18); //Picador
	AddStaticVehicle(459,2000.56600000,1258.60160000,10.86140000,177.81500000,16,69); //Berkley's RC Van
	AddStaticVehicle(437,1991.34190000,1258.08620000,10.95380000,248.54570000,16,74); //Coach
	AddStaticVehicle(487,2003.82280000,1197.03430000,18.26220000,267.12360000,16,13); //Maverick
	AddStaticVehicle(487,2003.18850000,1212.97330000,18.28580000,264.20190000,16,5); //Maverick
	AddStaticVehicle(562,1256.91650000,-2036.43740000,58.98190000,200.70830000,11,1); //Elegy
	AddStaticVehicle(562,1260.18270000,-2034.99680000,58.88780000,204.17530000,6,6); //Elegy
	AddStaticVehicle(562,1265.13160000,-2032.22780000,58.74410000,178.94110000,1,1); //Elegy
	AddStaticVehicle(562,1273.06900000,-2035.14380000,58.53000000,139.50750000,6,6); //Elegy
	AddStaticVehicle(562,1269.85880000,-2032.96840000,58.60170000,153.29270000,6,6); //Elegy
	AddStaticVehicle(562,1245.48450000,-2057.63160000,59.29990000,270.05630000,6,6); //Elegy
	AddStaticVehicle(562,1245.51920000,-2053.22070000,59.31130000,270.59850000,6,6); //Elegy
	AddStaticVehicle(411,1549.73600000,107.52590000,436.51250000,0.54790000,-1,-1); //Infernus
	AddStaticVehicle(411,1531.80130000,107.27510000,436.51250000,1.67490000,1,1); //Infernus
	AddStaticVehicle(411,1534.71410000,107.29380000,436.51250000,0.65850000,1,1); //Infernus
	AddStaticVehicle(411,1546.59590000,107.52140000,436.51250000,1.48090000,-1,-1); //Infernus
	AddStaticVehicle(411,1543.52350000,107.44000000,436.51250000,0.70950000,6,6); //Infernus
	AddStaticVehicle(411,1537.74510000,107.31960000,436.51250000,0.81190000,6,6); //Infernus
	AddStaticVehicle(411,1540.65570000,107.34130000,436.51250000,0.66220000,4,4); //Infernus
	AddStaticVehicle(562,1555.11090000,174.68650000,436.49010000,90.31520000,-1,-1); //Elegy
	AddStaticVehicle(562,1555.14480000,171.45910000,436.49060000,91.07540000,1,1); //Elegy
	AddStaticVehicle(562,1555.24400000,168.32290000,436.49200000,91.63240000,6,6); //Elegy
	AddStaticVehicle(541,1555.60210000,161.76480000,436.41030000,89.90020000,-1,1); //Bullet
	AddStaticVehicle(541,1555.52470000,158.66200000,436.41030000,89.84300000,1,-1); //Bullet
	AddStaticVehicle(541,1555.64790000,155.39700000,436.41040000,89.58710000,6,-1); //Bullet
	AddStaticVehicle(402,1555.27840000,149.12060000,436.61700000,90.98700000,-1,1); //Buffalo
	AddStaticVehicle(402,1555.31620000,145.91360000,436.61690000,91.47830000,1,1); //Buffalo
	AddStaticVehicle(402,1555.33560000,142.72070000,436.61690000,90.11600000,6,6); //Buffalo
	AddStaticVehicle(429,1555.68110000,136.33320000,436.46500000,90.15210000,-1,1); //Banshee
	AddStaticVehicle(429,1555.73920000,132.97010000,436.46500000,91.75450000,1,-1); //Banshee
	AddStaticVehicle(429,1555.78990000,129.90110000,436.46500000,90.01060000,6,-1); //Banshee
	AddStaticVehicle(415,1556.02560000,123.50550000,436.56170000,90.96810000,-1,-1); //Cheetah
	AddStaticVehicle(415,1556.03770000,120.25370000,436.56540000,90.18400000,1,1); //Cheetah
	AddStaticVehicle(415,1556.10430000,116.95930000,436.56500000,91.36470000,6,6); //Cheetah
	AddStaticVehicle(475,1525.33490000,174.25450000,436.58770000,270.89530000,-1,-1); //Sabre
	AddStaticVehicle(475,1525.38680000,171.06820000,436.59110000,271.48080000,1,1); //Sabre
	AddStaticVehicle(475,1525.57500000,167.85240000,436.58880000,272.13980000,6,6); //Sabre
	AddStaticVehicle(560,1525.18760000,161.27900000,436.49010000,271.35040000,-1,-1); //Sultan
	AddStaticVehicle(560,1525.26400000,158.22120000,436.49010000,271.26560000,1,1); //Sultan
	AddStaticVehicle(560,1525.29330000,155.10560000,436.49030000,269.94760000,6,6); //Sultan
	AddStaticVehicle(558,1525.58050000,148.62350000,436.41510000,271.47620000,-1,-1); //Uranus
	AddStaticVehicle(558,1525.61770000,145.48370000,436.41500000,271.23510000,1,1); //Uranus
	AddStaticVehicle(558,1525.68480000,142.24200000,436.41480000,271.51650000,6,6); //Uranus
	AddStaticVehicle(444,1555.58160000,109.32440000,437.16240000,2.40510000,6,6); //Monster
	AddStaticVehicle(444,1525.90790000,108.35550000,437.15650000,359.42850000,1,1); //Monster
	AddStaticVehicle(559,1525.61870000,135.81460000,436.44170000,270.86050000,-1,-1); //Jester
	AddStaticVehicle(559,1525.67300000,132.59840000,436.44170000,270.74200000,1,1); //Jester
	AddStaticVehicle(559,1525.79720000,129.48390000,436.44170000,271.28850000,6,6); //Jester
	AddStaticVehicle(565,1525.58810000,123.12140000,436.41040000,271.13770000,-1,-1); //Flash
	AddStaticVehicle(565,1525.67930000,119.74830000,436.41010000,270.96680000,1,1); //Flash
	AddStaticVehicle(565,1525.71770000,116.59490000,436.41030000,270.44830000,6,6); //Flash
	AddStaticVehicle(522,1540.43420000,155.11230000,436.52880000,270.15020000,1,1); //NRG-500
	AddStaticVehicle(522,1540.32510000,151.97090000,436.52380000,270.58440000,-1,-1); //NRG-500
	AddStaticVehicle(522,1540.39890000,148.71940000,436.52120000,271.96230000,6,6); //NRG-500
	AddStaticVehicle(522,1540.41350000,145.56390000,436.52560000,268.00100000,3,3); //NRG-500
	AddStaticVehicle(521,1540.34720000,142.12950000,436.53060000,271.92310000,-1,-1); //FCR-900
	AddStaticVehicle(521,1540.56100000,139.36700000,436.53040000,270.98140000,1,1); //FCR-900
	AddStaticVehicle(521,1540.52290000,136.08360000,436.52740000,271.25350000,6,6); //FCR-900
	AddStaticVehicle(521,1540.85490000,132.73100000,436.47940000,271.65390000,3,3); //FCR-900
	AddStaticVehicle(468,1540.48410000,129.59350000,436.63250000,266.00440000,6,6); //Sanchez
	AddStaticVehicle(481,1540.69320000,126.08930000,436.47040000,270.75080000,6,6); //BMX
	//sklad1
	//AddStaticVehicle(562,1705.78125000,961.31848145,10.57386208,0.00000000,-1,-1); //Elegy
	//AddStaticVehicle(562,1702.58996582,960.15875244,10.57386208,0.00000000,-1,-1); //Elegy
	//AddStaticVehicle(562,1699.61840820,958.95642090,10.57386208,0.00000000,-1,-1); //Elegy
	//AddStaticVehicle(562,1696.55615234,957.45257568,10.56715393,0.00000000,-1,-1); //Elegy
	//AddStaticVehicle(411,1706.06433105,950.20013428,10.62031269,0.00000000,-1,-1); //Infernus
	//AddStaticVehicle(411,1703.07653809,949.00024414,10.62031269,0.00000000,-1,-1); //Infernus
	//AddStaticVehicle(411,1700.03723145,947.97741699,10.62031269,0.00000000,-1,-1); //Infernus
	//AddStaticVehicle(411,1697.24438477,946.54248047,10.61864567,0.00000000,-1,-1); //Infernus
	//AddStaticVehicle(402,1706.21569824,939.46014404,10.76031208,0.00000000,-1,-1); //Buffalo
	//AddStaticVehicle(402,1703.25573730,938.38116455,10.76031208,0.00000000,-1,-1); //Buffalo
	//AddStaticVehicle(402,1700.23754883,937.09558105,10.76031208,0.00000000,-1,-1); //Buffalo
	//AddStaticVehicle(402,1697.34436035,935.73352051,10.76031208,0.00000000,-1,-1); //Buffalo
	//AddStaticVehicle(497,1660.21057129,911.46435547,10.96654034,51.60998535,6,-1); //Police Maverick
	CreateDynamicObject(16088,1667.31774902,943.28698730,9.67187500,0.00000000,0.00000000,268.68997192); //object(des_pipestrut01)(1)
	CreateDynamicObject(4526,1637.45605469,928.71484375,11.42118645,0.00000000,0.00000000,19.84680176); //object(sfse_roadblock5)(1)
	CreateDynamicObject(978,1654.24951172,919.30523682,10.46053600,0.00000000,0.00000000,51.61004639); //object(sub_roadright)(1)
	CreateDynamicObject(978,1648.81774902,910.23809814,10.48553562,0.00000000,0.00000000,65.50329590); //object(sub_roadright)(2)
	CreateDynamicObject(978,1663.62060547,894.33532715,10.41444016,0.00000000,0.00000000,152.84503174); //object(sub_roadright)(3)
	CreateDynamicObject(979,1726.29711914,889.95867920,10.42011452,0.00000000,0.00000000,89.32501221); //object(sub_roadleft)(2)
	CreateDynamicObject(978,1718.05957031,917.79003906,10.61053371,0.00000000,0.00000000,257.01416016); //object(sub_roadright)(4)
	CreateDynamicObject(978,1722.25097656,926.80078125,10.58553410,0.00000000,0.00000000,232.95410156); //object(sub_roadright)(5)
	CreateDynamicObject(979,1750.64062500,916.29687500,10.49307442,0.00000000,0.00000000,13.89221191); //object(sub_roadleft)(3)
	CreateDynamicObject(979,1757.29003906,972.78710938,10.53553486,0.00000000,0.00000000,89.81872559); //object(sub_roadleft)(4)
	CreateDynamicObject(1424,1749.61352539,988.76306152,10.22479630,0.00000000,0.00000000,0.00000000); //object(dyn_roadbarrier_2)(1)
	CreateDynamicObject(1424,1752.33972168,988.64599609,10.20082951,0.00000000,0.00000000,0.00000000); //object(dyn_roadbarrier_2)(2)
	CreateDynamicObject(1424,1755.10620117,988.51416016,10.33382225,0.00000000,0.00000000,0.00000000); //object(dyn_roadbarrier_2)(3)
	CreateDynamicObject(978,1696.89392090,975.14520264,10.65245056,0.00000000,0.00000000,358.01135254); //object(sub_roadright)(6)
	CreateDynamicObject(978,1705.00903320,970.95166016,10.66053295,0.00000000,0.00000000,302.43286133); //object(sub_roadright)(10)
	CreateDynamicObject(978,1650.48510742,978.60760498,10.60245132,0.00000000,0.00000000,350.28234863); //object(sub_roadright)(14)
	CreateDynamicObject(978,1641.88378906,983.67651367,10.55245209,0.00000000,0.00000000,307.40344238); //object(sub_roadright)(15)
	CreateDynamicObject(978,1638.69238281,993.34863281,10.57745171,0.00000000,0.00000000,269.68688965); //object(sub_roadright)(16)
	CreateDynamicObject(978,1666.98144531,1012.77636719,10.56053448,0.00000000,0.00000000,178.85742188); //object(sub_roadright)(17)
	CreateDynamicObject(978,1641.41955566,1003.38269043,10.60245132,0.00000000,0.00000000,233.94836426); //object(sub_roadright)(18)
	CreateDynamicObject(978,1642.74023438,1021.28039551,10.66053295,0.00000000,0.00000000,299.69140625); //object(sub_roadright)(6)
	CreateDynamicObject(979,1701.54528809,991.67364502,10.56053448,0.00000000,0.00000000,168.72503662); //object(sub_roadleft)(1)
	CreateDynamicObject(979,1691.42480469,992.96026611,10.56053448,0.00000000,0.00000000,176.66253662); //object(sub_roadleft)(5)
	CreateDynamicObject(979,1691.25439453,995.58691406,10.56053448,0.00000000,0.00000000,5.95248413); //object(sub_roadleft)(6)
	CreateDynamicObject(979,1701.24938965,997.93420410,10.56053448,0.00000000,0.00000000,19.57910156); //object(sub_roadleft)(7)
	CreateDynamicObject(979,1702.00842285,1028.09948730,10.66053295,0.00000000,0.00000000,148.60269165); //object(sub_roadleft)(9)
	CreateDynamicObject(979,1692.04040527,1031.52490234,10.56053448,0.00000000,0.00000000,176.38867188); //object(sub_roadleft)(10)
	CreateDynamicObject(978,1686.26562500,975.17675781,10.65245056,0.00000000,0.00000000,1.73583984); //object(sub_roadright)(6)
	CreateDynamicObject(978,1666.98828125,1014.41601562,10.53553486,0.00000000,0.00000000,359.23645020); //object(sub_roadright)(6)
	CreateDynamicObject(978,1639.16577148,1030.74719238,10.66053295,1.00000000,359.25000000,279.84069824); //object(sub_roadright)(6)
	CreateDynamicObject(978,1639.31445312,1040.77343750,10.66053295,0.99975586,359.24743652,258.98840332); //object(sub_roadright)(6)
	CreateDynamicObject(978,1644.19555664,1048.58435059,10.66053295,0.99426270,359.24194336,215.31622314); //object(sub_roadright)(6)
	CreateDynamicObject(978,1653.73779297,1050.98242188,10.66053295,358.73876953,359.02197266,175.61553955); //object(sub_roadright)(6)
	CreateDynamicObject(979,1688.07910156,1040.43652344,10.56053448,0.00000000,0.00000000,63.24044800); //object(sub_roadleft)(11)
	CreateDynamicObject(979,1689.62634277,1049.82604980,10.56053448,0.00000000,0.00000000,94.99731445); //object(sub_roadleft)(12)
	CreateDynamicObject(979,1685.60595703,1059.53820801,10.56053448,0.00000000,0.00000000,128.73828125); //object(sub_roadleft)(13)
	CreateDynamicObject(979,1672.28771973,1070.84753418,10.66053295,0.00000000,359.98498535,158.51281738); //object(sub_roadleft)(14)
	CreateDynamicObject(979,1662.38281250,1073.97998047,10.66053295,0.00000000,0.23303223,166.45074463); //object(sub_roadleft)(15)
	CreateDynamicObject(981,1642.41040039,1058.80126953,10.62031937,0.00000000,0.00000000,359.00000000); //object(helix_barrier)(1)
	CreateDynamicObject(1237,1679.18847656,1068.43481445,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(1)
	CreateDynamicObject(1237,1681.24707031,1068.04052734,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(2)
	CreateDynamicObject(1237,1682.37353516,1064.93505859,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(3)
	CreateDynamicObject(1237,1682.19030762,1066.88598633,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(4)
	CreateDynamicObject(979,1586.13867188,1073.37756348,10.54663277,0.00000000,0.00000000,195.24496460); //object(sub_roadleft)(16)
	CreateDynamicObject(982,1589.80737305,996.29022217,10.42938137,0.00000000,0.00000000,359.75000000); //object(fenceshit)(1)
	CreateDynamicObject(1251,1669.26367188,943.17126465,9.62656212,0.00000000,89.74002075,269.17498779); //object(smashbar)(1)
	CreateDynamicObject(1251,1663.77758789,943.19482422,9.65155411,0.02999878,90.24002075,270.40551758); //object(smashbar)(2)
	CreateDynamicObject(1425,1679.37377930,974.64648438,10.22839165,0.00000000,0.00000000,166.74005127); //object(dyn_roadbarrier_3)(1)
	CreateDynamicObject(1425,1676.20251465,975.21722412,10.22839165,0.00000000,0.00000000,166.73950195); //object(dyn_roadbarrier_3)(2)
	CreateDynamicObject(1425,1659.57690430,976.05676270,10.22839165,0.00000000,0.00000000,158.79949951); //object(dyn_roadbarrier_3)(3)
	CreateDynamicObject(1425,1644.83068848,1008.98120117,10.27280998,0.00000000,0.00000000,53.59136963); //object(dyn_roadbarrier_3)(4)
	CreateDynamicObject(1425,1657.09472656,976.86425781,10.22839165,0.00000000,0.00000000,158.79638672); //object(dyn_roadbarrier_3)(5)
	CreateDynamicObject(1425,1660.17382812,967.48126221,10.27280998,0.00000000,0.00000000,314.34130859); //object(dyn_roadbarrier_3)(6)
	CreateDynamicObject(979,1579.54589844,1066.33984375,10.54663277,0.00000000,0.00000000,254.78942871); //object(sub_roadleft)(18)
	CreateDynamicObject(1422,1656.09289551,1075.61645508,10.23084354,0.00000000,0.00000000,0.00000000); //object(dyn_roadbarrier_5)(1)
	CreateDynamicObject(1422,1706.98571777,1001.51043701,10.18084431,0.00000000,0.00000000,254.79498291); //object(dyn_roadbarrier_5)(2)
	CreateDynamicObject(4526,1643.46948242,962.62353516,11.42118645,0.00000000,0.00000000,328.23678589); //object(sfse_roadblock5)(1)
	CreateDynamicObject(979,1657.77368164,948.56677246,10.41053677,0.00000000,359.75000000,95.28002930); //object(sub_roadleft)(19)
	CreateDynamicObject(979,1659.25683594,948.82977295,10.38553715,0.00000000,0.25000000,290.52392578); //object(sub_roadleft)(20)
	CreateDynamicObject(1228,1658.08374023,943.31597900,10.24144077,0.00000000,0.00000000,269.42498779); //object(roadworkbarrier1)(2)
	CreateDynamicObject(1228,1676.07519531,943.39947510,10.24144077,0.00000000,0.00000000,269.42321777); //object(roadworkbarrier1)(3)
	CreateDynamicObject(978,1677.52661133,949.39538574,10.65245056,0.00000000,0.00000000,89.07507324); //object(sub_roadright)(6)
	CreateDynamicObject(3666,1677.59545898,954.90136719,10.18945408,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(1)
	CreateDynamicObject(3666,1672.57812500,964.55822754,10.26302910,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(2)
	CreateDynamicObject(3666,1677.18994141,944.17822266,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(3)
	CreateDynamicObject(3666,1657.36804199,953.69635010,10.18556023,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(4)
	CreateDynamicObject(3666,1657.44763184,968.57464600,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(5)
	CreateDynamicObject(3666,1647.60424805,960.77246094,10.28679085,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(6)
	CreateDynamicObject(3666,1629.58728027,957.07702637,10.27086163,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(7)
	CreateDynamicObject(3666,1579.30578613,945.32269287,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(8)
	CreateDynamicObject(3666,1589.45898438,1002.96520996,10.25636482,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(9)
	CreateDynamicObject(3666,1589.35205078,988.30346680,10.25539780,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(10)
	CreateDynamicObject(3666,1577.95874023,1061.27893066,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(11)
	CreateDynamicObject(3666,1581.09045410,1071.50317383,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(12)
	CreateDynamicObject(3666,1667.37463379,1072.83593750,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(13)
	CreateDynamicObject(3666,1681.75720215,1067.47766113,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(14)
	CreateDynamicObject(3666,1680.04760742,1068.26159668,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(15)
	CreateDynamicObject(3666,1682.38793945,1066.02844238,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(16)
	CreateDynamicObject(3666,1678.04943848,1068.39697266,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(17)
	CreateDynamicObject(3666,1682.37036133,1063.91259766,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(20)
	CreateDynamicObject(3666,1688.92736816,1055.32495117,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(22)
	CreateDynamicObject(3666,1690.04516602,1044.90979004,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(23)
	CreateDynamicObject(3666,1648.81262207,1033.82922363,10.38374805,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(24)
	CreateDynamicObject(3666,1650.72692871,995.60870361,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(25)
	CreateDynamicObject(3666,1650.43798828,1035.81323242,10.38228512,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(26)
	CreateDynamicObject(3666,1686.61132812,1032.07739258,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(27)
	CreateDynamicObject(3666,1697.60571289,1031.10888672,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(28)
	CreateDynamicObject(3666,1707.29589844,1025.18725586,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(29)
	CreateDynamicObject(3666,1706.42309570,999.83435059,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(30)
	CreateDynamicObject(3666,1696.40063477,995.87847900,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(31)
	CreateDynamicObject(3666,1684.78784180,995.43847656,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(32)
	CreateDynamicObject(3666,1684.89086914,992.49243164,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(33)
	CreateDynamicObject(3666,1696.53332520,992.79431152,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(34)
	CreateDynamicObject(3666,1691.72314453,974.93066406,10.30083847,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(35)
	CreateDynamicObject(3666,1677.82824707,975.04632568,10.28879547,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(36)
	CreateDynamicObject(3666,1702.14624023,974.81048584,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(37)
	CreateDynamicObject(3666,1658.29833984,976.43566895,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(38)
	CreateDynamicObject(3666,1645.21301270,979.46899414,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(39)
	CreateDynamicObject(3666,1638.67126465,987.88208008,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(40)
	CreateDynamicObject(3666,1638.62268066,998.82739258,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(41)
	CreateDynamicObject(3666,1644.53234863,1007.96075439,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(42)
	CreateDynamicObject(3666,1646.18920898,1009.93426514,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(43)
	CreateDynamicObject(3666,1639.94433594,1025.59619141,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(44)
	CreateDynamicObject(3666,1638.12976074,1035.85546875,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(45)
	CreateDynamicObject(3666,1640.09472656,1045.87072754,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(46)
	CreateDynamicObject(3666,1648.43737793,1051.68127441,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(47)
	CreateDynamicObject(3666,1659.42614746,1050.97998047,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(48)
	CreateDynamicObject(3666,1757.25048828,978.34375000,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(49)
	CreateDynamicObject(3666,1756.34899902,917.19671631,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(50)
	CreateDynamicObject(3666,1745.35009766,914.55224609,10.26245213,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(51)
	CreateDynamicObject(3666,1725.31323242,931.25604248,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(52)
	CreateDynamicObject(3666,1719.03552246,922.65020752,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(53)
	CreateDynamicObject(3666,1726.53771973,884.33160400,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(54)
	CreateDynamicObject(3666,1658.67114258,896.66052246,10.27341461,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(55)
	CreateDynamicObject(3666,1668.75451660,891.67272949,10.23200226,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(56)
	CreateDynamicObject(3666,1651.12097168,914.96112061,10.18556023,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(57)
	CreateDynamicObject(3666,1640.02111816,925.33746338,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(58)
	CreateDynamicObject(3666,1641.33703613,931.13525391,10.27264118,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(59)
	CreateDynamicObject(3666,1641.19116211,937.23480225,10.23402023,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(60)
	CreateDynamicObject(979,1638.27954102,886.74786377,10.53363800,0.00000000,0.00000000,319.88998413); //object(sub_roadleft)(21)
	CreateDynamicObject(3666,1661.37426758,1012.50854492,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(62)
	CreateDynamicObject(3666,1672.75329590,1012.70538330,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(63)
	CreateDynamicObject(3666,1672.60913086,1014.33911133,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(64)
	CreateDynamicObject(3666,1661.24877930,1014.37908936,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(65)
	CreateDynamicObject(3666,1650.40039062,1032.08007812,10.38459873,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(67)
	CreateDynamicObject(3666,1650.57897949,991.91479492,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(68)
	CreateDynamicObject(3666,1648.83618164,993.78576660,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(69)
	CreateDynamicObject(18285,1703.57519531,949.79321289,9.88277626,0.00000000,359.50000000,302.74499512); //object(cw_trucklines)(1)
	CreateDynamicObject(3398,1696.49707031,995.02081299,8.75872612,0.00000000,0.00000000,183.33496094); //object(cxrf_floodlite_)(1)
	CreateDynamicObject(3398,1636.53417969,993.58264160,13.75872612,0.00000000,0.00000000,92.02355957); //object(cxrf_floodlite_)(2)
	CreateDynamicObject(3398,1696.74218750,994.02929688,8.75872612,0.00000000,0.00000000,356.74255371); //object(cxrf_floodlite_)(3)
	CreateDynamicObject(3398,1687.43505859,1035.18481445,13.75872612,0.00000000,0.00000000,297.19152832); //object(cxrf_floodlite_)(4)
	CreateDynamicObject(3398,1681.71972656,1067.41662598,13.75872612,0.00000000,0.00000000,327.20092773); //object(cxrf_floodlite_)(5)
	CreateDynamicObject(3398,1580.64599609,1073.16186523,13.75872612,0.00000000,0.00000000,50.56970215); //object(cxrf_floodlite_)(6)
	CreateDynamicObject(3398,1589.69775391,995.32977295,13.75872612,0.00000000,0.00000000,272.09954834); //object(cxrf_floodlite_)(7)
	CreateDynamicObject(3046,1727.05517578,932.58331299,12.00336456,0.00000000,0.00000000,0.00000000); //object(kb_barrel)(1)
	CreateDynamicObject(3046,1731.82116699,932.82812500,10.70648956,0.00000000,0.00000000,0.00000000); //object(kb_barrel)(2)
	CreateDynamicObject(3046,1753.34277344,979.36895752,11.87491894,0.00000000,0.00000000,0.00000000); //object(kb_barrel)(3)
	CreateDynamicObject(3046,1743.56237793,986.84240723,12.49980068,0.00000000,0.00000000,0.00000000); //object(kb_barrel)(4)
	CreateDynamicObject(3046,1746.04492188,987.08642578,12.49980068,0.00000000,0.00000000,0.00000000); //object(kb_barrel)(5)
	CreateDynamicObject(3046,1633.78234863,1031.32189941,13.15500927,0.00000000,0.00000000,0.00000000); //object(kb_barrel)(6)
	CreateDynamicObject(3046,1630.87255859,1030.97155762,13.15500927,0.00000000,0.00000000,0.00000000); //object(kb_barrel)(7)
	CreateDynamicObject(3046,1652.86999512,1075.85571289,11.66095829,0.00000000,0.00000000,0.00000000); //object(kb_barrel)(8)
	CreateDynamicObject(3046,1652.51721191,1077.85205078,11.65701962,0.00000000,0.00000000,0.00000000); //object(kb_barrel)(9)
	CreateDynamicObject(1425,1673.36560059,963.79766846,10.19428062,0.00000000,0.00000000,314.34082031); //object(dyn_roadbarrier_3)(7)
	CreateDynamicObject(1425,1674.31127930,962.49902344,10.16883564,0.00000000,0.00000000,290.52099609); //object(dyn_roadbarrier_3)(8)
	CreateDynamicObject(1425,1677.12048340,956.31591797,10.16883564,0.00000000,0.00000000,292.50195312); //object(dyn_roadbarrier_3)(9)
	CreateDynamicObject(3666,1674.54113770,961.71148682,10.21585274,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(70)
	CreateDynamicObject(3666,1676.88745117,956.96496582,10.19267082,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(71)
	CreateDynamicObject(18451,1666.19763184,919.53814697,10.18409538,0.00000000,358.01501465,304.41998291); //object(cs_oldcarjmp)(1)
	CreateDynamicObject(3928,1659.85766602,911.90710449,9.70267487,0.00000000,359.75000000,322.28500366); //object(helipad)(1)
	CreateDynamicObject(978,67.76,28.50,0.00,0.00,0.00,69.00);
	CreateDynamicObject(978,63.28,27.62,0.00,0.00,0.00,-55.00);
	CreateDynamicObject(978,63.28,27.62,0.00,0.00,0.00,-55.00);
	CreateDynamicObject(978,58.04,35.17,0.00,0.00,0.00,-55.00);
	CreateDynamicObject(978,53.49,35.28,1.00,0.00,0.00,62.00);
	CreateDynamicObject(978,54.01,27.09,1.00,0.00,0.00,-25.00);
	CreateDynamicObject(978,54.01,27.09,1.00,0.00,0.00,-25.00);
	CreateDynamicObject(978,52.99,25.07,1.00,0.00,0.00,-25.00);
	CreateDynamicObject(978,59.79,21.94,1.00,0.00,0.00,-25.00);
	CreateDynamicObject(978,59.36,19.67,1.00,0.00,0.00,4.00);
	CreateDynamicObject(978,59.36,19.67,1.00,0.00,0.00,4.00);
	CreateDynamicObject(978,51.70,23.30,1.00,0.00,0.00,-55.00);
	CreateDynamicObject(978,50.46,19.31,1.00,0.00,0.00,-25.00);
	CreateDynamicObject(978,50.88,15.21,1.00,0.00,0.00,47.00);
	CreateDynamicObject(978,45.80,11.19,2.00,0.00,0.00,-18.00);
	CreateDynamicObject(978,45.15,9.48,2.00,0.00,0.00,-18.00);
	CreateDynamicObject(978,47.05,4.43,2.00,0.00,0.00,62.00);
	CreateDynamicObject(978,44.94,4.99,2.00,0.00,0.00,62.00);
	CreateDynamicObject(978,42.95,-6.13,2.00,0.00,0.00,62.00);
	CreateDynamicObject(978,38.71,-3.46,2.00,0.00,0.00,-33.00);

	//sklad2
	//AddStaticVehicle(411,1589.55773926,697.94226074,10.62785435,0.00000000,-1,-1); //Infernus
	//AddStaticVehicle(411,1589.54504395,690.62475586,10.62031269,0.00000000,-1,-1); //Infernus
	//AddStaticVehicle(411,1589.53442383,683.00213623,10.62031269,0.00000000,-1,-1); //Infernus
	//AddStaticVehicle(562,1582.38842773,698.07189941,10.58140373,0.00000000,-1,-1); //Elegy
	//AddStaticVehicle(562,1582.50585938,690.92620850,10.58140373,0.00000000,-1,-1); //Elegy
	//AddStaticVehicle(562,1582.78479004,682.55255127,10.57386208,0.00000000,-1,-1); //Elegy
	//AddStaticVehicle(402,1586.64929199,671.51922607,10.76031208,0.00000000,-1,-1); //Buffalo
	//AddStaticVehicle(402,1581.38159180,671.33343506,10.76031208,0.00000000,-1,-1); //Buffalo
	CreateDynamicObject(982,1603.55773926,719.30615234,10.50386715,0.00000000,0.00000000,88.32501221); //object(fenceshit)(1)
	CreateDynamicObject(982,1640.71337891,677.59112549,10.50386715,0.00000000,0.00000000,89.57458496); //object(fenceshit)(2)
	CreateDynamicObject(982,1657.67968750,718.69281006,10.50386715,0.00000000,0.00000000,89.57153320); //object(fenceshit)(3)
	CreateDynamicObject(982,1685.49584961,718.94677734,10.50386715,0.00000000,0.00000000,91.07153320); //object(fenceshit)(4)
	CreateDynamicObject(982,1712.49914551,719.04016113,10.50386715,0.00000000,0.00000000,89.32116699); //object(fenceshit)(5)
	CreateDynamicObject(982,1695.58520508,709.03045654,10.50386715,0.00000000,0.00000000,179.63122559); //object(fenceshit)(6)
	CreateDynamicObject(982,1700.11511230,761.94671631,10.50386715,0.00000000,0.00000000,90.30145264); //object(fenceshit)(7)
	CreateDynamicObject(982,1738.58837891,720.02716064,10.50386715,0.00000000,358.01501465,178.90887451); //object(fenceshit)(10)
	CreateDynamicObject(982,1634.59167480,731.52990723,10.50386715,0.00000000,0.00000000,179.62646484); //object(fenceshit)(11)
	CreateDynamicObject(982,1634.53845215,706.04016113,10.50386715,0.00000000,0.00000000,179.62646484); //object(fenceshit)(12)
	CreateDynamicObject(982,1695.81933594,734.78417969,10.50386715,0.00000000,0.00000000,179.62646484); //object(fenceshit)(13)
	CreateDynamicObject(982,1674.52294922,761.77612305,10.47886753,0.00000000,0.00000000,90.29663086); //object(fenceshit)(14)
	CreateDynamicObject(982,1630.64355469,718.79296875,10.50386715,0.00000000,0.00000000,89.57153320); //object(fenceshit)(15)
	CreateDynamicObject(982,1621.48425293,677.69824219,10.50386715,0.00000000,0.00000000,89.57153320); //object(fenceshit)(16)
	CreateDynamicObject(982,1590.45581055,737.48339844,10.50386715,0.00000000,0.00000000,130.00958252); //object(fenceshit)(17)
	CreateDynamicObject(982,1589.53161621,701.87341309,10.50386715,0.00000000,0.00000000,62.51669312); //object(fenceshit)(18)
	CreateDynamicObject(1237,1590.72900391,719.73004150,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(1)
	CreateDynamicObject(1237,1634.53588867,718.75665283,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(2)
	CreateDynamicObject(1237,1634.51501465,693.13775635,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(3)
	CreateDynamicObject(1237,1644.19812012,718.80462646,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(4)
	CreateDynamicObject(1237,1695.66821289,719.12017822,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(5)
	CreateDynamicObject(1237,1695.45080566,696.19885254,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(6)
	CreateDynamicObject(1237,1699.01098633,719.26263428,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(7)
	CreateDynamicObject(1237,1725.25036621,718.87451172,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(8)
	CreateDynamicObject(1237,1734.57763672,729.31341553,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(9)
	CreateDynamicObject(1237,1731.77563477,731.47045898,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(10)
	CreateDynamicObject(1237,1736.93664551,727.25061035,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(11)
	CreateDynamicObject(1237,1737.13818359,712.65313721,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(12)
	CreateDynamicObject(1237,1734.55432129,710.34515381,9.82031155,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(13)
	CreateDynamicObject(1237,1732.11010742,708.10241699,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(14)
	CreateDynamicObject(1237,1710.10986328,733.45690918,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(15)
	CreateDynamicObject(1237,1695.84558105,747.66491699,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(16)
	CreateDynamicObject(1237,1691.97167969,718.98150635,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(17)
	CreateDynamicObject(1237,1709.34191895,707.64923096,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(18)
	CreateDynamicObject(1237,1680.18212891,706.91235352,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(19)
	CreateDynamicObject(1237,1678.88549805,756.06079102,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(20)
	CreateDynamicObject(1237,1680.30078125,757.44464111,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(21)
	CreateDynamicObject(1237,1681.93725586,759.27978516,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(22)
	CreateDynamicObject(1237,1705.25427246,760.87500000,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(23)
	CreateDynamicObject(1237,1707.13061523,758.91204834,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(24)
	CreateDynamicObject(1237,1709.27697754,757.36785889,9.82031441,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(25)
	CreateDynamicObject(1237,1672.62731934,718.54089355,9.82031345,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(26)
	CreateDynamicObject(1237,1670.54565430,718.51672363,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(27)
	CreateDynamicObject(1237,1624.98437500,718.70092773,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(28)
	CreateDynamicObject(1237,1617.09729004,718.66931152,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(29)
	CreateDynamicObject(1237,1651.55212402,718.59259033,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(30)
	CreateDynamicObject(1237,1649.32763672,686.22595215,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(31)
	CreateDynamicObject(1237,1647.01000977,683.94238281,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(32)
	CreateDynamicObject(1237,1644.34082031,680.29797363,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(33)
	CreateDynamicObject(1237,1627.63940430,679.17346191,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(34)
	CreateDynamicObject(1237,1624.71362305,681.57696533,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(35)
	CreateDynamicObject(1237,1621.60107422,683.49768066,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(36)
	CreateDynamicObject(1237,1648.91809082,706.47406006,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(37)
	CreateDynamicObject(1237,1621.61352539,707.12951660,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(38)
	CreateDynamicObject(1237,1648.25878906,732.77880859,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(39)
	CreateDynamicObject(1237,1621.68273926,734.11608887,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(40)
	CreateDynamicObject(1237,1625.69360352,762.99853516,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(41)
	CreateDynamicObject(1237,1623.74145508,760.18243408,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(42)
	CreateDynamicObject(1237,1621.59631348,757.21350098,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(43)
	CreateDynamicObject(1237,1643.34704590,762.05419922,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(44)
	CreateDynamicObject(1237,1645.41540527,758.53094482,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(45)
	CreateDynamicObject(1237,1648.25097656,755.71209717,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(46)
	CreateDynamicObject(1237,1634.55212402,744.38116455,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(47)
	CreateDynamicObject(1237,1701.79467773,683.12005615,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(48)
	CreateDynamicObject(1237,1704.83203125,684.16790771,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(49)
	CreateDynamicObject(1237,1704.83203125,684.16699219,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(50)
	CreateDynamicObject(1237,1707.66271973,685.51953125,9.82031059,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(51)
	CreateDynamicObject(1237,1709.94714355,688.09863281,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(52)
	CreateDynamicObject(1237,1688.37963867,683.73095703,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(53)
	CreateDynamicObject(1237,1685.46020508,684.28125000,9.82031441,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(54)
	CreateDynamicObject(1237,1682.39160156,685.92065430,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(55)
	CreateDynamicObject(1237,1679.57666016,688.29522705,9.82031250,0.00000000,0.00000000,0.00000000); //object(strtbarrier01)(56)
	CreateDynamicObject(1425,1589.31701660,719.63000488,10.27280998,0.00000000,0.00000000,0.00000000); //object(dyn_roadbarrier_3)(1)
	CreateDynamicObject(1425,1587.93151855,719.63885498,10.27280998,0.00000000,0.00000000,0.00000000); //object(dyn_roadbarrier_3)(2)
	CreateDynamicObject(1425,1589.33654785,720.22338867,10.27280998,0.00000000,0.00000000,181.34996033); //object(dyn_roadbarrier_3)(3)
	CreateDynamicObject(1425,1587.90991211,720.17150879,10.27280998,0.00000000,0.00000000,181.34582520); //object(dyn_roadbarrier_3)(4)
	CreateDynamicObject(3472,1634.60131836,718.76843262,9.97953987,0.00000000,0.00000000,0.00000000); //object(circuslampost03)(1)
	CreateDynamicObject(3472,1695.74133301,719.11334229,9.32815647,0.00000000,0.00000000,0.00000000); //object(circuslampost03)(2)
	CreateDynamicObject(1232,1634.51037598,693.16534424,11.47041130,0.00000000,0.00000000,0.00000000); //object(streetlamp1)(1)
	CreateDynamicObject(1232,1634.52197266,744.27838135,11.70534897,0.00000000,0.00000000,0.00000000); //object(streetlamp1)(2)
	CreateDynamicObject(1232,1695.85498047,747.59338379,11.71399117,0.00000000,0.00000000,0.00000000); //object(streetlamp1)(3)
	CreateDynamicObject(1232,1695.37976074,696.21295166,11.71419907,0.00000000,0.00000000,0.00000000); //object(streetlamp1)(4)
	CreateDynamicObject(1232,1725.24072266,718.82977295,11.46805382,0.00000000,0.00000000,0.00000000); //object(streetlamp1)(5)
	CreateDynamicObject(1232,1590.66088867,719.63220215,11.75154686,0.00000000,0.00000000,0.00000000); //object(streetlamp1)(6)
	CreateDynamicObject(3666,1648.12927246,684.97851562,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(1)
	CreateDynamicObject(3666,1645.47106934,681.78350830,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(2)
	CreateDynamicObject(3666,1643.54382324,678.79760742,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(3)
	CreateDynamicObject(3666,1626.01806641,679.95758057,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(4)
	CreateDynamicObject(3666,1622.83935547,681.94641113,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(5)
	CreateDynamicObject(3666,1620.35534668,683.77825928,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(6)
	CreateDynamicObject(3666,1629.06689453,678.42956543,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(7)
	CreateDynamicObject(3666,1649.96899414,687.45349121,10.42871952,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(8)
	CreateDynamicObject(3666,1649.69909668,706.07501221,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(9)
	CreateDynamicObject(3666,1624.57434082,761.76385498,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(10)
	CreateDynamicObject(3666,1622.65136719,758.82641602,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(11)
	CreateDynamicObject(3666,1620.66931152,756.30639648,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(12)
	CreateDynamicObject(3666,1644.42041016,760.45727539,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(13)
	CreateDynamicObject(3666,1647.02502441,757.71795654,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(14)
	CreateDynamicObject(3666,1648.91638184,733.41247559,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(15)
	CreateDynamicObject(3666,1679.53393555,756.73278809,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(16)
	CreateDynamicObject(3666,1680.67639160,758.79522705,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(17)
	CreateDynamicObject(3666,1682.59143066,760.16821289,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(18)
	CreateDynamicObject(3666,1706.10534668,759.94775391,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(19)
	CreateDynamicObject(3666,1708.26159668,758.19244385,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(20)
	CreateDynamicObject(3666,1710.19555664,756.63867188,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(21)
	CreateDynamicObject(3666,1730.37231445,732.97888184,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(22)
	CreateDynamicObject(3666,1733.29479980,730.60314941,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(23)
	CreateDynamicObject(3666,1736.13806152,728.65234375,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(24)
	CreateDynamicObject(3666,1735.98229980,711.45971680,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(25)
	CreateDynamicObject(3666,1733.47326660,709.29211426,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(26)
	CreateDynamicObject(3666,1709.78588867,707.14190674,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(27)
	CreateDynamicObject(3666,1709.09130859,686.62786865,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(28)
	CreateDynamicObject(3666,1706.16076660,684.89672852,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(29)
	CreateDynamicObject(3666,1703.30688477,683.64489746,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(30)
	CreateDynamicObject(3666,1686.78955078,683.71520996,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(31)
	CreateDynamicObject(3666,1683.83471680,684.95275879,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(32)
	CreateDynamicObject(3666,1681.09729004,686.95001221,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(33)
	CreateDynamicObject(3666,1689.70642090,683.53466797,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(34)
	CreateDynamicObject(3666,1671.64099121,718.69293213,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(35)
	CreateDynamicObject(3666,1620.78295898,706.84863281,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(36)
	CreateDynamicObject(3666,1679.30297852,706.39355469,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(37)
	CreateDynamicObject(3666,1710.64550781,733.67669678,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(38)
	CreateDynamicObject(3666,1621.14428711,734.50036621,10.33399773,0.00000000,0.00000000,0.00000000); //object(airuntest_las)(39)
	CreateDynamicObject(1425,1578.66113281,718.43945312,10.26662540,0.00000000,0.00000000,0.00000000); //object(dyn_roadbarrier_3)(5)
	//////ВИП ЗОНА 2Д
	CreateDynamicObject(8071, -1034.78, -330.16, 14.19,   0.00, 0.00, 0.00);
	CreateDynamicObject(3749, -1122.73, -339.94, 18.51,   0.00, 0.00, 90.00);
	CreateDynamicObject(987, -1124.50, -318.30, 13.92,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -1124.57, -306.39, 13.92,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -1124.57, -294.45, 13.92,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -1124.46, -282.57, 13.92,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -1124.44, -270.70, 13.92,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -1124.53, -350.09, 13.92,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -1124.58, -362.03, 13.92,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -1124.53, -373.97, 13.92,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -1124.62, -378.18, 13.92,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -1124.68, -390.04, 13.92,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -1124.34, -350.08, 22.80,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -1124.42, -329.56, 22.80,   0.00, 0.00, 0.00);
	CreateDynamicObject(3487, -1113.96, -289.37, 19.63,   0.00, 0.00, 0.00);
	CreateDynamicObject(3487, -1093.04, -289.36, 19.63,   0.00, 0.00, 0.00);
	CreateDynamicObject(3487, -1072.18, -289.29, 19.63,   0.00, 0.00, 0.00);
	CreateDynamicObject(3487, -1051.40, -289.27, 19.63,   0.00, 0.00, 0.00);
	CreateDynamicObject(3487, -1030.62, -289.36, 19.63,   0.00, 0.00, 0.00);
	CreateDynamicObject(3487, -1010.22, -289.36, 19.63,   0.00, 0.00, 0.00);
	CreateDynamicObject(3487, -989.40, -289.32, 19.63,   0.00, 0.00, 0.00);
	CreateDynamicObject(3485, -1107.27, -373.20, 20.01,   0.00, 0.00, -180.00);
	CreateDynamicObject(3485, -1077.38, -373.15, 20.01,   0.00, 0.00, -180.00);
	CreateDynamicObject(3485, -1047.33, -373.16, 20.01,   0.00, 0.00, -180.00);
	CreateDynamicObject(3485, -1017.40, -373.15, 20.01,   0.00, 0.00, -180.00);
	CreateDynamicObject(705, -1002.59, -332.05, 12.24,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, -1037.32, -332.32, 12.24,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, -1070.97, -334.24, 12.24,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -1638.10, -183.85, 12.94,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -1625.37, -188.74, 12.94,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -1610.58, -190.30, 12.94,   0.00, 0.00, 0.00);
	CreateDynamicObject(19051, -1629.96, -228.12, 13.11,   0.00, 0.00, 0.00);
	CreateDynamicObject(3618, -1227.16, -32.26, 15.74,   0.00, 0.00, 135.00);
	CreateDynamicObject(3618, -1240.32, -19.12, 15.74,   0.00, 0.00, 135.00);
	CreateDynamicObject(3618, -1253.86, -5.69, 15.74,   0.00, 0.00, 135.00);
	CreateDynamicObject(705, -1257.91, 6.37, 12.38,   0.00, 0.00, 0.00);
	CreateDynamicObject(8150, -1264.19, -83.57, 16.10,   0.00, 0.00, 45.00);
	CreateDynamicObject(8150, -1361.54, -180.55, 16.10,   0.00, 0.00, 45.00);
	CreateDynamicObject(710, -1308.82, -128.26, 23.68,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -1317.09, -135.90, 23.68,   0.00, 0.00, 0.00);
	CreateDynamicObject(3485, -1277.04, -117.78, 20.14,   0.00, 0.00, -45.00);
	CreateDynamicObject(3485, -1255.70, -139.00, 20.14,   0.00, 0.00, -45.00);
	CreateDynamicObject(3485, -1234.48, -160.22, 20.14,   0.00, 0.00, -45.00);
	CreateDynamicObject(3485, -1213.27, -181.39, 20.14,   0.00, 0.00, -45.00);
	CreateDynamicObject(3485, -1192.05, -202.71, 20.14,   0.00, 0.00, -45.00);
	CreateDynamicObject(3485, -1225.82, -237.22, 20.14,   0.00, 0.00, -45.00);
	CreateDynamicObject(3485, -1247.15, -215.92, 20.14,   0.00, 0.00, -45.00);
	CreateDynamicObject(3485, -1268.43, -194.66, 20.14,   0.00, 0.00, -45.00);
	CreateDynamicObject(3485, -1289.54, -173.60, 20.14,   0.00, 0.00, -45.00);
	CreateVehicle(477, -1203.4111, -10.2264, 13.9902, 0.0000, -1, -1, 100);
	CreateVehicle(477, -1199.1483, -6.4037, 13.9902, 0.0000, -1, -1, 100);
	CreateVehicle(477, -1195.4080, -2.9722, 13.9902, 0.0000, -1, -1, 100);
	CreateVehicle(479, -1230.8215, -25.9533, 14.0341, -40.0000, -1, -1, 100);
	CreateVehicle(451, -1235.2830, -12.7811, 14.4186, 0.0000, -1, -1, 100);
	CreateVehicle(459, -1246.1135, -14.3998, 14.1792, -47.0000, -1, -1, 100);
	CreateVehicle(466, -1248.5925, 0.3157, 13.9166, 0.0000, -1, -1, 100);
	///Дрифт 9
	CreateDynamicObject(8171, -1397.06, 391.56, 6.15,   0.00, 0.00, 90.00);
	CreateDynamicObject(8171, -1396.90, 355.06, 6.15,   0.00, 0.00, 90.00);
	CreateDynamicObject(10826, -1255.80, 376.79, -10.87,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, -1259.73, 335.44, 6.15,   0.00, 0.00, 90.00);
	CreateDynamicObject(8171, -1258.96, 375.20, 6.15,   0.00, 0.00, 90.00);
	CreateDynamicObject(8171, -1259.00, 415.17, 6.15,   0.00, 0.00, 90.00);
	CreateDynamicObject(8171, -1397.17, 434.53, 6.15,   0.00, 0.00, 90.00);
	CreateDynamicObject(8150, -1662.75, 260.52, 6.92,   0.00, 0.00, 0.00);
	CreateDynamicObject(8150, -1539.75, 260.42, 6.93,   0.00, 0.00, 0.00);
	CreateDynamicObject(711, -1476.80, 260.66, 11.94,   0.00, 0.00, 0.00);
	CreateDynamicObject(711, -1445.01, 260.25, 11.94,   0.00, 0.00, 0.00);
	CreateDynamicObject(983, -1473.24, 260.44, 6.85,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -1466.84, 260.40, 6.85,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -1460.44, 260.43, 6.85,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -1454.05, 260.43, 6.85,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -1447.61, 260.42, 6.85,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -1444.79, 263.75, 6.85,   0.00, 0.00, 0.00);
	CreateDynamicObject(983, -1444.77, 270.16, 6.85,   0.00, 0.00, 0.00);
	CreateDynamicObject(983, -1444.75, 276.54, 6.85,   0.00, 0.00, 0.00);
	CreateDynamicObject(983, -1444.74, 282.90, 6.85,   0.00, 0.00, 0.00);
	CreateDynamicObject(983, -1444.72, 289.20, 6.85,   0.00, 0.00, 0.00);
	CreateDynamicObject(983, -1476.35, 283.21, 6.85,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -1473.14, 286.41, 6.85,   0.00, 0.00, 0.00);
	CreateDynamicObject(983, -1473.16, 292.74, 6.85,   0.00, 0.00, 0.00);
	CreateDynamicObject(983, -1473.14, 299.13, 6.85,   0.00, 0.00, 0.00);
	CreateDynamicObject(983, -1473.12, 305.52, 6.85,   0.00, 0.00, 0.00);
	CreateDynamicObject(983, -1469.90, 308.70, 6.85,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -1450.75, 308.66, 6.85,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -1444.38, 308.63, 6.85,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -1441.53, 292.46, 6.85,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -1435.13, 292.41, 6.85,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1419.14, 292.39, 6.82,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1393.55, 292.41, 6.82,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1367.98, 292.37, 6.82,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -1466.70, 311.91, 6.85,   0.00, 0.00, 0.00);
	CreateDynamicObject(983, -1466.65, 318.21, 6.85,   0.00, 0.00, 0.00);
	CreateDynamicObject(983, -1466.65, 324.57, 6.85,   0.00, 0.00, 0.00);
	CreateDynamicObject(983, -1466.62, 326.82, 6.85,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1466.70, 308.73, 6.14,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1454.04, 308.61, 6.14,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -1428.38, 308.69, 6.82,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1402.82, 308.68, 6.82,   0.00, 0.00, 90.00);
	CreateDynamicObject(1237, -1389.90, 308.70, 6.14,   0.00, 0.00, 0.00);
	CreateDynamicObject(10765, -1400.60, 309.31, 6.23,   0.00, 0.00, 135.00);
	CreateDynamicObject(711, -1461.92, 260.52, 11.94,   0.00, 0.00, 0.00);
	CreateDynamicObject(711, -1444.78, 273.44, 11.94,   0.00, 0.00, 0.00);
	CreateDynamicObject(711, -1444.78, 292.25, 11.94,   0.00, 0.00, 0.00);
	CreateDynamicObject(711, -1473.25, 283.30, 11.94,   0.00, 0.00, 0.00);
	CreateDynamicObject(711, -1473.35, 295.74, 11.94,   0.00, 0.00, 0.00);
	CreateDynamicObject(711, -1473.01, 308.24, 11.94,   0.00, 0.00, 0.00);
	CreateDynamicObject(10830, -1419.67, 316.19, 10.65,   0.00, 0.00, -45.00);
	CreateDynamicObject(10830, -1371.92, 316.21, 10.65,   0.00, 0.00, -45.00);
	CreateDynamicObject(983, -1344.97, 291.88, 6.83,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -1339.50, 294.17, 6.83,   0.00, 0.00, 135.00);
	CreateDynamicObject(983, -1334.98, 298.70, 6.83,   0.00, 0.00, 135.00);
	CreateDynamicObject(983, -1330.46, 303.19, 6.83,   0.00, 0.00, 135.00);
	CreateDynamicObject(1237, -1328.22, 305.67, 6.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(983, -1328.09, 308.66, 6.83,   0.00, 0.00, 0.00);
	CreateDynamicObject(983, -1328.09, 308.66, 6.83,   0.00, 0.00, 0.00);
	CreateDynamicObject(983, -1328.11, 311.81, 6.83,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1328.16, 315.23, 6.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(983, -1330.91, 335.61, 6.83,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -1337.30, 335.59, 6.83,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1315.23, 315.54, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1289.60, 315.53, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1264.01, 315.50, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1238.43, 315.50, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1212.78, 315.55, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1314.92, 335.64, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1289.28, 335.64, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1263.62, 335.63, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1238.02, 335.64, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1325.33, 365.84, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1299.71, 365.86, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1274.16, 365.86, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1248.62, 365.84, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1222.98, 365.85, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1203.75, 365.79, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1190.93, 353.06, 6.78,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -1325.65, 340.34, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1300.04, 340.33, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1274.45, 340.28, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1248.84, 340.30, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1237.95, 340.31, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(3877, -1225.01, 340.29, 7.11,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -1224.94, 335.62, 7.11,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -1223.88, 338.09, 7.11,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -1224.24, 339.14, 7.11,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -1224.30, 336.76, 7.11,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1327.70, 335.65, 6.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1327.49, 340.38, 6.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1308.43, 335.63, 6.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1308.19, 340.39, 6.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1289.26, 335.63, 6.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1288.85, 340.35, 6.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1266.36, 340.30, 6.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1266.74, 335.66, 6.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1244.38, 335.70, 6.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1244.18, 340.32, 6.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(10830, -1318.45, 391.18, 10.57,   0.00, 0.00, -45.00);
	CreateDynamicObject(982, -1464.23, 390.98, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1438.61, 390.97, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(1237, -1451.43, 391.06, 6.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -1464.23, 390.98, 8.07,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1464.23, 390.98, 9.30,   0.00, 0.00, 90.00);
	CreateDynamicObject(1237, -1451.43, 391.06, 7.28,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -1438.61, 390.97, 8.01,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1412.98, 391.10, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(1237, -1425.80, 391.00, 6.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1400.10, 391.11, 6.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1374.36, 391.11, 6.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1348.58, 391.05, 6.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -1387.24, 391.03, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1361.45, 391.03, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1335.63, 391.01, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(1237, -1322.68, 391.09, 6.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -1309.87, 391.07, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(1237, -1296.94, 391.12, 6.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -1284.08, 391.08, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(1237, -1271.11, 391.06, 6.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -1258.21, 391.11, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(1237, -1245.23, 391.15, 6.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -1237.42, 391.11, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(1237, -1224.38, 391.17, 6.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -1190.90, 378.59, 6.78,   0.00, 0.00, 0.00);
	CreateDynamicObject(10830, -1270.67, 391.19, 10.57,   0.00, 0.00, -45.00);
	CreateDynamicObject(982, -1190.93, 404.13, 6.78,   0.00, 0.00, 0.00);
	CreateDynamicObject(10830, -1235.12, 391.22, 10.57,   0.00, 0.00, -45.00);
	CreateDynamicObject(982, -1203.75, 365.79, 8.01,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1203.75, 365.79, 9.18,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1190.90, 378.59, 8.06,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -1190.90, 378.59, 9.34,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -1190.90, 378.59, 10.63,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -1203.73, 415.78, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(711, -1190.99, 416.47, 11.91,   0.00, 0.00, 0.00);
	CreateDynamicObject(711, -1190.45, 410.97, 11.91,   0.00, 0.00, 0.00);
	CreateDynamicObject(711, -1190.55, 405.77, 11.91,   0.00, 0.00, 0.00);
	CreateDynamicObject(711, -1190.52, 401.16, 11.91,   0.00, 0.00, 0.00);
	CreateDynamicObject(711, -1190.56, 396.18, 11.91,   0.00, 0.00, 0.00);
	CreateDynamicObject(711, -1190.44, 391.15, 11.91,   0.00, 0.00, 0.00);
	CreateDynamicObject(711, -1224.94, 391.08, 9.94,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, -1324.70, 338.42, 5.23,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, -1306.47, 337.92, 5.23,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, -1288.56, 338.12, 5.23,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, -1266.68, 337.92, 5.23,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, -1244.49, 337.81, 5.23,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, -1227.36, 337.98, 5.23,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, -1192.24, 365.72, 5.23,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, -1389.28, 370.39, 5.84,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, -1430.31, 370.37, 5.84,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, -1418.03, 375.72, 5.84,   0.00, 0.00, 180.00);
	CreateDynamicObject(987, -1378.79, 375.80, 5.84,   0.00, 0.00, 180.00);
	CreateDynamicObject(987, -1390.85, 406.18, 5.84,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, -1431.51, 406.11, 5.84,   0.00, 0.00, -0.06);
	CreateDynamicObject(987, -1419.43, 411.59, 5.84,   0.00, 0.00, 180.00);
	CreateDynamicObject(987, -1378.63, 411.58, 5.84,   0.00, 0.00, 180.00);
	CreateDynamicObject(979, -1469.36, 416.31, 6.92,   0.00, 0.00, -90.00);
	CreateDynamicObject(979, -1469.37, 425.61, 6.92,   0.00, 0.00, -90.00);
	CreateDynamicObject(979, -1467.01, 434.32, 6.92,   0.00, 0.00, -120.00);
	CreateDynamicObject(979, -1460.06, 439.32, 6.92,   0.00, 0.00, -168.00);
	CreateDynamicObject(979, -1469.46, 401.29, 6.92,   0.00, 0.00, -90.00);
	CreateDynamicObject(979, -1469.44, 391.98, 6.92,   0.00, 0.00, -90.00);
	CreateDynamicObject(979, -1469.41, 382.61, 6.92,   0.00, 0.00, -90.00);
	CreateDynamicObject(979, -1469.39, 373.34, 6.92,   0.00, 0.00, -90.00);
	CreateDynamicObject(979, -1469.35, 364.02, 6.92,   0.00, 0.00, -90.00);
	CreateDynamicObject(979, -1467.59, 355.05, 6.92,   0.00, 0.00, -68.00);
	CreateDynamicObject(979, -1462.69, 347.32, 6.92,   0.00, 0.00, -47.00);
	CreateDynamicObject(979, -1455.36, 341.88, 6.92,   0.00, 0.00, -25.00);
	CreateDynamicObject(1237, -1459.42, 343.96, 6.11,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1465.74, 350.90, 6.11,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1469.24, 359.62, 6.11,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1469.35, 370.07, 6.11,   0.00, 0.00, -0.06);
	CreateDynamicObject(1237, -1462.62, 370.07, 6.11,   0.00, 0.00, -0.06);
	CreateDynamicObject(3877, -1468.58, 370.36, 10.63,   0.00, 84.00, -91.00);
	CreateDynamicObject(3877, -1463.22, 370.26, 10.63,   0.00, 84.00, -91.00);
	CreateDynamicObject(3877, -1465.94, 370.35, 10.63,   0.00, 84.00, -91.00);
	CreateDynamicObject(3785, -1464.88, 370.91, 9.96,   358.43, 0.00, -3.14);
	CreateDynamicObject(3785, -1467.46, 370.73, 9.96,   358.43, 0.00, -3.14);
	CreateDynamicObject(3785, -1455.84, 403.95, 11.39,   356.86, 0.00, -1.57);
	CreateDynamicObject(3785, -1455.84, 403.95, 8.76,   356.86, 0.00, -1.57);
	CreateDynamicObject(3785, -1455.84, 403.95, 7.32,   356.86, 0.00, -1.57);
	CreateDynamicObject(3785, -1455.84, 403.95, 12.90,   356.86, 0.00, -1.57);
	CreateDynamicObject(3785, -1455.84, 403.95, 14.18,   356.86, 0.00, -1.57);
	CreateDynamicObject(3785, -1464.01, 408.78, 9.96,   358.43, 0.00, -3.14);
	CreateDynamicObject(3785, -1468.19, 408.70, 9.96,   358.43, 0.00, -3.14);
	CreateDynamicObject(3785, -1476.82, 419.35, 11.02,   356.86, 0.00, 3.14);
	CreateDynamicObject(3785, -1476.82, 419.35, 11.76,   356.86, 0.00, 3.14);
	CreateDynamicObject(3785, -1476.82, 419.35, 12.56,   356.86, 0.00, 3.14);
	CreateDynamicObject(3785, -1476.82, 419.35, 13.36,   356.86, 0.00, 3.14);
	CreateDynamicObject(3785, -1476.82, 419.35, 14.20,   356.86, 0.00, 3.14);
	CreateDynamicObject(3785, -1476.82, 420.03, 14.20,   356.86, 0.00, 3.14);
	CreateDynamicObject(3785, -1476.80, 420.65, 14.02,   356.86, 0.00, 3.14);
	CreateDynamicObject(3785, -1476.77, 420.91, 13.52,   356.86, 0.00, 3.14);
	CreateDynamicObject(3785, -1476.84, 420.72, 12.96,   356.86, 0.00, 3.14);
	CreateDynamicObject(3785, -1476.83, 420.14, 12.56,   356.86, 0.00, 3.14);
	CreateDynamicObject(3785, -1476.71, 420.48, 11.96,   356.86, 0.00, 3.14);
	CreateDynamicObject(3785, -1476.62, 420.79, 11.42,   356.86, 0.00, 3.14);
	CreateDynamicObject(3785, -1476.49, 421.21, 11.06,   356.86, 0.00, 3.14);
	CreateDynamicObject(3785, -1476.59, 423.43, 11.06,   356.86, 0.00, 3.14);
	CreateDynamicObject(3785, -1476.59, 423.43, 11.82,   356.86, 0.00, 3.14);
	CreateDynamicObject(3785, -1476.59, 423.43, 12.58,   356.86, 0.00, 3.14);
	CreateDynamicObject(3785, -1476.59, 423.43, 13.39,   356.86, 0.00, 3.14);
	CreateDynamicObject(3785, -1476.59, 423.43, 14.15,   356.86, 0.00, 3.14);
	CreateDynamicObject(3785, -1476.59, 423.43, 15.49,   356.86, 0.00, 3.14);
	CreateDynamicObject(3785, -1476.77, 426.72, 11.86,   356.86, 0.00, 3.14);
	CreateDynamicObject(3785, -1476.77, 426.72, 12.70,   356.86, 0.00, 3.14);
	CreateDynamicObject(3785, -1476.77, 426.72, 13.55,   356.86, 0.00, 3.14);
	CreateDynamicObject(3785, -1476.77, 426.72, 14.28,   356.86, 0.00, 3.14);
	CreateDynamicObject(3785, -1476.76, 427.32, 14.38,   -90.00, 0.00, 3.00);
	CreateDynamicObject(3785, -1476.81, 428.02, 14.38,   -90.00, 0.00, 3.00);
	CreateDynamicObject(3785, -1476.78, 428.70, 14.38,   -90.00, 0.00, 3.00);
	CreateDynamicObject(3785, -1476.78, 428.70, 10.95,   -90.00, 0.00, 3.00);
	CreateDynamicObject(3785, -1476.75, 427.96, 10.95,   -90.00, 0.00, 3.00);
	CreateDynamicObject(3785, -1476.70, 427.24, 10.95,   -90.00, 0.00, 3.00);
	CreateDynamicObject(3785, -1476.82, 431.16, 11.02,   356.86, 0.00, 3.14);
	CreateDynamicObject(3785, -1476.82, 431.16, 11.76,   356.86, 0.00, 3.14);
	CreateDynamicObject(3785, -1476.82, 431.16, 12.57,   356.86, 0.00, 3.14);
	CreateDynamicObject(3785, -1476.82, 431.16, 13.37,   356.86, 0.00, 3.14);
	CreateDynamicObject(3785, -1476.84, 431.16, 14.23,   356.86, 0.00, 3.14);
	CreateDynamicObject(3785, -1476.81, 431.90, 14.38,   -90.00, 0.00, 3.00);
	CreateDynamicObject(3785, -1476.79, 432.67, 14.38,   -90.00, 0.00, 3.00);
	CreateDynamicObject(3785, -1476.77, 433.39, 14.38,   -90.00, 0.00, 3.00);
	CreateDynamicObject(3785, -1476.81, 433.94, 14.23,   356.86, 0.00, 3.14);
	CreateDynamicObject(3785, -1476.81, 433.94, 13.41,   356.86, 0.00, 3.14);
	CreateDynamicObject(3785, -1476.81, 433.94, 12.55,   356.86, 0.00, 3.14);
	CreateDynamicObject(3785, -1476.81, 433.94, 11.67,   356.86, 0.00, 3.14);
	CreateDynamicObject(3785, -1476.81, 433.94, 10.98,   356.86, 0.00, 3.14);
	CreateDynamicObject(3785, -1476.73, 431.74, 10.95,   -90.00, 0.00, 3.00);
	CreateDynamicObject(3785, -1476.79, 432.64, 10.95,   -90.00, 0.00, 3.00);
	CreateDynamicObject(3785, -1476.79, 433.37, 10.95,   -90.00, 0.00, 3.00);
	CreateDynamicObject(982, -1225.25, 428.62, 6.78,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -1225.18, 454.26, 6.78,   0.00, 0.00, 0.00);
	CreateDynamicObject(10773, -1214.62, 422.23, 8.69,   0.00, 0.00, 0.00);
	CreateDynamicObject(10773, -1202.20, 428.79, 8.69,   0.00, 0.00, -180.00);
	CreateDynamicObject(705, -1205.19, 434.83, 4.78,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -1324.98, 434.09, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(3877, -1338.09, 434.07, 7.83,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -1338.10, 435.74, 7.83,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -1338.18, 437.12, 7.83,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -1299.37, 434.09, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1276.87, 432.93, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1273.76, 434.10, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(10830, -1313.60, 457.37, 10.57,   0.00, 0.00, -45.00);
	CreateDynamicObject(983, -1260.84, 432.95, 6.81,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -1257.73, 434.14, 6.81,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -1254.46, 432.93, 6.81,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -1254.49, 434.17, 6.81,   0.00, 0.00, 90.00);
	CreateDynamicObject(10830, -1276.56, 457.46, 10.57,   0.00, 0.00, -44.88);
	CreateDynamicObject(983, -1225.19, 469.57, 6.81,   0.00, 0.00, 180.00);
	CreateDynamicObject(3281, -1226.57, 474.01, 7.06,   0.00, 0.00, -45.00);
	CreateDynamicObject(3281, -1229.13, 476.55, 7.06,   0.00, 0.00, -45.00);
	CreateDynamicObject(3281, -1231.75, 479.09, 7.06,   0.00, 0.00, -45.00);
	CreateDynamicObject(3281, -1237.84, 481.72, 7.06,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -1237.84, 481.72, 7.06,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -1241.42, 481.74, 7.06,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -1245.02, 481.72, 7.06,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -1248.59, 481.70, 7.06,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -1252.22, 481.72, 7.06,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1235.79, 481.75, 6.14,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1234.28, 481.59, 6.14,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1233.15, 480.59, 6.14,   0.00, 0.00, 0.00);
	CreateDynamicObject(8150, -1400.49, 481.98, 7.59,   0.00, 0.00, 180.00);
	CreateDynamicObject(8150, -1481.54, 481.98, 7.59,   0.00, 0.00, 180.00);
	CreateDynamicObject(8150, -1394.48, 479.33, 12.66,   -62.00, 0.00, 180.00);
	CreateDynamicObject(8150, -1394.51, 475.01, 14.73,   -62.00, 0.00, 180.00);
	CreateDynamicObject(8150, -1394.68, 468.54, 16.56,   -90.00, 0.00, 180.00);
	CreateDynamicObject(8150, -1394.69, 461.79, 16.56,   -90.00, 0.00, 180.00);
	CreateDynamicObject(8150, -1394.73, 455.16, 15.01,   -120.00, 0.00, 180.00);
	CreateDynamicObject(982, -1350.82, 461.65, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(1237, -1338.17, 461.76, 6.11,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1363.76, 461.65, 6.11,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -1386.73, 470.30, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(1237, -1373.99, 470.31, 6.11,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1399.63, 470.32, 6.11,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -1431.97, 462.85, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1431.65, 471.02, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(1237, -1419.11, 462.90, 6.11,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1418.94, 471.15, 6.11,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1444.98, 462.86, 6.11,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1444.62, 471.06, 6.11,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -1505.07, 461.16, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(3443, -1531.91, 444.03, 9.07,   0.00, 0.00, -90.00);
	CreateDynamicObject(3443, -1532.02, 413.05, 9.07,   0.00, 0.00, -90.00);
	CreateDynamicObject(3443, -1532.09, 382.21, 9.07,   0.00, 0.00, -90.00);
	CreateDynamicObject(3443, -1559.97, 362.30, 9.07,   0.00, 0.00, -180.00);
	CreateDynamicObject(3443, -1588.95, 362.31, 9.07,   0.00, 0.00, -180.00);
	CreateDynamicObject(982, -1531.97, 461.24, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(1237, -1544.79, 461.13, 6.12,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -1551.91, 450.61, 6.78,   0.00, 0.00, 146.00);
	CreateDynamicObject(1237, -1559.03, 439.86, 6.12,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -1569.69, 424.53, 6.78,   0.00, 0.00, 146.00);
	CreateDynamicObject(1237, -1562.57, 435.25, 6.12,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -1583.97, 403.35, 6.78,   0.00, 0.00, 146.00);
	CreateDynamicObject(982, -1598.36, 382.07, 6.78,   0.00, 0.00, 146.00);
	CreateDynamicObject(705, -1603.68, 372.44, 5.83,   0.00, 0.00, 0.00);
	CreateDynamicObject(983, -1606.45, 368.44, 6.74,   0.00, 0.00, -18.00);
	CreateDynamicObject(983, -1608.06, 362.27, 6.74,   0.00, 0.00, -11.00);
	CreateDynamicObject(982, -1637.13, 352.16, 6.78,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -1637.18, 326.58, 6.78,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -1637.20, 300.97, 6.78,   0.00, 0.00, 0.00);
	CreateDynamicObject(10789, -1658.18, 325.31, 8.74,   3.14, 0.00, 2.36);
	CreateDynamicObject(982, -1637.13, 352.16, 8.02,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -1637.13, 352.16, 9.29,   0.00, 0.00, 0.00);
	CreateDynamicObject(1686, -1647.41, 319.84, 6.18,   0.00, 0.00, -45.00);
	CreateDynamicObject(1686, -1652.97, 314.41, 6.18,   0.00, 0.00, -45.00);
	CreateDynamicObject(1686, -1659.17, 321.24, 6.18,   0.00, 0.00, -45.00);
	CreateDynamicObject(1686, -1654.06, 326.61, 6.18,   0.00, 0.00, -45.00);
	CreateDynamicObject(982, -1637.18, 326.58, 8.03,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -1637.18, 326.58, 9.32,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -1637.20, 300.97, 8.01,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -1637.20, 300.97, 9.34,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -1608.91, 304.33, 6.78,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -1608.91, 304.33, 7.98,   0.00, 0.00, 0.00);
	CreateDynamicObject(3749, -1639.07, 278.48, 11.46,   0.00, 0.00, 90.00);
	CreateDynamicObject(11417, -1640.57, 297.43, 10.61,   356.86, 0.00, 3.14);
	CreateDynamicObject(987, -1637.36, 260.74, 5.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1575.77, 283.29, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1575.80, 283.30, 8.00,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1595.02, 283.28, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -1595.02, 283.28, 7.99,   0.00, 0.00, 90.00);
	CreateDynamicObject(3443, -1593.50, 304.43, 9.11,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, -1572.37, 289.33, 5.30,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -1577.76, 285.11, 7.03,   0.00, 0.00, 90.00);
	CreateDynamicObject(3281, -1577.78, 288.74, 7.03,   0.00, 0.00, 90.00);
	CreateDynamicObject(3281, -1577.77, 292.35, 7.03,   0.00, 0.00, 90.00);
	CreateDynamicObject(3281, -1577.78, 295.94, 7.03,   0.00, 0.00, 90.00);
	CreateDynamicObject(1237, -1608.93, 291.39, 6.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1608.93, 291.39, 7.42,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1607.99, 283.23, 6.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1607.99, 283.23, 7.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1607.99, 283.23, 8.53,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1608.93, 291.39, 8.47,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -1608.63, 297.13, 6.15,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -1608.62, 303.83, 6.15,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -1608.61, 310.58, 6.15,   0.00, 0.00, 0.00);
	CreateDynamicObject(3443, -1704.12, 276.23, 9.09,   0.00, 0.00, 90.00);
	CreateDynamicObject(3528, -1636.31, 286.03, 13.47,   0.00, 0.00, 0.00);
	CreateDynamicObject(3528, -1635.84, 270.63, 13.47,   0.00, 0.00, 0.00);
	CreateDynamicObject(8644, -1635.54, 278.61, 15.72,   0.00, 0.00, -153.00);
	CreateDynamicObject(3558, -1653.07, 267.90, 8.93,   0.00, 0.00, 0.00);
	CreateDynamicObject(3558, -1669.38, 267.70, 8.93,   0.00, 0.00, 0.00);
	CreateDynamicObject(3558, -1683.24, 314.45, 8.89,   0.00, 0.00, -135.00);
	CreateDynamicObject(3558, -1693.93, 300.45, 8.89,   0.00, 0.00, -113.00);
	CreateDynamicObject(672, -1705.10, 293.79, 6.88,   356.86, 0.00, -1.83);
	CreateDynamicObject(672, -1686.28, 264.95, 6.88,   356.86, 0.00, -1.83);
	CreateDynamicObject(18761, -1562.91, 272.13, 10.12,   0.00, 0.00, 90.00);
	CreateDynamicObject(3281, -1562.60, 282.68, 7.03,   0.00, 0.00, 90.00);
	CreateDynamicObject(3281, -1562.85, 261.63, 7.03,   0.00, 0.00, 90.00);
	CreateDynamicObject(1262, -1563.08, 263.32, 7.22,   0.00, 0.00, 55.00);
	CreateDynamicObject(1262, -1563.08, 263.32, 9.51,   0.00, 0.00, 55.00);
	CreateDynamicObject(1262, -1563.08, 263.32, 11.45,   0.00, 0.00, 55.00);
	CreateDynamicObject(1262, -1563.08, 263.32, 13.70,   0.00, 0.00, 55.00);
	CreateDynamicObject(1262, -1563.22, 281.06, 7.22,   0.00, 0.00, 120.00);
	CreateDynamicObject(1262, -1563.22, 281.06, 9.30,   0.00, 0.00, 120.00);
	CreateDynamicObject(1262, -1563.22, 281.06, 11.33,   0.00, 0.00, 120.00);
	CreateDynamicObject(1262, -1563.22, 281.06, 13.47,   0.00, 0.00, 120.00);
	CreateDynamicObject(982, -1575.83, 272.71, 6.78,   0.00, 0.00, 90.00);
	CreateDynamicObject(1237, -1588.75, 272.69, 6.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1562.91, 272.64, 6.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(711, -1468.49, 260.72, 11.94,   0.00, 0.00, 0.00);
	CreateDynamicObject(711, -1454.10, 260.47, 11.94,   0.00, 0.00, 0.00);
	CreateDynamicObject(711, -1444.90, 267.28, 11.94,   0.00, 0.00, 0.00);
	CreateDynamicObject(711, -1444.74, 281.99, 11.94,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1234.28, 481.59, 6.14,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1251.21, 432.93, 6.14,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1251.19, 434.16, 6.14,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, -1250.85, 433.55, 6.14,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -1544.39, 459.49, 6.12,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -1552.31, 448.44, 6.12,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -1558.15, 440.03, 6.12,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -1562.79, 433.75, 6.12,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -1569.44, 423.42, 6.12,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -1577.02, 411.82, 6.12,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -1584.65, 400.32, 6.12,   0.00, 0.00, 0.00);
	CreateVehicle(411, -1504.9368, 302.7291, 53.3254, 0.0000, -1, -1, 100);
	CreateVehicle(411, -1504.7400, 310.1259, 53.3254, 0.0000, -1, -1, 100);
	CreateVehicle(411, -1504.6110, 334.9808, 53.3254, 0.0000, -1, -1, 100);
	CreateVehicle(411, -1504.7894, 341.3065, 53.3254, 0.0000, -1, -1, 100);
	////НОВОЕ ДМ ЗОНА
	CreateDynamicObject(18759, -1367.35, -16.32, 13.09,   0.00, 0.00, 45.00);
	CreateDynamicObject(19129, -1677.28, -224.77, 13.10,   0.00, 0.00, 0.00);
	CreateDynamicObject(19129, -1677.29, -244.58, 13.10,   0.00, 0.00, 0.00);
	CreateDynamicObject(19129, -1657.50, -244.56, 13.10,   0.00, 0.00, 0.00);
	CreateDynamicObject(19129, -1657.56, -224.70, 13.10,   0.00, 0.00, 0.00);
	/////НОВАЯ ТРАССА
	CreateDynamicObject(8171, -1754.34, -317.63, 13.07,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, -1754.26, -455.68, 13.07,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, -1754.35, -179.45, 13.07,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, -1714.57, -179.64, 13.07,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, -1714.61, -41.56, 13.07,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, -1754.27, -41.50, 13.07,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, -1754.24, 96.39, 13.07,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, -1714.56, 96.52, 13.07,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, -1714.69, 234.23, 13.07,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, -1754.28, 234.37, 13.07,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, -1754.39, 371.85, 13.07,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, -1714.66, 372.33, 13.07,   0.00, 0.00, 0.00);
	CreateDynamicObject(8150, -1733.47, -418.75, 13.11,   0.00, 0.00, 90.00);
	CreateDynamicObject(8150, -1733.44, -307.63, 13.11,   0.00, 0.00, 90.00);
	CreateDynamicObject(16092, -1746.52, -480.76, 13.13,   0.00, 0.00, 90.00);
	CreateDynamicObject(16092, -1761.62, -480.74, 13.13,   0.00, 0.00, 90.00);
	CreateDynamicObject(1262, -1754.14, -481.60, 18.46,   0.00, 0.00, 180.00);
	CreateDynamicObject(1262, -1754.14, -481.60, 16.92,   0.00, 0.00, 180.00);
	CreateDynamicObject(1262, -1754.14, -481.60, 15.44,   0.00, 0.00, 180.00);
	CreateDynamicObject(983, -1754.09, -484.71, 13.66,   0.00, 0.00, 0.00);
	CreateDynamicObject(983, -1754.08, -491.09, 13.66,   0.00, 0.00, 0.00);
	CreateDynamicObject(18761, -1706.76, 311.70, 19.73,   0.00, 0.00, 0.00);
	CreateDynamicObject(18761, -1725.10, 311.73, 19.73,   0.00, 0.00, 0.00);
	CreateDynamicObject(18761, -1743.60, 311.72, 19.73,   0.00, 0.00, 0.00);
	CreateDynamicObject(18761, -1762.06, 311.78, 19.73,   0.00, 0.00, 0.00);
	CreateDynamicObject(18778, -1752.24, 86.15, 14.42,   0.00, 0.00, 0.00);
	//////////ДРИФТ 10////////////////////////////////////
	CreateDynamicObject(8171, -709.26, 1961.38, 3.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, -709.27, 1823.22, 3.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, -669.37, 1956.58, 3.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, -629.43, 1956.58, 3.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, -669.42, 1818.32, 3.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, -629.39, 1818.31, 3.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, -749.24, 1957.77, 3.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, -789.18, 1957.78, 3.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, -749.22, 1819.54, 3.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, -789.16, 1819.52, 3.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, -789.12, 1681.29, 3.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, -749.19, 1681.40, 3.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, -709.25, 1685.04, 3.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, -669.35, 1680.03, 3.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, -629.42, 1680.11, 3.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(16092, -796.63, 1929.81, 3.31,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -789.08, 1916.60, 3.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -803.71, 1916.89, 3.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(4004, -708.52, 1893.83, 14.73,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -791.07, 1862.35, 3.62,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -791.07, 1862.35, 4.79,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -764.20, 1871.12, 3.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -778.30, 1849.53, 3.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -764.22, 1845.48, 3.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -772.52, 1822.91, 3.62,   0.00, 0.00, -40.00);
	CreateDynamicObject(982, -787.67, 1827.94, 3.62,   0.00, 0.00, -47.00);
	CreateDynamicObject(982, -797.02, 1806.39, 3.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -780.77, 1800.39, 3.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -780.80, 1774.82, 3.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -797.03, 1780.73, 3.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -797.06, 1755.13, 3.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -790.15, 1731.73, 3.62,   0.00, 0.00, 33.00);
	CreateDynamicObject(982, -773.75, 1751.22, 3.62,   0.00, 0.00, 33.00);
	CreateDynamicObject(982, -781.33, 1740.89, 3.62,   0.00, 0.00, 33.00);
	CreateDynamicObject(982, -781.31, 1740.98, 4.81,   0.00, 0.00, 33.00);
	CreateDynamicObject(982, -783.10, 1708.07, 3.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -766.84, 1727.85, 3.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -766.87, 1702.28, 3.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -783.15, 1682.50, 3.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -770.47, 1669.67, 3.62,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -757.67, 1682.47, 3.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -757.63, 1708.09, 3.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -757.61, 1733.66, 3.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -757.62, 1759.30, 3.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -757.55, 1784.90, 3.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -757.53, 1810.47, 3.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -757.57, 1836.11, 3.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(983, -754.41, 1848.93, 3.55,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -747.98, 1848.92, 3.55,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -760.97, 1867.91, 3.55,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -754.49, 1867.74, 3.55,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -743.26, 1867.77, 3.55,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -736.89, 1867.80, 3.55,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -733.72, 1870.96, 3.55,   0.00, 0.00, 0.00);
	CreateDynamicObject(983, -733.72, 1877.31, 3.55,   0.00, 0.00, 0.00);
	CreateDynamicObject(983, -733.75, 1883.72, 3.55,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -744.77, 1836.12, 3.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -733.64, 1854.88, 3.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -733.67, 1829.28, 3.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -744.72, 1810.58, 3.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -733.66, 1803.68, 3.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -744.69, 1785.03, 3.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(983, -741.43, 1772.21, 3.65,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -735.01, 1772.21, 3.65,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -730.46, 1790.83, 3.65,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -724.06, 1790.82, 3.65,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -728.63, 1772.21, 3.65,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -717.67, 1790.84, 3.65,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -714.47, 1787.67, 3.65,   0.00, 0.00, 0.00);
	CreateDynamicObject(983, -714.46, 1781.29, 3.65,   0.00, 0.00, 0.00);
	CreateDynamicObject(983, -714.46, 1774.88, 3.65,   0.00, 0.00, 0.00);
	CreateDynamicObject(983, -714.47, 1768.50, 3.65,   0.00, 0.00, 0.00);
	CreateDynamicObject(983, -714.48, 1762.10, 3.65,   0.00, 0.00, 0.00);
	CreateDynamicObject(983, -717.68, 1758.89, 3.65,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -724.08, 1758.92, 3.65,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -730.53, 1758.85, 3.65,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -733.68, 1755.71, 3.65,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -744.68, 1759.38, 3.64,   0.00, 0.00, 0.00);
	CreateDynamicObject(983, -744.69, 1743.33, 3.65,   0.00, 0.00, 0.00);
	CreateDynamicObject(983, -741.51, 1740.14, 3.65,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -735.10, 1740.16, 3.65,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -728.66, 1740.16, 3.65,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -730.47, 1752.40, 3.65,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -724.12, 1752.47, 3.65,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -717.72, 1752.53, 3.65,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -722.28, 1740.16, 3.65,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -715.90, 1740.11, 3.65,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -711.34, 1752.48, 3.65,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -704.93, 1752.47, 3.65,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -698.51, 1752.43, 3.65,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -712.71, 1727.31, 3.64,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -695.32, 1739.60, 3.64,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -682.61, 1726.86, 3.64,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -699.88, 1714.54, 3.64,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -675.74, 1708.52, 3.64,   0.00, 0.00, 62.00);
	CreateDynamicObject(982, -641.76, 1701.47, 3.64,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -641.78, 1726.46, 3.64,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -654.60, 1714.07, 3.64,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -654.64, 1739.56, 3.64,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -669.77, 1739.65, 3.64,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -669.82, 1765.26, 3.64,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -654.61, 1765.16, 3.64,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -654.59, 1790.80, 3.64,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -682.61, 1778.02, 3.64,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -667.41, 1803.65, 3.64,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -695.52, 1790.80, 3.64,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -680.22, 1816.44, 3.64,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -695.51, 1816.44, 3.64,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -695.57, 1842.07, 3.64,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -667.47, 1829.26, 3.64,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -682.72, 1854.84, 3.64,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -654.65, 1842.09, 3.64,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -669.93, 1867.63, 3.64,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -669.91, 1893.15, 3.64,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -654.61, 1867.66, 3.64,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -654.63, 1893.28, 3.64,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -654.65, 1918.88, 3.64,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -670.13, 1918.85, 3.64,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -670.16, 1944.43, 3.64,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -654.59, 1944.48, 3.64,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -654.55, 1969.98, 3.64,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -667.31, 1982.65, 3.64,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -683.16, 1957.18, 3.64,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -708.88, 1957.18, 3.64,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -692.91, 1982.69, 3.64,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -718.43, 1982.61, 3.64,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -744.13, 1982.62, 3.64,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -734.49, 1957.18, 3.64,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -760.14, 1957.18, 3.64,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -769.77, 1982.63, 3.64,   0.00, 0.00, 90.00);
	CreateDynamicObject(982, -795.37, 1982.64, 3.64,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -789.09, 1933.61, 3.34,   0.00, 0.00, 0.00);
	CreateDynamicObject(983, -789.05, 1940.02, 3.34,   0.00, 0.00, 0.00);
	CreateDynamicObject(983, -789.03, 1946.39, 3.34,   0.00, 0.00, 0.00);
	CreateDynamicObject(983, -789.01, 1952.75, 3.34,   0.00, 0.00, 0.00);
	CreateDynamicObject(983, -773.03, 1954.08, 3.34,   0.00, 0.00, 0.00);
	CreateDynamicObject(983, -785.81, 1955.90, 3.34,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -782.62, 1952.72, 3.34,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -803.51, 1943.55, 3.64,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -803.52, 1969.13, 3.64,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -803.49, 1982.06, 3.91,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -788.74, 1955.78, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -782.68, 1955.95, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -773.19, 1957.20, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -803.50, 1862.63, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -778.31, 1862.21, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -778.58, 1837.10, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -764.30, 1832.69, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -780.72, 1813.09, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -797.00, 1819.14, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -788.41, 1751.96, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -780.79, 1761.94, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -797.08, 1743.27, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -783.24, 1721.13, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -766.80, 1740.55, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -766.87, 1689.86, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -757.77, 1670.00, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -783.08, 1669.74, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -757.55, 1848.81, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -744.84, 1848.82, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -751.41, 1867.68, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -746.31, 1867.59, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -733.76, 1790.93, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -725.38, 1772.48, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -733.51, 1758.74, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -733.53, 1752.49, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -712.79, 1740.12, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -695.75, 1752.38, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -695.29, 1726.79, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -712.70, 1714.66, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -687.15, 1714.57, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -664.33, 1702.71, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -654.61, 1701.41, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -659.62, 1702.13, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -654.62, 1726.70, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -669.87, 1727.07, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -669.79, 1778.25, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -654.62, 1803.60, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -680.23, 1803.74, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -695.34, 1778.08, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -679.98, 1829.22, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -695.41, 1854.75, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -669.85, 1854.83, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -654.63, 1829.30, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -670.20, 1957.06, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -654.61, 1982.71, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, -705.66, 1982.69, 4.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -692.82, 1955.45, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -671.44, 1955.23, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -682.05, 1956.30, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -703.35, 1956.40, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -713.39, 1956.43, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -723.93, 1956.21, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -736.12, 1956.38, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -747.89, 1956.52, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -759.04, 1956.37, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -771.53, 1956.56, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -783.78, 1955.17, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -787.81, 1954.99, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -788.29, 1945.05, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -788.44, 1932.23, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -788.47, 1939.15, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -788.32, 1950.67, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -787.90, 1918.33, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -787.99, 1926.28, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -788.20, 1910.65, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -788.20, 1910.65, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -781.14, 1861.22, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -787.35, 1861.35, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -793.78, 1861.70, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -800.11, 1861.67, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -780.80, 1835.88, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -785.20, 1831.23, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -789.74, 1827.07, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -793.98, 1822.97, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -798.06, 1805.17, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -797.91, 1792.44, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -797.97, 1774.94, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -798.00, 1759.24, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -798.57, 1743.63, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -774.33, 1730.40, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -756.32, 1738.09, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -756.71, 1745.99, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -756.93, 1752.98, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -756.94, 1759.90, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -756.97, 1768.86, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -756.66, 1777.80, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -756.78, 1787.48, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -756.69, 1796.19, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -756.98, 1808.88, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -756.87, 1820.65, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -756.85, 1831.37, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -756.85, 1846.06, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -745.49, 1845.37, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(4021, -683.92, 1868.97, 9.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(4048, -711.68, 1823.98, 14.85,   0.00, 0.00, 90.00);
	CreateDynamicObject(4123, -720.16, 1684.08, 14.15,   0.00, 0.00, 90.00);
	CreateDynamicObject(4178, -661.97, 1691.32, 6.69,   0.00, 0.00, 0.00);
	CreateDynamicObject(4193, -637.19, 1746.96, 16.81,   0.00, 0.00, -90.00);
	CreateDynamicObject(5060, -665.73, 1815.95, 5.45,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -678.83, 1825.94, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -668.82, 1827.73, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -673.97, 1827.34, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -672.21, 1857.48, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -672.21, 1857.48, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -692.87, 1857.07, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -652.36, 1764.04, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -652.49, 1770.61, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -652.40, 1776.95, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -652.42, 1782.75, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -652.48, 1787.86, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -652.45, 1792.91, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -652.16, 1798.01, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -652.11, 1802.71, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, -659.16, 1804.44, 6.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(981, -652.37, 1844.68, 3.68,   0.00, 0.00, 90.00);
	CreateDynamicObject(981, -652.46, 1877.17, 3.68,   0.00, 0.00, 90.00);
	CreateDynamicObject(981, -652.51, 1909.07, 3.68,   0.00, 0.00, 90.00);
	CreateDynamicObject(981, -652.66, 1942.48, 3.68,   0.00, 0.00, 90.00);
	CreateDynamicObject(981, -671.58, 1940.02, 3.68,   0.00, 0.00, 90.00);
	CreateDynamicObject(981, -671.56, 1909.73, 3.68,   0.00, 0.00, 90.00);
	CreateDynamicObject(981, -652.53, 1971.57, 3.68,   0.00, 0.00, 90.00);
	CreateDynamicObject(981, -669.36, 1983.94, 3.68,   0.00, 0.00, 0.00);
	CreateDynamicObject(981, -699.65, 1984.06, 3.68,   0.00, 0.00, 0.00);
	CreateDynamicObject(981, -729.91, 1984.09, 3.68,   0.00, 0.00, 0.00);
	CreateDynamicObject(981, -760.68, 1984.06, 3.68,   0.00, 0.00, 0.00);
	CreateDynamicObject(981, -791.46, 1983.97, 3.68,   0.00, 0.00, 0.00);
	CreateDynamicObject(1262, -790.79, 1931.00, 10.82,   0.00, 0.00, 0.00);
	CreateDynamicObject(1262, -792.07, 1930.66, 10.82,   0.00, 0.00, 0.00);
	CreateDynamicObject(1262, -793.57, 1930.64, 10.82,   0.00, 0.00, 0.00);
	CreateDynamicObject(1262, -795.00, 1930.66, 10.82,   0.00, 0.00, 0.00);
	CreateDynamicObject(1262, -796.56, 1930.72, 10.82,   0.00, 0.00, 0.00);
	CreateDynamicObject(1262, -798.05, 1930.69, 10.82,   0.00, 0.00, 0.00);
	CreateDynamicObject(1262, -799.54, 1930.70, 10.82,   0.00, 0.00, 0.00);
	CreateDynamicObject(1262, -801.04, 1930.74, 10.82,   0.00, 0.00, 0.00);
	CreateDynamicObject(1262, -802.50, 1930.70, 10.82,   0.00, 0.00, 0.00);
	///////////////СтантСпринт//////////////////////////
	CreateDynamicObject(18788, 1666.77, 1604.20, 8.86,   0.00, 0.00, 0.00);
	CreateDynamicObject(18788, 1626.99, 1604.17, 8.86,   0.00, 0.00, 0.00);
	CreateDynamicObject(18788, 1587.98, 1604.22, 12.62,   0.00, 11.00, 0.00);
	CreateDynamicObject(18791, 1529.71, 1611.62, 16.95,   0.00, 0.00, -22.00);
	CreateDynamicObject(18791, 1473.79, 1665.64, 16.95,   0.00, 0.00, -66.00);
	CreateDynamicObject(18791, 1459.76, 1742.98, 16.95,   0.00, 0.00, -251.00);
	CreateDynamicObject(18791, 1408.99, 1801.02, 9.68,   4.00, 10.00, -207.00);
	CreateDynamicObject(710, 1409.14, 1809.48, 17.23,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, 1396.06, 1798.17, 17.23,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, 1391.65, 1798.77, 17.23,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, 1402.09, 1811.69, 17.23,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, 1387.46, 1797.63, 17.23,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, 1383.91, 1793.99, 17.23,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, 1381.26, 1790.24, 17.23,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, 1395.79, 1813.02, 17.23,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, 1388.55, 1812.51, 17.23,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, 1383.39, 1810.87, 17.23,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, 1378.09, 1808.42, 17.23,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, 1373.48, 1805.35, 17.23,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, 1370.11, 1801.45, 17.23,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, 1368.50, 1798.66, 17.23,   0.00, 0.00, 0.00);
	CreateDynamicObject(18791, 1357.50, 1759.11, 9.34,   0.00, 0.00, -105.00);
	CreateDynamicObject(18789, 1354.88, 1646.75, 14.49,   0.00, 4.00, 90.00);
	CreateDynamicObject(18789, 1354.84, 1498.64, 5.46,   0.00, -11.00, 90.00);
	CreateDynamicObject(18791, 1361.50, 1480.27, 9.50,   0.00, 0.00, -69.00);
	CreateDynamicObject(18791, 1401.99, 1417.63, 13.98,   0.00, 7.00, 113.00);
	CreateDynamicObject(18791, 1416.64, 1348.09, 24.84,   0.00, -11.00, -68.00);
	CreateDynamicObject(18791, 1461.49, 1295.59, 39.38,   -10.00, -11.00, -33.00);
	CreateDynamicObject(18791, 1509.39, 1281.32, 49.27,   -10.00, -11.00, -4.00);
	CreateDynamicObject(18791, 1576.94, 1305.31, 59.09,   -15.00, -4.00, 40.00);
	CreateDynamicObject(18791, 1609.62, 1374.24, 54.07,   -12.00, 11.00, 91.00);
	CreateDynamicObject(18788, 1603.49, 1412.49, 48.09,   0.00, 0.00, -76.00);
	CreateDynamicObject(18788, 1594.03, 1450.57, 48.09,   0.00, 0.00, -76.00);
	CreateDynamicObject(18788, 1584.55, 1488.66, 44.31,   0.00, -11.00, -76.00);
	CreateDynamicObject(18788, 1575.46, 1524.95, 32.17,   0.00, -25.00, -76.00);
	CreateDynamicObject(18788, 1566.98, 1559.13, 15.70,   0.00, -25.00, -76.00);
	CreateDynamicObject(18791, 1550.72, 1610.38, 9.40,   0.00, 0.00, 120.00);
	CreateDynamicObject(18791, 1488.23, 1653.27, 9.40,   0.00, 0.00, 171.00);
	CreateDynamicObject(18791, 1414.35, 1636.29, 9.40,   0.00, 0.00, 215.00);
	CreateDynamicObject(18791, 1372.14, 1572.51, 9.40,   0.00, 0.00, 258.00);
	CreateDynamicObject(18791, 1390.34, 1499.35, 9.40,   0.00, 0.00, -50.00);
	CreateDynamicObject(18791, 1458.70, 1464.53, 9.40,   0.00, 0.00, -4.00);
	CreateDynamicObject(18791, 1531.33, 1488.06, 9.40,   0.00, 0.00, 40.00);
	CreateDynamicObject(18791, 1581.91, 1548.74, 9.40,   0.00, 0.00, -142.00);
	CreateDynamicObject(18788, 1634.14, 1572.01, 8.87,   0.00, 0.00, 18.00);
	CreateDynamicObject(18788, 1671.28, 1581.62, 8.77,   0.00, 0.00, 11.00);
	CreateDynamicObject(3877, 1655.43, 1570.80, 11.12,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, 1650.76, 1585.49, 11.12,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, 1617.74, 1558.41, 11.12,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, 1612.90, 1573.19, 11.12,   0.00, 0.00, 0.00);
	CreateDynamicObject(16092, 1642.64, 1603.92, 9.52,   0.00, 0.00, 0.00);
	CreateDynamicObject(16092, 1689.69, 1585.39, 9.52,   0.00, 0.00, 11.00);
	CreateDynamicObject(19130, 1649.11, 1604.44, 9.79,   0.00, 90.00, 0.00);
	CreateDynamicObject(19130, 1653.89, 1604.44, 9.79,   0.00, 90.00, 0.00);
	CreateDynamicObject(19130, 1658.11, 1604.42, 9.79,   0.00, 90.00, 0.00);
	CreateDynamicObject(19130, 1662.01, 1604.46, 9.79,   0.00, 90.00, 0.00);
	CreateDynamicObject(19130, 1666.69, 1604.51, 9.79,   0.00, 90.00, 0.00);
	CreateDynamicObject(3281, 1645.14, 1596.44, 11.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, 1648.73, 1596.44, 11.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, 1652.32, 1596.42, 11.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, 1655.92, 1596.39, 11.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, 1659.49, 1596.37, 11.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, 1663.12, 1596.38, 11.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, 1666.71, 1596.40, 11.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, 1670.35, 1596.41, 11.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, 1673.94, 1596.43, 11.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, 1677.53, 1596.47, 11.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, 1681.13, 1596.47, 11.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, 1684.74, 1596.47, 11.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, 1684.75, 1611.90, 11.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, 1681.10, 1611.91, 11.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, 1677.50, 1611.91, 11.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, 1673.88, 1611.91, 11.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, 1670.31, 1611.93, 11.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, 1666.73, 1611.93, 11.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, 1663.11, 1611.93, 11.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, 1659.49, 1611.95, 11.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, 1655.90, 1611.94, 11.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, 1652.33, 1611.98, 11.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, 1607.45, 1596.47, 9.82,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, 1569.06, 1611.82, 20.66,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, 1607.70, 1611.82, 9.82,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, 1568.65, 1596.33, 20.66,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, 1471.82, 1703.74, 18.36,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, 1471.59, 1707.41, 18.36,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, 1471.45, 1711.54, 18.36,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, 1471.46, 1715.71, 18.36,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, 1471.59, 1719.80, 18.36,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, 1458.07, 1718.67, 18.36,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, 1458.32, 1714.85, 18.36,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, 1458.48, 1711.22, 18.36,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, 1458.51, 1707.53, 18.36,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, 1458.20, 1703.99, 18.36,   0.00, 0.00, 0.00);
	CreateDynamicObject(3749, 1405.16, 1803.05, 15.07,   0.00, 0.00, 62.00);
	CreateDynamicObject(705, 1402.75, 1817.63, 8.87,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, 1382.76, 1815.94, 8.87,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, 1371.31, 1809.50, 8.87,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, 1362.06, 1798.34, 8.87,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, 1396.11, 1795.11, 8.87,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, 1389.12, 1790.36, 8.87,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, 1382.67, 1783.29, 8.87,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, 1356.52, 1784.01, 8.87,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, 1375.01, 1773.33, 8.87,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, 1350.99, 1770.73, 8.87,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, 1369.72, 1764.31, 8.87,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, 1346.15, 1758.38, 8.87,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, 1367.62, 1752.57, 8.87,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, 1366.60, 1740.52, 8.87,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, 1365.42, 1733.58, 8.87,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, 1343.37, 1730.97, 8.87,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, 1343.37, 1730.97, 8.87,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, 1366.32, 1723.92, 8.87,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, 1365.59, 1713.05, 8.87,   0.00, 0.00, 0.00);
	CreateDynamicObject(16092, 1354.90, 1572.07, 19.36,   0.00, 0.00, 90.00);
	CreateDynamicObject(16092, 1354.71, 1519.15, 8.93,   0.00, 0.00, 90.00);
	CreateDynamicObject(16092, 1354.83, 1514.19, 8.93,   0.00, 0.00, 90.00);
	CreateDynamicObject(16092, 1355.00, 1509.27, 8.93,   0.00, 0.00, 90.00);
	CreateDynamicObject(16092, 1355.50, 1504.74, 8.93,   0.00, 0.00, 90.00);
	CreateDynamicObject(3915, 1420.75, 1479.43, 7.86,   0.00, 0.00, 69.00);
	CreateDynamicObject(3915, 1418.88, 1475.34, 7.86,   0.00, 0.00, 69.00);
	CreateDynamicObject(3915, 1407.33, 1492.73, 7.86,   0.00, 0.00, 47.00);
	CreateDynamicObject(3915, 1402.99, 1487.77, 7.86,   0.00, 0.00, 47.00);
	CreateDynamicObject(3915, 1389.52, 1499.37, 7.86,   0.00, 0.00, 47.00);
	CreateDynamicObject(3915, 1393.21, 1504.72, 7.86,   0.00, 0.00, 47.00);
	CreateDynamicObject(3915, 1379.88, 1512.54, 7.86,   0.00, 0.00, 39.00);
	CreateDynamicObject(3915, 1382.39, 1518.50, 7.86,   0.00, 0.00, 39.00);
	CreateDynamicObject(3915, 1377.23, 1536.21, 7.86,   0.00, 0.00, 18.00);
	CreateDynamicObject(3915, 1372.17, 1531.38, 7.86,   0.00, 0.00, 25.00);
	CreateDynamicObject(3915, 1368.37, 1540.01, 7.86,   0.00, 0.00, 25.00);
	CreateDynamicObject(3915, 1374.29, 1550.37, 7.86,   0.00, 0.00, 11.00);
	CreateDynamicObject(3915, 1370.66, 1557.31, 7.86,   0.00, 0.00, -4.00);
	CreateDynamicObject(3915, 1375.81, 1568.43, 7.86,   0.00, 0.00, -4.00);
	CreateDynamicObject(3915, 1371.02, 1571.63, 7.86,   0.00, 0.00, -4.00);
	CreateDynamicObject(987, 1382.77, 1456.61, 9.61,   0.00, 0.00, -47.00);
	CreateDynamicObject(987, 1390.92, 1447.53, 9.61,   0.00, -11.00, -47.00);
	CreateDynamicObject(987, 1397.97, 1439.51, 12.05,   0.00, 0.00, -56.00);
	CreateDynamicObject(3877, 1402.56, 1379.23, 19.46,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, 1416.57, 1380.09, 20.58,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, 1514.30, 1288.12, 49.39,   0.00, -4.00, 7.00);
	CreateDynamicObject(987, 1526.07, 1289.52, 51.09,   0.00, -4.00, 7.00);
	CreateDynamicObject(987, 1502.49, 1288.46, 48.33,   0.00, -4.00, -2.00);
	CreateDynamicObject(987, 1609.92, 1417.50, 48.77,   0.00, 0.00, -76.00);
	CreateDynamicObject(987, 1607.00, 1429.11, 48.77,   0.00, 0.00, -76.00);
	CreateDynamicObject(987, 1604.09, 1440.73, 48.77,   0.00, 0.00, -76.00);
	CreateDynamicObject(987, 1601.16, 1452.22, 48.77,   0.00, 0.00, -76.00);
	CreateDynamicObject(987, 1598.25, 1463.76, 48.77,   0.00, 0.00, -76.00);
	CreateDynamicObject(987, 1596.27, 1471.50, 48.77,   0.00, 0.00, -76.00);
	CreateDynamicObject(987, 1593.76, 1481.93, 46.65,   0.00, -11.00, -76.00);
	CreateDynamicObject(987, 1591.14, 1492.30, 44.59,   0.00, -11.00, -76.00);
	CreateDynamicObject(987, 1588.29, 1503.68, 42.37,   0.00, -11.00, -76.00);
	CreateDynamicObject(710, 1586.37, 1509.13, 56.36,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, 1572.98, 1505.75, 56.36,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, 1555.88, 1571.70, 9.82,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, 1570.53, 1575.33, 9.82,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, 1556.06, 1572.15, 9.82,   0.00, 0.00, 105.00);
	CreateDynamicObject(987, 1552.96, 1583.68, 9.82,   0.00, 0.00, 107.00);
	CreateDynamicObject(987, 1549.52, 1595.07, 9.82,   0.00, 0.00, 116.00);
	CreateDynamicObject(987, 1544.35, 1605.71, 9.82,   0.00, 0.00, 124.00);
	CreateDynamicObject(987, 1537.79, 1615.62, 9.82,   0.00, 0.00, 131.00);
	CreateDynamicObject(987, 1529.96, 1624.62, 9.82,   0.00, 0.00, 137.00);
	CreateDynamicObject(987, 1521.22, 1632.83, 9.82,   0.00, 0.00, 152.00);
	CreateDynamicObject(987, 1510.69, 1638.34, 9.82,   0.00, 0.00, 159.00);
	CreateDynamicObject(987, 1499.68, 1642.62, 9.82,   0.00, 0.00, 167.00);
	CreateDynamicObject(987, 1488.15, 1645.26, 9.82,   0.00, 0.00, 174.00);
	CreateDynamicObject(987, 1476.36, 1646.49, 9.82,   0.00, 0.00, 181.00);
	CreateDynamicObject(987, 1464.37, 1646.33, 9.82,   0.00, 0.00, 189.00);
	CreateDynamicObject(710, 1452.52, 1644.58, 14.12,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, 1449.83, 1658.99, 14.12,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, 1457.97, 1660.62, 14.12,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, 1457.97, 1660.62, 14.12,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, 1488.42, 1659.90, 14.12,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, 1503.24, 1657.43, 14.12,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, 1515.64, 1652.39, 14.12,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, 1528.98, 1645.93, 14.12,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, 1539.90, 1635.81, 14.12,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, 1548.87, 1625.55, 14.12,   0.00, 0.00, 0.00);
	CreateDynamicObject(8323, 1345.96, 1719.06, 14.30,   356.86, 0.00, 3.14);
	CreateDynamicObject(700, 1409.86, 1642.13, 10.60,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1418.02, 1630.30, 10.60,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1399.24, 1632.54, 10.60,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1408.62, 1622.35, 10.60,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1389.55, 1622.86, 10.29,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1400.67, 1614.87, 10.29,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1392.91, 1604.31, 10.29,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1381.86, 1612.38, 10.29,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1374.72, 1600.25, 9.99,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1386.83, 1594.13, 9.99,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1382.19, 1582.12, 9.99,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1368.76, 1586.50, 9.99,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1364.96, 1572.60, 9.99,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1378.27, 1570.14, 9.99,   0.00, 0.00, 0.00);
	CreateDynamicObject(7985, 1487.57, 1554.69, 14.34,   0.00, 0.00, 0.00);
	CreateDynamicObject(3487, 1395.79, 1568.89, 16.46,   0.00, 0.00, 0.00);
	CreateDynamicObject(3487, 1416.47, 1568.91, 16.46,   0.00, 0.00, 0.00);
	CreateDynamicObject(3487, 1437.18, 1568.89, 16.46,   0.00, 0.00, 0.00);
	CreateDynamicObject(3485, 1411.22, 1522.81, 16.80,   0.00, 0.00, 180.00);
	CreateDynamicObject(3485, 1441.28, 1522.82, 16.80,   0.00, 0.00, 180.00);
	CreateDynamicObject(700, 1442.80, 1474.47, 9.69,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1437.32, 1461.40, 9.69,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1445.36, 1459.50, 9.69,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1448.60, 1472.71, 9.69,   0.00, 0.00, 0.00);
	CreateDynamicObject(8251, 1454.89, 1444.53, 13.22,   0.00, 0.00, 84.00);
	CreateDynamicObject(8251, 1483.37, 1445.14, 13.22,   0.00, 0.00, 98.00);
	CreateDynamicObject(700, 1494.63, 1461.32, 9.72,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1493.95, 1475.42, 9.72,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1482.64, 1473.00, 9.72,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1471.37, 1471.41, 9.72,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1458.75, 1471.58, 9.72,   0.00, 0.00, 0.00);
	CreateDynamicObject(18652, 1462.62, 1469.81, 9.84,   0.00, 0.00, 0.00);
	CreateDynamicObject(18652, 1462.62, 1467.85, 9.84,   0.00, 0.00, 0.00);
	CreateDynamicObject(18652, 1462.62, 1465.91, 9.84,   0.00, 0.00, 0.00);
	CreateDynamicObject(18652, 1462.61, 1463.97, 9.84,   0.00, 0.00, 0.00);
	CreateDynamicObject(18652, 1462.62, 1462.04, 9.84,   0.00, 0.00, 0.00);
	CreateDynamicObject(18652, 1462.63, 1460.11, 9.84,   0.00, 0.00, 0.00);
	CreateDynamicObject(18652, 1462.64, 1459.30, 9.84,   0.00, 0.00, 0.00);
	CreateDynamicObject(18652, 1458.60, 1471.89, 14.80,   90.00, 0.00, 0.00);
	CreateDynamicObject(1262, 1643.52, 1598.61, 16.97,   0.00, 0.00, -90.00);
	CreateDynamicObject(1262, 1643.56, 1600.15, 16.97,   0.00, 0.00, -90.00);
	CreateDynamicObject(1262, 1643.53, 1601.57, 16.97,   0.00, 0.00, -90.00);
	CreateDynamicObject(1262, 1643.50, 1603.15, 16.97,   0.00, 0.00, -90.00);
	CreateDynamicObject(1262, 1643.54, 1604.61, 16.97,   0.00, 0.00, -90.00);
	CreateDynamicObject(1262, 1643.49, 1606.22, 16.97,   0.00, 0.00, -90.00);
	CreateDynamicObject(1262, 1643.54, 1607.72, 16.97,   0.00, 0.00, -90.00);
	CreateDynamicObject(1262, 1643.55, 1609.18, 16.97,   0.00, 0.00, -90.00);
	CreateDynamicObject(18651, 1349.19, 1505.91, 10.65,   -90.00, 0.00, 0.00);
	CreateDynamicObject(18651, 1349.19, 1506.78, 10.65,   -90.00, 0.00, 0.00);
	CreateDynamicObject(18651, 1349.16, 1507.78, 10.65,   -90.00, 0.00, 0.00);
	CreateDynamicObject(18651, 1349.00, 1510.66, 10.65,   -90.00, 0.00, 0.00);
	CreateDynamicObject(18651, 1349.00, 1511.73, 10.65,   -90.00, 0.00, 0.00);
	CreateDynamicObject(18651, 1348.89, 1512.80, 10.65,   -90.00, 0.00, 0.00);
	CreateDynamicObject(18651, 1348.82, 1515.53, 10.65,   -90.00, 0.00, 0.00);
	CreateDynamicObject(18651, 1348.77, 1516.67, 10.65,   -90.00, 0.00, 0.00);
	CreateDynamicObject(18651, 1348.77, 1517.84, 10.65,   -90.00, 0.00, 0.00);
	CreateDynamicObject(18651, 1360.87, 1517.92, 10.65,   -90.00, 0.00, 0.00);
	CreateDynamicObject(18651, 1360.94, 1516.76, 10.65,   -90.00, 0.00, 0.00);
	CreateDynamicObject(18651, 1360.97, 1515.54, 10.65,   -90.00, 0.00, 0.00);
	CreateDynamicObject(18651, 1361.15, 1512.97, 10.65,   -90.00, 0.00, 0.00);
	CreateDynamicObject(18651, 1361.18, 1511.75, 10.65,   -90.00, 0.00, 0.00);
	CreateDynamicObject(18651, 1361.24, 1510.51, 10.65,   -90.00, 0.00, 0.00);
	CreateDynamicObject(18651, 1361.35, 1508.04, 10.65,   -90.00, 0.00, 0.00);
	CreateDynamicObject(18651, 1361.39, 1506.96, 10.65,   -90.00, 0.00, 0.00);
	CreateDynamicObject(18651, 1361.45, 1505.88, 10.65,   -90.00, 0.00, 0.00);
	CreateDynamicObject(18649, 1348.16, 1572.82, 21.01,   90.00, 0.00, 0.00);
	CreateDynamicObject(18649, 1348.16, 1572.82, 22.44,   90.00, 0.00, 0.00);
	CreateDynamicObject(18649, 1348.16, 1572.82, 24.31,   90.00, 0.00, 0.00);
	CreateDynamicObject(18649, 1348.16, 1572.82, 26.17,   90.00, 0.00, 0.00);
	CreateDynamicObject(18649, 1361.65, 1572.84, 21.01,   90.00, 0.00, 0.00);
	CreateDynamicObject(18649, 1361.65, 1572.84, 22.87,   90.00, 0.00, 0.00);
	CreateDynamicObject(18649, 1361.65, 1572.84, 24.43,   90.00, 0.00, 0.00);
	CreateDynamicObject(18649, 1361.65, 1572.84, 26.08,   90.00, 0.00, 0.00);
	CreateDynamicObject(8341, 1514.04, 1672.71, 13.82,   356.86, 0.00, 3.14);
	CreateDynamicObject(19130, 1670.82, 1604.50, 9.79,   0.00, 90.00, 0.00);
	CreateDynamicObject(19130, 1676.55, 1604.54, 9.79,   0.00, 90.00, 0.00);
	CreateDynamicObject(19130, 1680.57, 1604.58, 9.79,   0.00, 90.00, 0.00);
	CreateDynamicObject(19130, 1684.40, 1604.59, 9.79,   0.00, 90.00, 0.00);
	CreateDynamicObject(16092, 1685.52, 1584.43, 9.52,   0.00, 0.00, 11.00);
	CreateDynamicObject(18652, 1684.78, 1584.31, 17.42,   0.00, 0.00, 11.00);
	CreateDynamicObject(18648, 1684.77, 1584.29, 17.20,   0.00, 0.00, 11.00);
	CreateDynamicObject(18647, 1684.75, 1584.30, 16.97,   0.00, 0.00, 11.00);
	CreateDynamicObject(3877, 1684.27, 1591.06, 19.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, 1686.91, 1577.70, 19.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, 1690.99, 1578.63, 19.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(3877, 1688.26, 1592.05, 19.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(983, 1695.36, 1578.37, 10.42,   0.00, 0.00, 100.00);
	CreateDynamicObject(983, 1701.65, 1579.48, 10.42,   0.00, 0.00, 100.00);
	CreateDynamicObject(983, 1707.96, 1580.59, 10.42,   0.00, 0.00, 100.00);
	CreateDynamicObject(983, 1712.08, 1581.30, 10.42,   0.00, 0.00, 100.00);
	CreateDynamicObject(987, 1686.53, 1611.94, 8.89,   0.00, 0.00, 90.00);
	CreateDynamicObject(18275, 1686.26, 1627.22, 11.79,   0.00, 0.00, 90.00);
	CreateDynamicObject(987, 1686.59, 1630.65, 8.89,   0.00, 0.00, 90.00);
	CreateDynamicObject(987, 1686.63, 1639.63, 8.89,   0.00, 0.00, 90.00);
	CreateDynamicObject(987, 1650.18, 1647.21, 8.89,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, 1686.59, 1630.89, 11.07,   0.00, 0.00, 0.00);
	CreateDynamicObject(710, 1686.52, 1623.67, 11.07,   0.00, 0.00, 0.00);
	///АВТО
	CreateVehicle(500, 53.1754, 2470.3130, 16.4893, 0.0000, -1, -1, 100);
	CreateVehicle(500, 82.9805, 2468.9907, 16.4893, 0.0000, -1, -1, 100);
	CreateVehicle(500, 113.5509, 2470.3118, 16.4893, 0.0000, -1, -1, 100);
	CreateVehicle(500, 142.7917, 2469.0437, 16.4893, 0.0000, -1, -1, 100);
	CreateVehicle(500, 173.2648, 2468.7581, 16.4893, 0.0000, -1, -1, 100);
	CreateVehicle(500, 202.8778, 2468.8442, 16.4893, 0.0000, -1, -1, 100);
	CreateVehicle(500, 233.3651, 2468.2192, 16.4893, 0.0000, -1, -1, 100);
	CreateVehicle(500, 262.8473, 2468.7144, 16.4893, 0.0000, -1, -1, 100);
	CreateVehicle(500, 293.2834, 2468.3779, 16.4893, 0.0000, -1, -1, 100);
	CreateVehicle(500, 324.1805, 2467.5403, 16.4893, 0.0000, -1, -1, 100);
	CreateVehicle(500, 354.4369, 2467.4255, 16.4893, 0.0000, -1, -1, 100);
	CreateVehicle(400, 421.2015, 2440.2991, 16.5992, 0.0000, -1, -1, 100);
	CreateVehicle(400, 416.9727, 2440.3877, 16.5992, 0.0000, -1, -1, 100);
	CreateVehicle(411, 412.3554, 2439.2610, 16.1910, 0.0000, -1, -1, 100);
	CreateVehicle(411, 408.0128, 2439.1023, 16.1910, 0.0000, -1, -1, 100);
	CreateVehicle(411, 403.2173, 2439.2554, 16.1910, 0.0000, -1, -1, 100);
	CreateVehicle(420, 399.0354, 2439.4329, 16.4478, 0.0000, -1, -1, 100);
	CreateVehicle(420, 393.9641, 2439.4695, 16.4478, 0.0000, -1, -1, 100);
	CreateVehicle(420, 388.6141, 2439.2195, 16.4478, 0.0000, -1, -1, 100);
	CreateVehicle(433, 387.9282, 2451.2930, 16.7121, 0.0000, -1, -1, 100);
	CreateVehicle(433, 387.5977, 2463.6980, 16.7121, 0.0000, -1, -1, 100);
	CreateVehicle(555, 392.9495, 2448.5493, 16.2062, 0.0000, -1, -1, 100);
	CreateVehicle(555, 397.0062, 2448.2883, 16.2062, 0.0000, -1, -1, 100);
	CreateVehicle(555, 400.8618, 2447.9651, 16.2062, 0.0000, -1, -1, 100);
	CreateVehicle(556, 405.6714, 2447.0994, 16.3812, 0.0000, -1, -1, 100);
	CreateVehicle(556, 410.6863, 2446.9001, 16.3812, 0.0000, -1, -1, 100);
	CreateVehicle(556, 417.7257, 2446.4026, 16.3812, 0.0000, -1, -1, 100);
	CreateVehicle(429, 418.9120, 2453.4229, 16.0535, 0.0000, -1, -1, 100);
	CreateVehicle(429, 418.8726, 2459.8767, 16.0535, 0.0000, -1, -1, 100);
	CreateVehicle(429, 422.9153, 2459.9807, 16.0535, 0.0000, -1, -1, 100);
	CreateVehicle(431, 413.1609, 2459.3435, 16.5406, 0.0000, -1, -1, 100);
	CreateVehicle(431, 407.6654, 2459.2576, 16.5406, 0.0000, -1, -1, 100);
	CreateVehicle(431, 402.2072, 2459.1094, 16.5406, 0.0000, -1, -1, 100);
	CreateVehicle(431, 395.8808, 2459.0830, 16.5406, 0.0000, -1, -1, 100);
	CreateVehicle(500, 346.4049, 2504.1785, 16.4893, 0.0000, -1, -1, 100);
	CreateVehicle(508, 350.1299, 2504.4294, 16.8521, 0.0000, -1, -1, 100);
	CreateVehicle(508, 355.8916, 2504.4124, 16.8521, 0.0000, -1, -1, 100);
	CreateVehicle(508, 360.9249, 2504.3047, 16.8521, 0.0000, -1, -1, 100);
	CreateVehicle(515, 366.7675, 2502.1196, 17.6347, 0.0000, -1, -1, 100);
	CreateVehicle(515, 372.0346, 2502.1555, 17.6347, 0.0000, -1, -1, 100);
	CreateVehicle(515, 377.1854, 2502.0313, 17.6347, 0.0000, -1, -1, 100);
	CreateVehicle(515, 382.6477, 2501.9897, 17.6347, 0.0000, -1, -1, 100);
	CreateVehicle(561, 341.1386, 2502.7009, 16.4351, 0.0000, -1, -1, 100);
	CreateVehicle(561, 351.2650, 2469.0085, 16.4351, 0.0000, -1, -1, 100);
	CreateVehicle(450, 415.3338, 2503.1760, 17.0173, 90.0000, -1, -1, 100);
	CreateVehicle(450, 415.1612, 2496.8772, 17.0173, 90.0000, -1, -1, 100);
	CreateVehicle(450, 415.5002, 2489.7871, 17.0173, 90.0000, -1, -1, 100);
	CreateVehicle(450, 415.7406, 2482.4844, 17.0173, 90.0000, -1, -1, 100);
	//////////ВОЗДУШНАЯ ТРАССА
	CreateDynamicObject(18789, -1160.16, 258.98, 12.76,   0.00, 0.00, 45.00);
	CreateDynamicObject(18789, -1057.75, 361.36, 35.78,   0.00, -18.00, 45.00);
	CreateDynamicObject(18789, -954.45, 464.72, 58.93,   0.00, 0.00, 45.00);
	CreateDynamicObject(18789, -848.59, 570.58, 58.93,   0.00, 0.00, 45.00);
	CreateDynamicObject(18789, -742.64, 676.53, 58.93,   0.00, 0.00, 45.00);
	CreateDynamicObject(18789, -636.70, 782.50, 58.93,   0.00, 0.00, 45.00);
	CreateDynamicObject(18789, -636.70, 782.50, 58.93,   0.00, 0.00, 45.00);
	CreateDynamicObject(18789, -530.76, 888.46, 58.93,   0.00, 0.00, 45.00);
	CreateDynamicObject(18789, -425.11, 994.07, 58.93,   0.00, 0.00, 45.00);
	CreateDynamicObject(18789, -319.22, 1099.97, 58.93,   0.00, 0.00, 45.00);
	CreateDynamicObject(18791, -245.37, 1186.16, 58.92,   0.00, 0.00, 69.00);
	CreateDynamicObject(18788, -238.69, 1242.91, 58.37,   0.00, 0.00, 90.00);
	CreateDynamicObject(18788, -238.67, 1282.72, 58.37,   0.00, 0.00, 90.00);
	CreateDynamicObject(18788, -238.70, 1322.58, 58.37,   0.00, 0.00, 90.00);
	CreateDynamicObject(18788, -238.68, 1358.51, 61.36,   0.00, -9.00, 90.00);
	CreateDynamicObject(18789, -964.72, 561.63, 77.01,   0.00, 14.00, -45.00);
	CreateDynamicObject(18789, -1066.10, 663.05, 112.77,   0.00, 14.00, -45.00);
	CreateDynamicObject(18789, -1170.36, 767.37, 130.91,   0.00, 0.00, -45.00);
	CreateDynamicObject(18789, -1276.21, 873.27, 130.91,   0.00, 0.00, -45.00);
	CreateDynamicObject(18791, -1352.36, 958.00, 130.94,   0.00, 0.00, -65.00);
	CreateDynamicObject(18791, -1357.08, 1035.72, 130.95,   0.00, 0.00, -108.00);
	CreateDynamicObject(18791, -1308.05, 1096.25, 130.95,   0.00, 0.00, -150.00);
	CreateDynamicObject(18791, -1231.14, 1107.76, 130.95,   0.00, 0.00, -193.00);
	CreateDynamicObject(18791, -1166.96, 1063.48, 130.95,   0.00, 0.00, -236.00);
	CreateDynamicObject(18789, -1137.54, 960.62, 99.32,   0.00, -25.00, 102.00);
	CreateDynamicObject(18789, -1109.61, 829.16, 36.67,   0.00, -25.00, 102.00);
	CreateDynamicObject(18791, -1098.19, 729.52, 6.13,   0.00, 0.00, 76.00);
	CreateDynamicObject(18791, -1143.57, 665.99, 6.13,   0.00, 0.00, 33.00);
	CreateDynamicObject(18791, -1219.83, 651.11, 6.13,   0.00, 0.00, -11.00);
	CreateDynamicObject(18791, -1285.10, 693.56, 6.13,   0.00, 0.00, -55.00);
	CreateDynamicObject(18791, -1318.08, 765.12, 6.13,   0.00, 0.00, 127.00);
	CreateDynamicObject(18791, -1382.53, 806.96, 6.13,   0.00, 0.00, -193.00);
	CreateDynamicObject(18788, -1441.19, 806.56, 5.60,   0.00, 0.00, 5.00);
	CreateDynamicObject(18802, -1470.82, 803.96, 8.27,   0.00, 0.00, 185.00);
	CreateDynamicObject(18802, -1490.58, 802.44, 7.75,   0.00, -3.00, 4.00);
	/////////////БАЗА КЛАНА РАЙДЕР//////////////////////////////////////////////
	CreateDynamicObject(18769, -1621.16, 1094.80, 13.33,   90.00, 0.00, 0.00);
	CreateDynamicObject(18769, -1601.24, 1094.81, 13.33,   90.00, 0.00, 0.00);
	CreateDynamicObject(18769, -1561.70, 1094.73, 13.33,   90.00, 0.00, 0.00);
	CreateDynamicObject(18769, -1541.86, 1094.63, 13.33,   90.00, 0.00, 0.00);
	CreateDynamicObject(18769, -1546.12, 1109.45, 13.33,   90.00, 0.00, 90.00);
	CreateDynamicObject(18769, -1621.18, 1173.44, 13.33,   90.00, 0.00, 180.00);
	CreateDynamicObject(18769, -1601.31, 1173.39, 13.33,   90.00, 0.00, 180.00);
	CreateDynamicObject(18769, -1581.58, 1173.41, 13.33,   90.00, 0.00, 180.00);
	CreateDynamicObject(18769, -1563.40, 1179.18, 13.33,   90.00, 0.00, 215.00);
	CreateDynamicObject(18769, -1545.64, 1184.77, 13.33,   90.00, 0.00, 180.00);
	CreateDynamicObject(18769, -1621.09, 1163.99, 22.78,   0.00, 0.00, 180.00);
	CreateDynamicObject(18769, -1601.15, 1164.01, 22.78,   0.00, 0.00, 180.00);
	CreateDynamicObject(18769, -1581.29, 1163.96, 22.78,   0.00, 0.00, 180.00);
	CreateDynamicObject(18769, -1561.43, 1163.91, 22.78,   0.00, 0.00, 180.00);
	CreateDynamicObject(18769, -1545.47, 1175.19, 22.78,   0.00, 0.00, 180.00);
	CreateDynamicObject(18769, -1557.87, 1171.53, 22.78,   0.00, 0.00, 215.00);
	CreateDynamicObject(18769, -1554.69, 1143.98, 22.78,   0.00, 0.00, 180.00);
	CreateDynamicObject(18769, -1574.55, 1143.96, 22.78,   0.00, 0.00, 180.00);
	CreateDynamicObject(18769, -1594.15, 1143.98, 22.78,   0.00, 0.00, 180.00);
	CreateDynamicObject(18769, -1614.12, 1143.99, 22.78,   0.00, 0.00, 180.00);
	CreateDynamicObject(18769, -1614.40, 1124.37, 22.78,   0.00, 0.00, 180.00);
	CreateDynamicObject(18769, -1614.40, 1124.37, 22.78,   0.00, 0.00, 180.00);
	CreateDynamicObject(18769, -1594.47, 1124.41, 22.78,   0.00, 0.00, 180.00);
	CreateDynamicObject(18769, -1574.49, 1124.40, 22.78,   0.00, 0.00, 180.00);
	CreateDynamicObject(18769, -1554.53, 1124.40, 22.78,   0.00, 0.00, 180.00);
	CreateDynamicObject(18769, -1554.60, 1104.45, 22.78,   0.00, 0.00, 180.00);
	CreateDynamicObject(18769, -1574.48, 1104.45, 22.78,   0.00, 0.00, 180.00);
	CreateDynamicObject(18769, -1594.43, 1104.43, 22.78,   0.00, 0.00, 180.00);
	CreateDynamicObject(18769, -1613.99, 1104.54, 22.78,   0.00, 0.00, 180.00);
	CreateDynamicObject(3485, -1554.61, 1159.44, 13.07,   0.00, 0.00, -90.00);
	CreateDynamicObject(3485, -1554.66, 1129.53, 13.07,   0.00, 0.00, -90.00);
	CreateDynamicObject(3286, -1585.77, 1153.71, 10.21,   0.00, 0.00, 0.00);
	CreateDynamicObject(3286, -1594.66, 1114.59, 10.21,   0.00, 0.00, 0.00);
	CreateDynamicObject(3279, -1612.75, 1099.90, 5.55,   0.00, 0.00, 0.00);
	CreateDynamicObject(3279, -1571.67, 1098.85, 5.55,   0.00, 0.00, 90.00);
	CreateDynamicObject(3624, -1606.07, 1128.97, 10.19,   0.00, 0.00, 180.00);
	CreateDynamicObject(700, -1591.24, 1120.45, 5.99,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -1590.84, 1137.71, 5.99,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -1568.19, 1154.79, 5.99,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -1567.99, 1124.85, 5.99,   0.00, 0.00, 0.00);
	CreateDynamicObject(3605, -1622.32, 1130.04, 11.87,   0.00, 0.00, 90.00);
	CreateDynamicObject(3286, -1549.33, 1111.62, 10.21,   0.00, 0.00, 0.00);
	CreateDynamicObject(3443, -1602.92, 1162.08, 8.80,   0.00, 0.00, 0.00);
	CreateDynamicObject(2027, -1601.03, 1159.22, 6.48,   0.00, 0.00, 0.00);
	CreateDynamicObject(2027, -1605.36, 1156.95, 6.48,   0.00, 0.00, 90.00);
	CreateDynamicObject(2027, -1605.37, 1154.40, 6.48,   0.00, 0.00, 90.00);
	CreateDynamicObject(2063, -1599.57, 1155.83, 6.80,   0.00, 0.00, 90.00);
	CreateDynamicObject(3281, -1590.36, 1134.11, 6.89,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -1588.55, 1135.90, 6.89,   0.00, 0.00, 90.00);
	CreateDynamicObject(3281, -1588.52, 1139.51, 6.89,   0.00, 0.00, 90.00);
	CreateDynamicObject(3281, -1590.34, 1141.36, 6.89,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -1590.39, 1123.81, 6.89,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -1588.54, 1122.03, 6.89,   0.00, 0.00, 90.00);
	CreateDynamicObject(3281, -1588.57, 1118.40, 6.89,   0.00, 0.00, 90.00);
	CreateDynamicObject(3281, -1590.42, 1116.61, 6.89,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -1571.85, 1114.05, 5.99,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -1571.85, 1104.66, 5.99,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -1598.14, 1113.01, 6.89,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -1601.70, 1113.00, 6.89,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -1605.37, 1113.00, 6.89,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -1608.94, 1112.99, 6.89,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -1573.66, 1104.84, 6.89,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -1575.44, 1103.07, 6.89,   0.00, 0.00, 90.00);
	CreateDynamicObject(3281, -1575.45, 1099.44, 6.89,   0.00, 0.00, 90.00);
	CreateDynamicObject(3281, -1575.48, 1095.90, 6.89,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -1550.84, 1106.49, 7.37,   0.00, 90.00, 90.00);
	CreateDynamicObject(983, -1550.78, 1104.35, 7.37,   0.00, 90.00, 90.00);
	CreateDynamicObject(983, -1556.95, 1106.47, 6.02,   -25.00, 90.00, 90.00);
	CreateDynamicObject(983, -1556.89, 1104.33, 6.02,   -25.00, 90.00, 90.00);
	CreateDynamicObject(983, -1550.77, 1101.92, 7.37,   0.00, 90.00, 90.00);
	CreateDynamicObject(983, -1550.82, 1099.77, 7.37,   0.00, 90.00, 90.00);
	CreateDynamicObject(983, -1556.87, 1101.93, 6.02,   -25.00, 90.00, 90.00);
	CreateDynamicObject(983, -1556.86, 1099.75, 6.02,   -25.00, 90.00, 90.00);
	CreateDynamicObject(983, -1550.84, 1107.75, 7.37,   0.00, 90.00, 90.00);
	CreateDynamicObject(983, -1550.81, 1108.31, 8.05,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, -1550.82, 1098.49, 7.37,   0.00, 90.00, 90.00);
	CreateDynamicObject(983, -1550.82, 1097.83, 8.05,   0.00, 0.00, 90.00);
	CreateDynamicObject(18769, -1581.62, 1094.68, 13.33,   90.00, 0.00, 0.00);
	////ИХ АВТО/////////////////////////////////////////////////////////////
	CreateVehicle(411, -1550.5680, 1105.3527, 8.3529, 90.0000, -1, -1, 100);
	CreateVehicle(411, -1555.4940, 1111.2917, 6.8353, 127.0000, -1, -1, 100);
	CreateVehicle(411, -1559.8954, 1111.4563, 6.8353, 127.0000, -1, -1, 100);
	CreateVehicle(463, -1569.8157, 1112.6609, 6.6892, 0.0000, -1, -1, 100);
	CreateVehicle(463, -1567.6526, 1112.6006, 6.6892, 0.0000, -1, -1, 100);
	CreateVehicle(463, -1565.7078, 1112.5137, 6.6892, 0.0000, -1, -1, 100);
	CreateVehicle(500, -1563.8551, 1119.7678, 7.3296, 90.0000, -1, -1, 100);
	CreateVehicle(500, -1564.3752, 1149.0925, 7.3296, 90.0000, -1, -1, 100);
	CreateVehicle(513, -1579.1882, 1161.1505, 7.5521, 178.0000, -1, -1, 100);
	CreateVehicle(521, -1598.0295, 1143.2262, 6.6033, 0.0000, -1, -1, 100);
	CreateVehicle(521, -1600.1293, 1143.1267, 6.6033, 0.0000, -1, -1, 100);
	CreateVehicle(521, -1602.5299, 1143.2512, 6.6033, 0.0000, -1, -1, 100);
	CreateVehicle(521, -1605.0524, 1143.2203, 6.6033, 0.0000, -1, -1, 100);
	CreateVehicle(559, -1594.4677, 1149.7100, 6.7892, 0.0000, -1, -1, 100);
	CreateVehicle(559, -1610.0060, 1149.2954, 6.7892, -98.0000, -1, -1, 100);
	CreateVehicle(560, -1595.6844, 1121.4771, 6.7412, 0.0000, -1, -1, 100);
	CreateVehicle(560, -1599.9308, 1121.5599, 6.7412, 0.0000, -1, -1, 100);
	CreateVehicle(560, -1604.8453, 1121.7399, 6.7412, 0.0000, -1, -1, 100);
	CreateVehicle(562, -1605.5231, 1135.9094, 6.8111, 0.0000, -1, -1, 100);
	CreateVehicle(562, -1600.5859, 1136.1002, 6.8111, 0.0000, -1, -1, 100);
	CreateVehicle(562, -1595.7384, 1136.4186, 6.8111, 0.0000, -1, -1, 100);
	CreateVehicle(565, -1606.5886, 1109.4640, 6.6024, 0.0000, -1, -1, 100);
	CreateVehicle(565, -1602.4041, 1109.5610, 6.6024, 0.0000, -1, -1, 100);
	CreateVehicle(565, -1598.4091, 1109.6058, 6.6024, 0.0000, -1, -1, 100);
	///////////////////ЗОНА БАЙКЕРОВ+ДОМА//////////////////////////////
	Create3DTextLabel("ЗОНА БАЙКЕРОВ",COLOR_GREEN,-320.5246,1803.3479,43.4909,40.0,0,1);
	CreateDynamicObject(3443, -351.85, 1892.73, 44.18,   0.00, 0.00, 33.00);
	CreateDynamicObject(3443, -297.64, 1901.31, 44.18,   0.00, 0.00, 4.00);
	CreateDynamicObject(3443, -266.87, 1903.43, 44.18,   0.00, 0.00, 4.00);
	CreateDynamicObject(3484, -296.73, 1818.77, 47.94,   0.00, 0.00, -90.00);
	CreateDynamicObject(3517, -314.28, 1803.26, 51.11,   0.00, 0.00, 0.00);
	CreateDynamicObject(3517, -331.49, 1806.63, 51.11,   0.00, 0.00, 0.00);
	CreateDynamicObject(3517, -340.86, 1808.84, 51.11,   0.00, 0.00, 0.00);
	CreateDynamicObject(3517, -348.80, 1809.64, 51.11,   0.00, 0.00, 0.00);
	CreateDynamicObject(3517, -356.39, 1815.32, 51.11,   0.00, 0.00, 0.00);
	CreateDynamicObject(3517, -361.03, 1823.08, 51.11,   0.00, 0.00, 0.00);
	CreateDynamicObject(3517, -363.64, 1828.92, 51.11,   0.00, 0.00, 0.00);
	CreateDynamicObject(3582, -332.79, 1815.06, 43.75,   0.00, 0.00, 0.00);
	CreateDynamicObject(3582, -345.20, 1817.62, 43.75,   0.00, 0.00, -25.00);
	CreateDynamicObject(3582, -355.20, 1826.15, 43.75,   0.00, 0.00, -55.00);
	CreateDynamicObject(3582, -360.23, 1837.79, 43.73,   0.00, 0.00, -76.00);
	CreateDynamicObject(3582, -362.53, 1850.82, 43.73,   0.00, 0.00, -83.00);
	CreateDynamicObject(3582, -363.86, 1862.23, 43.73,   0.00, 0.00, -83.00);
	CreateDynamicObject(3582, -363.34, 1873.57, 43.73,   0.00, 0.00, -100.00);
	CreateDynamicObject(3582, -324.43, 1893.78, 43.73,   0.00, 0.00, -171.00);
	CreateDynamicObject(3602, -258.41, 1863.84, 44.72,   0.00, 0.00, -120.00);
	CreateDynamicObject(3605, -277.47, 1837.81, 47.16,   0.00, 0.00, -146.00);
	CreateDynamicObject(700, -249.59, 1893.81, 40.80,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -247.78, 1888.25, 40.80,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -245.41, 1883.52, 40.80,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -242.69, 1878.47, 40.80,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -246.24, 1873.20, 40.80,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -281.55, 1890.33, 40.80,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -310.23, 1888.80, 40.80,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -342.74, 1885.73, 40.80,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -300.67, 1833.52, 40.27,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -307.53, 1833.59, 40.27,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -313.15, 1833.58, 40.27,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, -329.11, 1860.97, 39.23,   0.00, 0.00, 0.00);
	CreateDynamicObject(3496, -312.51, 1816.95, 41.21,   0.00, 0.00, 0.00);
	CreateDynamicObject(3532, -356.76, 1842.75, 41.67,   0.00, 0.00, 14.00);
	CreateDynamicObject(3532, -354.88, 1835.59, 41.67,   0.00, 0.00, 14.00);
	CreateDynamicObject(3532, -357.77, 1847.80, 41.67,   0.00, 0.00, 14.00);
	CreateDynamicObject(3532, -358.51, 1855.15, 41.67,   0.00, 0.00, 14.00);
	CreateDynamicObject(3532, -359.11, 1858.89, 41.67,   0.00, 0.00, 14.00);
	CreateDynamicObject(3532, -359.69, 1866.75, 41.67,   0.00, 0.00, 14.00);
	CreateDynamicObject(3532, -282.50, 1852.79, 41.67,   0.00, 0.00, 33.00);
	CreateDynamicObject(3532, -287.75, 1849.26, 41.67,   0.00, 0.00, 33.00);
	CreateDynamicObject(3532, -290.90, 1849.29, 41.67,   0.00, 0.00, -66.00);
	CreateDynamicObject(3532, -290.60, 1848.12, 41.67,   0.00, 0.00, -66.00);
	CreateDynamicObject(3532, -290.52, 1846.80, 41.67,   0.00, 0.00, -66.00);
	CreateDynamicObject(3532, -289.10, 1845.73, 41.67,   0.00, 0.00, -66.00);
	CreateDynamicObject(3532, -289.10, 1845.73, 41.67,   0.00, 0.00, -66.00);
	CreateDynamicObject(3532, -290.52, 1846.80, 41.67,   0.00, 0.00, -66.00);
	CreateDynamicObject(3532, -292.55, 1843.45, 41.67,   0.00, 0.00, -66.00);
	CreateDynamicObject(3532, -293.64, 1844.88, 41.67,   0.00, 0.00, -66.00);
	CreateDynamicObject(3532, -293.72, 1846.42, 41.67,   0.00, 0.00, -66.00);
	CreateDynamicObject(3532, -294.38, 1847.34, 41.67,   0.00, 0.00, -66.00);
	CreateDynamicObject(8171, -342.11, 1832.74, 41.49,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, -302.19, 1847.82, 41.49,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, -262.41, 1851.02, 41.49,   0.00, 0.00, 0.00);
	CreateDynamicObject(355, -335.42, 1820.58, 42.23,   0.00, 0.00, 0.00);
	CreateDynamicObject(355, -344.66, 1823.98, 42.23,   0.00, 0.00, 0.00);
	CreateDynamicObject(355, -351.75, 1831.60, 42.23,   0.00, 0.00, 0.00);
	CreateDynamicObject(355, -355.30, 1841.67, 42.23,   0.00, 0.00, 0.00);
	CreateDynamicObject(355, -357.27, 1854.35, 42.23,   0.00, 0.00, 0.00);
	CreateDynamicObject(355, -358.41, 1864.83, 42.23,   0.00, 0.00, 0.00);
	CreateDynamicObject(355, -357.64, 1874.52, 42.23,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -391.94, 1750.09, 41.44,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -395.87, 1741.70, 40.35,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -398.00, 1733.38, 40.02,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -398.15, 1725.86, 39.38,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -398.33, 1716.98, 39.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -411.72, 1718.68, 39.70,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -411.47, 1727.57, 39.70,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -410.97, 1736.58, 39.70,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -409.30, 1744.29, 40.19,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -405.75, 1752.50, 40.91,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -400.94, 1761.36, 42.49,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -389.14, 1755.16, 42.49,   0.00, 0.00, 0.00);
	CreateDynamicObject(3040, -384.28, 1759.37, 45.61,   0.00, 0.00, 146.00);
	CreateDynamicObject(3040, -380.31, 1765.22, 46.50,   0.00, 0.00, 146.00);
	CreateDynamicObject(3040, -376.27, 1771.50, 47.35,   0.00, 0.00, 146.00);
	CreateDynamicObject(3066, -395.15, 1777.64, 45.22,   0.00, 0.00, 0.00);
	CreateDynamicObject(3066, -398.45, 1767.55, 43.45,   0.00, 0.00, -33.00);
	CreateDynamicObject(3115, -401.75, 1773.19, 49.64,   0.00, 0.00, 0.00);
	CreateDynamicObject(3187, -393.22, 1788.20, 49.64,   0.00, 4.00, -105.00);
	CreateDynamicObject(18789, -467.53, 1576.36, 72.16,   0.00, 0.00, 0.00);
	CreateDynamicObject(18791, -581.19, 1581.03, 72.17,   0.00, 0.00, -18.00);
	CreateDynamicObject(18791, -643.06, 1627.67, 72.17,   0.00, 0.00, -56.00);
	CreateDynamicObject(18791, -625.73, 1631.82, 72.17,   0.00, 0.00, -52.00);
	CreateDynamicObject(18791, -558.98, 1593.27, 72.15,   0.00, 0.00, -8.00);
	CreateDynamicObject(18789, -446.83, 1595.29, 72.16,   0.00, 0.00, 0.00);
	CreateDynamicObject(18789, -661.47, 1739.14, 72.16,   0.00, 0.00, -76.00);
	CreateDynamicObject(18789, -676.46, 1736.62, 72.16,   0.00, 0.00, -76.00);
	CreateDynamicObject(18789, -712.49, 1881.33, 72.16,   0.00, 0.00, -76.00);
	CreateDynamicObject(18789, -697.62, 1884.36, 72.16,   0.00, 0.00, -76.00);
	CreateDynamicObject(18789, -748.63, 2026.37, 72.16,   0.00, 0.00, -76.00);
	CreateDynamicObject(18789, -733.75, 2029.21, 72.16,   0.00, 0.00, -76.00);
	CreateDynamicObject(18789, -769.96, 2174.29, 72.16,   0.00, 0.00, -76.00);
	CreateDynamicObject(18789, -784.82, 2171.44, 72.16,   0.00, 0.00, -76.00);
	CreateDynamicObject(18750, -798.25, 2255.01, 112.75,   90.00, 0.00, 12.00);
	CreateDynamicObject(18761, -796.63, 2219.09, 77.02,   0.00, 0.00, -18.00);
	CreateDynamicObject(18761, -781.92, 2222.92, 77.02,   0.00, 0.00, 47.00);
	CreateDynamicObject(18761, -807.39, 2230.69, 77.02,   0.00, 0.00, -76.00);
	CreateDynamicObject(18761, -777.95, 2238.22, 77.02,   0.00, 0.00, -76.00);
	CreateDynamicObject(19129, -800.82, 2243.51, 81.25,   90.00, 0.00, 11.00);
	CreateDynamicObject(19129, -789.77, 2245.71, 81.25,   90.00, 0.00, 11.00);
	CreateDynamicObject(982, -790.99, 2229.12, 73.95,   0.00, 0.00, 13.00);
	CreateDynamicObject(982, -784.91, 2203.42, 73.95,   0.00, 0.00, 14.00);
	CreateDynamicObject(982, -778.69, 2178.59, 73.95,   0.00, 0.00, 14.00);
	CreateDynamicObject(982, -772.50, 2153.78, 73.95,   0.00, 0.00, 14.00);
	CreateDynamicObject(982, -766.30, 2128.93, 73.95,   0.00, 0.00, 14.00);
	CreateDynamicObject(3281, -399.41, 1587.57, 74.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -403.02, 1587.55, 74.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -406.60, 1587.55, 74.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -410.16, 1587.58, 74.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -413.79, 1587.60, 74.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -417.41, 1587.57, 74.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -417.31, 1584.03, 74.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -413.74, 1584.02, 74.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -410.16, 1584.02, 74.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -406.57, 1584.03, 74.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -402.96, 1584.04, 74.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -399.36, 1584.04, 74.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -401.01, 1568.65, 74.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -404.62, 1568.67, 74.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -408.20, 1568.66, 74.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -411.80, 1568.65, 74.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -415.38, 1568.65, 74.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -415.16, 1603.15, 74.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -411.52, 1603.16, 74.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -407.93, 1603.16, 74.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -404.32, 1603.15, 74.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -400.68, 1603.13, 74.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -397.04, 1603.16, 74.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -393.46, 1603.19, 74.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -389.82, 1603.14, 74.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, -386.26, 1603.19, 74.13,   0.00, 0.00, 0.00);
	CreateDynamicObject(835, -382.44, 1602.36, 76.52,   0.00, 0.00, 0.00);
	CreateDynamicObject(835, -395.42, 1569.05, 76.52,   0.00, 0.00, 0.00);
	CreateDynamicObject(18275, -417.62, 1591.58, 74.53,   0.00, 0.00, 90.00);
	CreateDynamicObject(18275, -417.61, 1598.40, 74.50,   0.00, 0.00, 90.00);
	CreateDynamicObject(18275, -417.89, 1580.07, 74.61,   0.00, 0.00, 90.00);
	CreateDynamicObject(18275, -417.83, 1573.14, 74.59,   0.00, 0.00, 90.00);
	CreateDynamicObject(1262, -417.23, 1570.10, 74.64,   0.00, 0.00, -90.00);
	CreateDynamicObject(981, -431.61, 1595.18, 72.75,   0.00, 0.00, 0.00);
	CreateDynamicObject(981, -431.81, 1576.02, 72.75,   0.00, 0.00, 0.00);
	CreateDynamicObject(981, -464.33, 1576.10, 72.75,   0.00, 0.00, 0.00);
	CreateDynamicObject(981, -463.37, 1595.07, 72.75,   0.00, 0.00, 0.00);
	CreateDynamicObject(981, -690.87, 1825.76, 72.64,   0.00, 0.00, 104.00);
	CreateDynamicObject(981, -698.44, 1856.29, 72.64,   0.00, 0.00, 104.00);
	CreateDynamicObject(981, -706.57, 1888.91, 72.64,   0.00, 0.00, 104.00);
	CreateDynamicObject(981, -714.36, 1919.99, 72.64,   0.00, 0.00, 104.00);
	CreateDynamicObject(981, -722.70, 1953.22, 72.64,   0.00, 0.00, 104.00);
	CreateDynamicObject(981, -730.98, 1986.65, 72.64,   0.00, 0.00, 104.00);
	CreateDynamicObject(1262, -417.25, 1576.09, 74.64,   0.00, 0.00, -90.00);
	CreateDynamicObject(1262, -417.30, 1577.02, 74.64,   0.00, 0.00, -90.00);
	CreateDynamicObject(1262, -417.29, 1583.01, 74.64,   0.00, 0.00, -90.00);
	CreateDynamicObject(1262, -417.05, 1588.51, 74.64,   0.00, 0.00, -90.00);
	CreateDynamicObject(1262, -417.02, 1594.44, 74.64,   0.00, 0.00, -90.00);
	CreateDynamicObject(1262, -417.03, 1595.31, 74.64,   0.00, 0.00, -90.00);
	CreateDynamicObject(1262, -417.05, 1601.38, 74.64,   0.00, 0.00, -90.00);
	////////ОРУЖИЕ//////////
	AddStaticPickup(355,2,-335.42, 1820.58, 42.23);
	AddStaticPickup(355,2,-344.66, 1823.98, 42.23);
	AddStaticPickup(355,2,-351.75, 1831.60, 42.23);
	AddStaticPickup(355,2,-355.30, 1841.67, 42.23);
	AddStaticPickup(355,2,-357.27, 1854.35, 42.23);
	AddStaticPickup(355,2,-358.41, 1864.83, 42.23);
	AddStaticPickup(355,2,-357.64, 1874.52, 42.23);
	////////МОТО-АВТО///////////////////////////////
	CreateVehicle(522, -347.2991, 1889.0226, 41.7295, 0.0000, -1, -1, 100);
	CreateVehicle(522, -326.9696, 1887.3059, 41.7295, 0.0000, -1, -1, 100);
	CreateVehicle(522, -345.4914, 1886.8700, 41.7295, 0.0000, -1, -1, 100);
	CreateVehicle(522, -290.2919, 1890.5150, 41.7295, 0.0000, -1, -1, 100);
	CreateVehicle(522, -288.1488, 1890.6975, 41.7295, 0.0000, -1, -1, 100);
	CreateVehicle(522, -275.1545, 1857.0189, 41.7295, 0.0000, -1, -1, 100);
	CreateVehicle(521, -276.9328, 1856.0295, 42.2896, 0.0000, -1, -1, 100);
	CreateVehicle(521, -278.5979, 1854.7202, 42.2896, 0.0000, -1, -1, 100);
	CreateVehicle(521, -259.6008, 1893.1628, 41.7740, 0.0000, -1, -1, 100);
	CreateVehicle(521, -256.9276, 1893.3965, 41.7740, 0.0000, -1, -1, 100);
	CreateVehicle(521, -329.2597, 1819.8829, 41.7740, 76.0000, -1, -1, 100);
	CreateVehicle(521, -339.7542, 1820.9292, 41.7740, 76.0000, -1, -1, 100);
	CreateVehicle(521, -348.6074, 1826.8949, 41.7740, 76.0000, -1, -1, 100);
	CreateVehicle(521, -353.3982, 1836.7373, 41.7740, 76.0000, -1, -1, 100);
	CreateVehicle(521, -356.1617, 1848.6820, 41.7740, 76.0000, -1, -1, 100);
	CreateVehicle(521, -357.4575, 1858.8958, 41.7740, 76.0000, -1, -1, 100);
	CreateVehicle(521, -358.1642, 1868.5542, 41.7740, 76.0000, -1, -1, 100);
	CreateVehicle(521, -312.1525, 1821.2432, 41.8553, 91.0000, -1, -1, 100);
	CreateVehicle(527, -312.2016, 1810.8850, 41.9603, -90.0000, -1, -1, 100);
	CreateVehicle(527, -312.0892, 1814.4172, 41.9603, -90.0000, -1, -1, 100);
	CreateVehicle(541, -264.2612, 1872.2109, 42.0940, 40.0000, -1, -1, 100);
	CreateVehicle(541, -266.3263, 1868.4453, 42.0940, 40.0000, -1, -1, 100);
	CreateVehicle(541, -268.2903, 1864.3700, 42.0940, 40.0000, -1, -1, 100);
	////////////////////Желой Район///////////////////////////////////////
	CreateDynamicObject(700, -1705.06, -2690.63, 45.04,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -1712.30, -2701.16, 45.04,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -1696.08, -2681.72, 46.03,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -1688.33, -2678.34, 46.80,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -1678.96, -2670.47, 46.80,   0.00, 0.00, 0.00);
	CreateDynamicObject(3488, -1661.15, -2665.94, 53.94,   0.00, 0.00, -49.00);
	CreateDynamicObject(3488, -1647.27, -2680.39, 54.16,   0.00, 0.00, -49.00);
	CreateDynamicObject(3558, -1607.63, -2692.09, 50.17,   0.00, 0.00, 145.00);
	CreateDynamicObject(3558, -1642.42, -2698.03, 50.22,   0.00, 0.00, -137.00);
	CreateDynamicObject(3558, -1631.60, -2687.97, 50.22,   0.00, 0.00, -137.00);
	CreateDynamicObject(3558, -1595.47, -2700.56, 50.17,   0.00, 0.00, 145.00);
	CreateDynamicObject(3558, -1582.93, -2709.30, 50.17,   0.00, 0.00, 145.00);
	CreateDynamicObject(3558, -1602.52, -2733.43, 50.20,   0.00, 0.00, 324.00);
	CreateDynamicObject(3558, -1590.69, -2741.99, 50.20,   0.00, 0.00, 324.00);
	CreateDynamicObject(3558, -1578.91, -2750.56, 50.20,   0.00, 0.00, 324.00);
	CreateDynamicObject(3558, -1567.22, -2759.03, 50.20,   0.00, 0.00, 324.00);
	CreateDynamicObject(3558, -1555.47, -2767.16, 50.20,   0.00, 0.00, 324.00);
	CreateDynamicObject(3558, -1515.81, -2759.44, 50.07,   0.00, 0.00, 55.00);
	CreateDynamicObject(3558, -1524.14, -2771.35, 50.07,   0.00, 0.00, 55.00);
	CreateDynamicObject(3558, -1535.46, -2730.71, 50.00,   0.00, 0.00, 145.00);
	CreateDynamicObject(3558, -1523.62, -2739.22, 50.00,   0.00, 0.00, 145.00);
	CreateDynamicObject(3486, -1502.67, -2777.68, 54.51,   0.00, 0.00, -35.00);
	CreateDynamicObject(983, -1515.79, -2789.36, 47.97,   0.00, 0.00, 55.00);
	CreateDynamicObject(983, -1510.56, -2793.00, 47.97,   0.00, 0.00, 55.00);
	CreateDynamicObject(983, -1505.32, -2796.68, 47.97,   0.00, 0.00, 55.00);
	CreateDynamicObject(983, -1502.70, -2798.51, 47.97,   0.00, 0.00, 55.00);
	CreateDynamicObject(700, -1665.04, -2704.33, 46.80,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -1650.74, -2716.96, 46.80,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -1633.15, -2717.39, 47.68,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -1645.04, -2706.54, 47.75,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -1633.72, -2731.87, 47.95,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -1619.18, -2742.84, 47.80,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -1607.51, -2751.17, 47.64,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -1596.20, -2759.77, 47.37,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -1585.13, -2767.79, 47.31,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -1573.73, -2775.92, 47.10,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -1560.26, -2785.51, 47.17,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -1550.95, -2776.93, 46.68,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, -1538.62, -2786.03, 46.33,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, -1548.91, -2791.90, 46.91,   0.00, 0.00, 55.00);
	CreateDynamicObject(982, -1569.92, -2777.18, 46.91,   0.00, 0.00, 55.00);
	CreateDynamicObject(982, -1590.89, -2762.49, 46.91,   0.00, 0.00, 55.00);
	CreateDynamicObject(3556, -1554.27, -2769.33, 53.74,   0.00, 0.00, -36.00);
	CreateDynamicObject(3556, -1566.03, -2760.74, 53.74,   0.00, 0.00, -36.00);
	CreateDynamicObject(3556, -1589.08, -2743.76, 53.74,   0.00, 0.00, -36.00);
	CreateDynamicObject(3556, -1566.03, -2760.74, 53.74,   0.00, 0.00, -36.00);
	CreateDynamicObject(3556, -1577.44, -2752.31, 53.74,   0.00, 0.00, -36.00);
	CreateDynamicObject(3556, -1601.15, -2735.22, 53.74,   0.00, 0.00, -36.00);
	CreateDynamicObject(3171, -1531.08, -2780.22, 47.26,   0.00, 0.00, 0.00);
	CreateDynamicObject(3171, -1516.47, -2747.31, 47.54,   0.00, 0.00, 0.00);
	CreateDynamicObject(5130, -1543.60, -2770.09, 48.18,   0.00, 0.00, -81.00);
	CreateDynamicObject(7230, -1542.44, -2779.25, 67.39,   0.00, 0.00, -33.00);
	CreateDynamicObject(983, -1550.93, -2765.10, 51.15,   0.00, 90.00, 55.00);
	CreateDynamicObject(983, -1550.18, -2764.07, 51.15,   0.00, 90.00, 55.00);
	CreateDynamicObject(983, -1556.18, -2761.42, 51.15,   0.00, 90.00, 55.00);
	CreateDynamicObject(983, -1555.46, -2760.40, 51.15,   0.00, 90.00, 55.00);
	CreateDynamicObject(983, -1561.39, -2757.75, 51.15,   0.00, 90.00, 55.00);
	CreateDynamicObject(983, -1560.69, -2756.73, 51.15,   0.00, 90.00, 55.00);
	CreateDynamicObject(983, -1566.66, -2754.13, 51.15,   0.00, 90.00, 55.00);
	CreateDynamicObject(983, -1565.91, -2753.06, 51.15,   0.00, 90.00, 55.00);
	CreateDynamicObject(983, -1571.93, -2750.46, 51.15,   0.00, 90.00, 55.00);
	CreateDynamicObject(983, -1571.23, -2749.39, 51.15,   0.00, 90.00, 55.00);
	CreateDynamicObject(983, -1577.12, -2746.68, 51.15,   0.00, 90.00, 55.00);
	CreateDynamicObject(983, -1576.51, -2745.73, 51.15,   0.00, 90.00, 55.00);
	CreateDynamicObject(983, -1582.35, -2743.02, 51.15,   0.00, 90.00, 55.00);
	CreateDynamicObject(983, -1581.70, -2742.07, 51.15,   0.00, 90.00, 55.00);
	CreateDynamicObject(983, -1587.39, -2739.08, 51.15,   0.00, 90.00, 55.00);
	CreateDynamicObject(983, -1586.94, -2738.41, 51.15,   0.00, 90.00, 55.00);
	CreateDynamicObject(983, -1592.22, -2734.72, 51.15,   0.00, 90.00, 55.00);
	CreateDynamicObject(983, -1597.44, -2731.04, 51.15,   0.00, 90.00, 55.00);
	CreateDynamicObject(983, -1599.41, -2731.03, 51.15,   0.00, 90.00, 55.00);
	CreateDynamicObject(983, -1592.92, -2735.75, 51.15,   0.00, 90.00, 55.00);
	CreateDynamicObject(983, -1597.16, -2730.57, 51.74,   0.00, 0.00, 55.00);
	CreateDynamicObject(983, -1591.89, -2734.25, 51.74,   0.00, 0.00, 55.00);
	CreateDynamicObject(983, -1586.61, -2737.95, 51.74,   0.00, 0.00, 55.00);
	CreateDynamicObject(983, -1581.36, -2741.68, 51.74,   0.00, 0.00, 55.00);
	CreateDynamicObject(983, -1576.11, -2745.35, 51.74,   0.00, 0.00, 55.00);
	CreateDynamicObject(983, -1570.89, -2749.02, 51.74,   0.00, 0.00, 55.00);
	CreateDynamicObject(983, -1565.65, -2752.72, 51.74,   0.00, 0.00, 55.00);
	CreateDynamicObject(983, -1560.40, -2756.37, 51.74,   0.00, 0.00, 55.00);
	CreateDynamicObject(983, -1555.19, -2760.03, 51.74,   0.00, 0.00, 55.00);
	CreateDynamicObject(983, -1549.89, -2763.79, 51.74,   0.00, 0.00, 55.00);
	CreateDynamicObject(983, -1602.31, -2730.67, 51.74,   0.00, 0.00, 127.00);
	CreateDynamicObject(3279, -1613.99, -2727.42, 46.95,   0.00, 0.00, 55.00);
	CreateDynamicObject(3279, -1627.07, -2717.82, 46.95,   0.00, 0.00, 55.00);
	CreateDynamicObject(8041, -1638.31, -2710.76, 52.10,   0.00, 0.00, -131.00);
	CreateDynamicObject(4100, -1627.89, -2721.48, 49.41,   0.00, 0.00, 103.00);
	CreateDynamicObject(4100, -1616.92, -2729.78, 49.41,   0.00, 0.00, 103.00);
	//////////АВТО//////////
	CreateVehicle(400, -1556.8596, -2760.9006, 48.4867, -33.0000, -1, -1, 100);
	CreateVehicle(400, -1568.9144, -2752.9788, 48.4867, -33.0000, -1, -1, 100);
	CreateVehicle(560, -1581.0493, -2745.0581, 48.0920, -33.0000, -1, -1, 100);
	CreateVehicle(560, -1592.8276, -2736.1062, 48.0920, -33.0000, -1, -1, 100);
	CreateVehicle(560, -1605.3912, -2727.9971, 48.0920, -33.0000, -1, -1, 100);
	CreateVehicle(560, -1593.0587, -2705.4451, 48.0920, -33.0000, -1, -1, 100);
	CreateVehicle(560, -1580.2983, -2714.6968, 48.0920, -33.0000, -1, -1, 100);
	CreateVehicle(560, -1513.9510, -2776.3342, 48.2106, -33.0000, -1, -1, 100);
	CreateVehicle(411, -1518.4154, -2782.4829, 48.2848, -33.0000, -1, -1, 100);
	//////////////////////////РУБЛЕВКА//////////////////////////////////////
	CreateDynamicObject(3443, 1517.88, -2465.82, 15.45,   0.00, 0.00, 0.00);
	CreateDynamicObject(3443, 1548.81, -2465.77, 15.45,   0.00, 0.00, 0.00);
	CreateDynamicObject(3443, 1579.61, -2465.82, 15.45,   0.00, 0.00, 0.00);
	CreateDynamicObject(3443, 1610.45, -2465.83, 15.45,   0.00, 0.00, 0.00);
	CreateDynamicObject(3486, 1640.95, -2461.57, 19.53,   0.00, 0.00, 0.00);
	CreateDynamicObject(3486, 1671.09, -2461.59, 19.53,   0.00, 0.00, 0.00);
	CreateDynamicObject(3486, 1700.99, -2461.75, 19.53,   0.00, 0.00, 0.00);
	CreateDynamicObject(3486, 1731.28, -2461.71, 19.53,   0.00, 0.00, 0.00);
	CreateDynamicObject(3486, 1761.31, -2461.79, 19.53,   0.00, 0.00, 0.00);
	CreateDynamicObject(3486, 1791.23, -2461.88, 19.53,   0.00, 0.00, 0.00);
	CreateDynamicObject(3486, 1821.27, -2461.91, 19.53,   0.00, 0.00, 0.00);
	CreateDynamicObject(3486, 1819.19, -2429.71, 19.53,   0.00, 0.00, 90.00);
	CreateDynamicObject(3486, 1819.02, -2401.51, 19.53,   0.00, 0.00, 90.00);
	CreateDynamicObject(3486, 1862.26, -2399.77, 19.53,   0.00, 0.00, -90.00);
	CreateDynamicObject(3486, 1862.27, -2429.99, 19.53,   0.00, 0.00, -90.00);
	CreateDynamicObject(3486, 1860.28, -2461.80, 19.53,   0.00, 0.00, 0.00);
	CreateDynamicObject(3486, 1822.01, -2527.67, 19.53,   0.00, 0.00, 90.00);
	CreateDynamicObject(3486, 1822.14, -2557.61, 19.53,   0.00, 0.00, 90.00);
	CreateDynamicObject(3486, 1884.15, -2559.67, 19.53,   0.00, 0.00, 90.00);
	CreateDynamicObject(3485, 1790.34, -2555.61, 19.53,   0.00, 0.00, 180.00);
	CreateDynamicObject(3485, 1760.39, -2555.56, 19.53,   0.00, 0.00, 180.00);
	CreateDynamicObject(3485, 1730.47, -2555.56, 19.53,   0.00, 0.00, 180.00);
	CreateDynamicObject(3485, 1700.42, -2555.62, 19.53,   0.00, 0.00, 180.00);
	CreateDynamicObject(3485, 1719.44, -2673.73, 19.53,   0.00, 0.00, 180.00);
	CreateDynamicObject(3485, 1689.53, -2626.66, 19.53,   0.00, 0.00, 180.00);
	CreateDynamicObject(3485, 1659.46, -2626.66, 19.55,   0.00, 0.00, 180.00);
	CreateDynamicObject(3485, 1629.30, -2626.58, 19.55,   0.00, 0.00, 180.00);
	CreateDynamicObject(3485, 1599.37, -2626.56, 19.55,   0.00, 0.00, 180.00);
	CreateDynamicObject(3485, 1569.49, -2626.58, 19.55,   0.00, 0.00, 180.00);
	CreateDynamicObject(3485, 1539.52, -2626.63, 19.55,   0.00, 0.00, 180.00);
	CreateDynamicObject(3485, 1509.49, -2626.63, 19.55,   0.00, 0.00, 180.00);
	CreateDynamicObject(3485, 1479.43, -2626.65, 19.55,   0.00, 0.00, 180.00);
	CreateDynamicObject(3485, 1449.38, -2626.62, 19.55,   0.00, 0.00, 180.00);
	CreateDynamicObject(3485, 1419.30, -2626.55, 19.55,   0.00, 0.00, 180.00);
	CreateDynamicObject(3445, 1511.61, -2526.94, 15.58,   0.00, 0.00, 0.00);
	CreateDynamicObject(3445, 1511.92, -2562.75, 15.62,   0.00, 0.00, -180.00);
	CreateDynamicObject(3445, 1493.59, -2562.78, 15.62,   0.00, 0.00, -180.00);
	CreateDynamicObject(3445, 1475.31, -2562.77, 15.62,   0.00, 0.00, -180.00);
	CreateDynamicObject(3445, 1457.22, -2562.73, 15.62,   0.00, 0.00, -180.00);
	CreateDynamicObject(3445, 1439.12, -2562.77, 15.62,   0.00, 0.00, -180.00);
	CreateDynamicObject(3445, 1493.53, -2526.96, 15.58,   0.00, 0.00, 0.00);
	CreateDynamicObject(3445, 1475.36, -2526.93, 15.58,   0.00, 0.00, 0.00);
	CreateDynamicObject(3445, 1457.12, -2526.96, 15.58,   0.00, 0.00, 0.00);
	CreateDynamicObject(3445, 1438.94, -2526.92, 15.58,   0.00, 0.00, 0.00);
	CreateDynamicObject(3445, 1530.04, -2562.68, 15.62,   0.00, 0.00, -180.00);
	CreateDynamicObject(3445, 1548.18, -2562.64, 15.62,   0.00, 0.00, -180.00);
	CreateDynamicObject(3445, 1566.35, -2562.61, 15.62,   0.00, 0.00, -180.00);
	CreateDynamicObject(3445, 1584.38, -2562.60, 15.62,   0.00, 0.00, -180.00);
	CreateDynamicObject(3445, 1621.61, -2562.61, 15.62,   0.00, 0.00, -180.00);
	CreateDynamicObject(3749, 1603.02, -2575.07, 17.86,   0.00, 0.00, 0.00);
	CreateDynamicObject(3445, 1529.64, -2526.93, 15.58,   0.00, 0.00, 0.00);
	CreateDynamicObject(3445, 1547.73, -2526.90, 15.58,   0.00, 0.00, 0.00);
	CreateDynamicObject(3445, 1565.63, -2526.91, 15.58,   0.00, 0.00, 0.00);
	CreateDynamicObject(3445, 1583.79, -2526.90, 15.58,   0.00, 0.00, 0.00);
	CreateDynamicObject(4100, 1600.04, -2512.55, 13.01,   0.00, 0.00, -40.00);
	CreateDynamicObject(4100, 1613.78, -2512.62, 13.01,   0.00, 0.00, -40.00);
	CreateDynamicObject(4100, 1625.10, -2512.60, 13.01,   0.00, 0.00, -40.00);
	CreateDynamicObject(4100, 1631.84, -2524.13, 13.01,   0.00, 0.00, -130.00);
	CreateDynamicObject(4100, 1631.80, -2537.83, 13.01,   0.00, 0.00, -130.00);
	CreateDynamicObject(4100, 1631.73, -2551.51, 13.01,   0.00, 0.00, -130.00);
	CreateDynamicObject(4100, 1631.69, -2565.19, 13.01,   0.00, 0.00, -130.00);
	CreateDynamicObject(4100, 1685.55, -2532.12, 13.01,   0.00, 0.00, -130.00);
	CreateDynamicObject(4100, 1685.55, -2518.46, 13.01,   0.00, 0.00, -130.00);
	CreateDynamicObject(3749, 1695.16, -2512.01, 17.86,   0.00, 0.00, 0.00);
	CreateDynamicObject(3749, 1725.16, -2511.90, 17.86,   0.00, 0.00, 0.00);
	CreateDynamicObject(3749, 1754.90, -2512.04, 17.86,   0.00, 0.00, 0.00);
	CreateDynamicObject(3749, 1783.75, -2511.95, 17.86,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, 1804.90, -2512.71, 12.29,   0.00, 0.00, 180.00);
	CreateDynamicObject(987, 1774.09, -2512.65, 12.29,   0.00, 0.00, 180.00);
	CreateDynamicObject(987, 1745.38, -2512.64, 12.29,   0.00, 0.00, 180.00);
	CreateDynamicObject(987, 1715.79, -2512.58, 12.29,   0.00, 0.00, 180.00);
	CreateDynamicObject(987, 1715.63, -2525.98, 12.29,   0.00, 0.00, 90.00);
	CreateDynamicObject(987, 1715.61, -2537.91, 12.29,   0.00, 0.00, 90.00);
	CreateDynamicObject(987, 1715.65, -2549.86, 12.29,   0.00, 0.00, 90.00);
	CreateDynamicObject(987, 1744.96, -2526.17, 12.29,   0.00, 0.00, 90.00);
	CreateDynamicObject(987, 1744.97, -2538.08, 12.29,   0.00, 0.00, 90.00);
	CreateDynamicObject(987, 1744.92, -2550.03, 12.29,   0.00, 0.00, 90.00);
	CreateDynamicObject(987, 1774.83, -2525.41, 12.29,   0.00, 0.00, 90.00);
	CreateDynamicObject(987, 1774.80, -2537.31, 12.29,   0.00, 0.00, 90.00);
	CreateDynamicObject(987, 1774.81, -2549.24, 12.29,   0.00, 0.00, 90.00);
	CreateDynamicObject(3486, 1893.99, -2428.10, 19.53,   0.00, 0.00, 0.00);
	CreateDynamicObject(3486, 1924.09, -2428.14, 19.53,   0.00, 0.00, 0.00);
	CreateDynamicObject(3486, 1954.24, -2428.23, 19.53,   0.00, 0.00, 0.00);
	CreateDynamicObject(3749, 1884.96, -2476.87, 17.86,   0.00, 0.00, 0.00);
	CreateDynamicObject(3749, 1916.41, -2476.99, 17.86,   0.00, 0.00, 0.00);
	CreateDynamicObject(3749, 1947.74, -2476.94, 17.86,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, 1894.66, -2478.67, 12.29,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, 1926.21, -2478.76, 12.29,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, 1957.62, -2478.75, 12.30,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, 1969.41, -2478.80, 12.32,   0.00, 0.00, 90.00);
	CreateDynamicObject(987, 1969.43, -2466.92, 12.29,   0.00, 0.00, 90.00);
	CreateDynamicObject(987, 1969.45, -2454.97, 12.29,   0.00, 0.00, 90.00);
	CreateDynamicObject(987, 1938.95, -2454.07, 12.29,   0.00, 0.00, 90.00);
	CreateDynamicObject(987, 1938.99, -2466.02, 12.29,   0.00, 0.00, 90.00);
	CreateDynamicObject(987, 1938.96, -2477.92, 12.29,   0.00, 0.00, 90.00);
	CreateDynamicObject(987, 1908.87, -2454.27, 12.29,   0.00, 0.00, 90.00);
	CreateDynamicObject(987, 1908.86, -2466.20, 12.29,   0.00, 0.00, 90.00);
	CreateDynamicObject(987, 1908.87, -2478.12, 12.29,   0.00, 0.00, 90.00);
	CreateDynamicObject(705, 1901.22, -2474.47, 11.94,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, 1933.66, -2474.01, 11.94,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, 1964.33, -2474.61, 11.94,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, 1907.10, -2523.37, 11.94,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, 1858.67, -2521.70, 11.94,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1794.14, -2493.96, 12.47,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1838.37, -2493.83, 12.47,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1818.53, -2493.90, 12.47,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1763.04, -2493.79, 12.47,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1716.52, -2493.85, 12.47,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1740.82, -2493.88, 12.47,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1673.31, -2493.98, 12.47,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1632.16, -2494.03, 12.47,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1652.47, -2493.92, 12.47,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1673.84, -2512.75, 12.47,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1679.86, -2512.71, 12.47,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1632.45, -2512.60, 12.47,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1626.38, -2513.72, 12.47,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1617.81, -2513.94, 12.47,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1609.55, -2513.50, 12.47,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1601.56, -2513.24, 12.47,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1592.12, -2549.99, 12.40,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1573.67, -2549.43, 12.40,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1555.49, -2549.37, 12.40,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1537.16, -2549.11, 12.40,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1518.76, -2549.27, 12.40,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1501.42, -2549.35, 12.40,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1482.64, -2549.72, 12.40,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1464.71, -2549.20, 12.40,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1446.52, -2549.50, 12.40,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1504.51, -2477.46, 12.40,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1504.55, -2482.70, 12.40,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1504.32, -2489.24, 12.40,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1504.29, -2495.74, 12.40,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1504.37, -2500.51, 12.40,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1504.02, -2505.51, 12.40,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1503.59, -2510.00, 12.40,   0.00, 0.00, 0.00);
	CreateDynamicObject(3485, 1413.20, -2549.13, 19.55,   0.00, 0.00, 90.00);
	CreateDynamicObject(700, 1426.64, -2574.85, 12.40,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1419.80, -2574.87, 12.40,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1411.82, -2574.89, 12.40,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1404.08, -2574.86, 12.40,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1396.32, -2574.69, 12.40,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1396.27, -2570.03, 12.40,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1396.16, -2564.40, 12.40,   0.00, 0.00, 0.00);
	CreateDynamicObject(708, 1434.09, -2593.36, 12.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(708, 1456.50, -2592.91, 12.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(708, 1503.57, -2593.47, 12.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(708, 1535.71, -2591.65, 12.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(708, 1568.45, -2593.32, 12.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(708, 1598.66, -2593.62, 12.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(708, 1632.55, -2592.98, 12.18,   0.00, 0.00, 3.78);
	CreateDynamicObject(708, 1672.68, -2593.06, 12.18,   0.00, 0.00, 3.78);
	CreateDynamicObject(708, 1673.66, -2558.62, 12.18,   0.00, 0.00, 3.78);
	CreateDynamicObject(708, 1673.59, -2535.32, 12.18,   0.00, 0.00, 3.78);
	CreateDynamicObject(708, 1733.05, -2633.04, 12.18,   0.00, 0.00, 3.78);
	CreateDynamicObject(708, 1732.79, -2638.11, 12.18,   0.00, 0.00, 3.78);
	CreateDynamicObject(708, 1752.99, -2606.25, 12.18,   0.00, 0.00, 3.78);
	CreateDynamicObject(708, 1749.86, -2565.91, 12.18,   0.00, 0.00, 3.78);
	CreateDynamicObject(708, 1779.61, -2564.88, 12.18,   0.00, 0.00, 3.78);
	CreateDynamicObject(708, 1812.06, -2567.31, 12.18,   0.00, 0.00, 3.78);
	CreateDynamicObject(987, 1805.11, -2572.47, 11.50,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, 1816.96, -2572.48, 11.50,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, 1828.79, -2572.49, 11.50,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, 1846.42, -2572.57, 11.50,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, 1858.36, -2572.59, 11.50,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, 1870.27, -2572.70, 11.50,   0.00, 0.00, 0.00);
	CreateDynamicObject(8251, 1898.22, -2560.19, 16.20,   0.00, 0.00, 0.00);
	CreateDynamicObject(8251, 1934.76, -2525.79, 15.89,   0.00, 0.00, 90.00);
	CreateDynamicObject(8251, 1959.33, -2525.77, 15.89,   0.00, 0.00, 90.00);
	CreateDynamicObject(8251, 1984.59, -2525.77, 15.89,   0.00, 0.00, 90.00);
	CreateDynamicObject(8251, 2009.10, -2500.18, 15.89,   0.00, 0.00, -180.00);
	CreateDynamicObject(8251, 2009.06, -2474.84, 15.89,   0.00, 0.00, -180.00);
	CreateDynamicObject(8251, 1983.35, -2450.29, 15.89,   0.00, 0.00, -90.00);
	CreateDynamicObject(705, 1998.42, -2457.69, 11.94,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1845.59, -2424.68, 12.47,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1846.51, -2394.43, 12.47,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1856.12, -2385.47, 12.47,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1850.82, -2385.52, 12.47,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1845.78, -2385.45, 12.47,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1837.07, -2385.19, 12.47,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1833.07, -2384.96, 12.47,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1829.06, -2384.91, 12.47,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 1824.03, -2385.14, 12.47,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, 1502.72, -2449.75, 12.34,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, 1502.69, -2461.71, 12.34,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, 1502.63, -2485.59, 12.34,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, 1502.67, -2473.71, 12.34,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, 1502.63, -2497.51, 12.34,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, 1502.60, -2509.48, 12.34,   0.00, 0.00, -90.00);
	CreateDynamicObject(979, 1400.22, -2609.97, 13.20,   0.00, 0.00, 0.00);
	CreateDynamicObject(979, 1396.16, -2605.21, 13.20,   0.00, 0.00, -90.00);
	CreateDynamicObject(979, 1396.19, -2595.93, 13.20,   0.00, 0.00, -90.00);
	CreateDynamicObject(979, 1396.18, -2586.74, 13.20,   0.00, 0.00, -90.00);
	CreateDynamicObject(979, 1396.20, -2577.57, 13.20,   0.00, 0.00, -90.00);
	CreateDynamicObject(979, 1396.22, -2568.60, 13.20,   0.00, 0.00, -90.00);
	CreateDynamicObject(3486, 1747.03, -2587.04, 19.52,   0.00, 0.00, -90.00);
	CreateDynamicObject(3486, 1747.02, -2617.25, 19.52,   0.00, 0.00, -90.00);
	CreateDynamicObject(708, 1517.94, -2514.95, 12.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(708, 1535.23, -2514.93, 12.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(708, 1554.18, -2514.44, 12.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(708, 1571.84, -2514.63, 12.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(708, 1590.11, -2514.32, 12.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(708, 1551.19, -2453.59, 12.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(708, 1517.50, -2453.89, 12.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(708, 1578.03, -2453.10, 12.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(708, 1606.71, -2453.46, 12.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(708, 1630.23, -2449.21, 12.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(708, 1659.77, -2449.50, 12.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(708, 1690.03, -2450.19, 12.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(708, 1720.13, -2448.66, 12.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(708, 1749.47, -2448.78, 12.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(708, 1780.71, -2449.61, 12.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(708, 1808.44, -2448.61, 12.18,   0.00, 0.00, 0.00);
	CreateDynamicObject(708, 1808.33, -2411.09, 12.07,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, 1911.44, -2572.55, 11.50,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, 1923.29, -2572.61, 11.50,   0.00, 0.00, 90.00);
	CreateDynamicObject(987, 1923.37, -2560.78, 11.50,   0.00, 0.00, 90.00);
	CreateDynamicObject(987, 1923.39, -2550.87, 11.50,   0.00, 0.00, 90.00);
	CreateDynamicObject(1257, 1911.87, -2513.50, 13.69,   0.00, 0.00, -90.00);
	CreateDynamicObject(1257, 1814.44, -2511.08, 13.69,   0.00, 0.00, -90.00);
	CreateDynamicObject(1257, 1650.06, -2513.50, 13.76,   0.00, 0.00, -90.00);
	CreateDynamicObject(1257, 1654.86, -2513.47, 13.76,   0.00, 0.00, -90.00);
	CreateDynamicObject(1257, 1663.19, -2608.25, 13.76,   0.00, 0.00, -90.00);
	CreateDynamicObject(1257, 1543.47, -2608.30, 13.76,   0.00, 0.00, -90.00);
	CreateDynamicObject(1257, 1678.60, -2479.55, 13.61,   0.00, 0.00, 90.00);
	CreateDynamicObject(1257, 1564.99, -2477.61, 13.61,   0.00, 0.00, 90.00);
	//////////////АВТО///////////////////////////////////////////////////
	CreateVehicle(411, 1515.5227, -2500.0483, 13.2481, 0.0000, -1, -1, 100);
	CreateVehicle(409, 1976.2980, -2449.0986, 13.1603, 0.0000, -1, -1, 100);
	CreateVehicle(409, 1980.8339, -2449.5149, 13.1603, 0.0000, -1, -1, 100);
	CreateVehicle(409, 1986.6786, -2449.5195, 13.1603, 0.0000, -1, -1, 100);
	CreateVehicle(409, 1991.0930, -2449.7786, 13.1603, 0.0000, -1, -1, 100);
	CreateVehicle(409, 2013.2906, -2468.6604, 13.1603, 0.0000, -1, -1, 100);
	CreateVehicle(409, 2008.3827, -2468.6042, 13.1603, 0.0000, -1, -1, 100);
	CreateVehicle(409, 2003.8682, -2468.5562, 13.1603, 0.0000, -1, -1, 100);
	CreateVehicle(409, 1999.4150, -2468.3945, 13.1603, 0.0000, -1, -1, 100);
	CreateVehicle(431, 2004.5010, -2480.7590, 13.6524, 91.0000, -1, -1, 100);
	CreateVehicle(437, 2004.8131, -2492.7827, 14.1309, 90.0000, -1, -1, 100);
	CreateVehicle(437, 2004.6017, -2499.0798, 14.1309, 90.0000, -1, -1, 100);
	CreateVehicle(437, 2004.6527, -2505.7476, 14.1309, 90.0000, -1, -1, 100);
	CreateVehicle(420, 1991.8214, -2527.6685, 13.3894, 0.0000, -1, -1, 100);
	CreateVehicle(420, 1991.6572, -2516.9280, 13.3894, 0.0000, -1, -1, 100);
	CreateVehicle(420, 1985.5238, -2526.6221, 13.3894, 0.0000, -1, -1, 100);
	CreateVehicle(420, 1978.5959, -2527.6267, 13.3894, 0.0000, -1, -1, 100);
	CreateVehicle(420, 1985.5256, -2516.9309, 13.3894, 0.0000, -1, -1, 100);
	CreateVehicle(420, 1978.9531, -2517.0872, 13.3894, 0.0000, -1, -1, 100);
	//////////////////////////WAR_CITY////////////////////////////////////////
	CreateDynamicObject(8171, 302.24, 1848.03, 16.79,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, 302.20, 1986.08, 16.75,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, 342.14, 1984.92, 16.75,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, 342.11, 1859.76, 16.75,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, 262.33, 1986.03, 16.75,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, 222.41, 1985.94, 16.75,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, 262.37, 1848.09, 16.79,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, 302.27, 1709.90, 16.77,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, 262.34, 1712.86, 16.77,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, 222.40, 1758.01, 16.77,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, 182.58, 1764.42, 16.77,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, 142.85, 1764.46, 16.77,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, 103.08, 1764.60, 16.77,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, 103.13, 1902.36, 16.77,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, 63.27, 1902.75, 16.77,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, 63.27, 1764.68, 16.77,   0.00, 0.00, 0.00);
	CreateDynamicObject(3486, 175.33, 1712.44, 23.75,   0.00, 0.00, 180.00);
	CreateDynamicObject(3486, 145.26, 1712.47, 23.75,   0.00, 0.00, 180.00);
	CreateDynamicObject(3486, 115.34, 1712.50, 23.75,   0.00, 0.00, 180.00);
	CreateDynamicObject(3486, 85.35, 1712.53, 23.75,   0.00, 0.00, 180.00);
	CreateDynamicObject(3486, 58.26, 1712.48, 23.75,   0.00, 0.00, 180.00);
	CreateDynamicObject(3486, 126.49, 1782.09, 23.75,   0.00, 0.00, -360.00);
	CreateDynamicObject(3486, 156.34, 1781.94, 23.75,   0.00, 0.00, -360.00);
	CreateDynamicObject(3486, 186.35, 1781.77, 23.75,   0.00, 0.00, -360.00);
	CreateDynamicObject(3486, 216.19, 1781.67, 23.75,   0.00, 0.00, -360.00);
	CreateDynamicObject(3486, 246.21, 1781.55, 23.75,   0.00, 0.00, -360.00);
	CreateDynamicObject(3486, 205.27, 1729.80, 23.75,   0.00, 0.00, 180.00);
	CreateDynamicObject(3486, 235.48, 1736.50, 23.75,   0.00, 0.00, 180.00);
	CreateDynamicObject(3484, 303.88, 1767.51, 23.42,   0.00, 0.00, -90.00);
	CreateDynamicObject(3484, 303.98, 1737.40, 23.42,   0.00, 0.00, -90.00);
	CreateDynamicObject(3484, 304.19, 1707.34, 23.42,   0.00, 0.00, -90.00);
	CreateDynamicObject(3484, 304.20, 1677.39, 23.42,   0.00, 0.00, -90.00);
	CreateDynamicObject(3483, 221.08, 2049.31, 23.73,   0.00, 0.00, 90.00);
	CreateDynamicObject(3483, 253.09, 2068.28, 23.71,   0.00, 0.00, 0.00);
	CreateDynamicObject(3483, 283.18, 2068.23, 23.72,   0.00, 0.00, 0.00);
	CreateDynamicObject(3483, 313.16, 2068.31, 23.72,   0.00, 0.00, 0.00);
	CreateDynamicObject(3487, 373.41, 1988.67, 23.43,   0.00, 0.00, -90.00);
	CreateDynamicObject(3487, 373.45, 1968.23, 23.43,   0.00, 0.00, -90.00);
	CreateDynamicObject(3487, 373.56, 1947.41, 23.43,   0.00, 0.00, -90.00);
	CreateDynamicObject(3487, 373.61, 1926.72, 23.43,   0.00, 0.00, -90.00);
	CreateDynamicObject(3487, 346.50, 1901.82, 23.43,   0.00, 0.00, -180.00);
	CreateDynamicObject(3487, 325.99, 1901.73, 23.43,   0.00, 0.00, -180.00);
	CreateDynamicObject(3487, 295.87, 1901.88, 23.43,   0.00, 0.00, -180.00);
	CreateDynamicObject(3487, 335.31, 1874.47, 23.43,   0.00, 0.00, -90.00);
	CreateDynamicObject(3487, 335.30, 1854.42, 23.43,   0.00, 0.00, -90.00);
	CreateDynamicObject(3487, 335.37, 1833.64, 23.43,   0.00, 0.00, -90.00);
	CreateDynamicObject(3485, 60.73, 1762.65, 23.75,   0.00, 0.00, 90.00);
	CreateDynamicObject(3485, 60.73, 1792.72, 23.74,   0.00, 0.00, 90.00);
	CreateDynamicObject(3485, 60.89, 1822.89, 23.74,   0.00, 0.00, 90.00);
	CreateDynamicObject(3485, 61.15, 1852.96, 23.74,   0.00, 0.00, 90.00);
	CreateDynamicObject(3485, 61.31, 1882.59, 23.74,   0.00, 0.00, 90.00);
	CreateDynamicObject(3485, 61.54, 1912.49, 23.74,   0.00, 0.00, 90.00);
	CreateDynamicObject(3485, 61.84, 1942.43, 23.74,   0.00, 0.00, 90.00);
	CreateDynamicObject(987, 96.94, 1941.32, 16.79,   0.00, 0.00, 90.00);
	CreateDynamicObject(987, 96.87, 1953.30, 16.79,   0.00, 0.00, 90.00);
	CreateDynamicObject(987, 86.64, 1971.06, 16.79,   0.00, 0.00, 180.00);
	CreateDynamicObject(987, 74.62, 1971.07, 16.79,   0.00, 0.00, 180.00);
	CreateDynamicObject(987, 62.69, 1971.09, 16.79,   0.00, 0.00, 180.00);
	CreateDynamicObject(987, 55.32, 1971.10, 16.79,   0.00, 0.00, 180.00);
	CreateDynamicObject(8150, 43.87, 1908.27, 17.87,   0.00, 0.00, 90.00);
	CreateDynamicObject(8150, 43.89, 1783.89, 17.87,   0.00, 0.00, 90.00);
	CreateDynamicObject(8150, 106.20, 1695.87, 17.87,   0.00, 0.00, -180.00);
	CreateDynamicObject(8150, 228.57, 1674.49, 17.87,   0.00, 0.00, -200.00);
	CreateDynamicObject(987, 287.63, 1652.98, 16.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, 299.57, 1652.92, 16.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, 308.66, 1652.89, 16.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, 320.55, 1652.86, 16.62,   0.00, 0.00, 90.00);
	CreateDynamicObject(983, 285.24, 1782.51, 20.36,   0.00, 90.00, -47.00);
	CreateDynamicObject(983, 288.41, 1788.39, 19.75,   -11.00, 90.00, -47.00);
	CreateDynamicObject(983, 283.75, 1784.06, 20.36,   0.00, 90.00, -47.00);
	CreateDynamicObject(983, 289.86, 1786.85, 19.75,   -11.00, 90.00, -47.00);
	CreateDynamicObject(983, 294.44, 1791.12, 18.54,   -11.00, 90.00, -47.00);
	CreateDynamicObject(983, 292.96, 1792.69, 18.54,   -11.00, 90.00, -47.00);
	CreateDynamicObject(983, 297.55, 1796.98, 17.32,   -11.00, 90.00, -47.00);
	CreateDynamicObject(983, 299.03, 1795.39, 17.32,   -11.00, 90.00, -47.00);
	CreateDynamicObject(983, 279.06, 1779.71, 20.36,   0.00, 90.00, -47.00);
	CreateDynamicObject(983, 280.55, 1778.17, 20.36,   0.00, 90.00, -47.00);
	CreateDynamicObject(983, 276.01, 1773.89, 19.35,   18.00, 90.00, -47.00);
	CreateDynamicObject(983, 274.52, 1775.46, 19.35,   18.00, 90.00, -47.00);
	CreateDynamicObject(983, 270.10, 1771.31, 17.38,   18.00, 90.00, -47.00);
	CreateDynamicObject(983, 271.57, 1769.77, 17.38,   18.00, 90.00, -47.00);
	CreateDynamicObject(983, 283.33, 1784.52, 21.00,   0.00, 0.00, -47.00);
	CreateDynamicObject(983, 278.67, 1780.17, 21.00,   0.00, 0.00, -47.00);
	CreateDynamicObject(983, 280.92, 1777.77, 21.00,   0.00, 0.00, -47.00);
	CreateDynamicObject(983, 285.59, 1782.14, 21.00,   0.00, 0.00, -47.00);
	CreateDynamicObject(983, 285.59, 1782.14, 22.23,   0.00, 0.00, -47.00);
	CreateDynamicObject(983, 280.93, 1777.75, 22.23,   0.00, 0.00, -47.00);
	CreateDynamicObject(983, 278.66, 1780.16, 22.23,   0.00, 0.00, -47.00);
	CreateDynamicObject(983, 280.93, 1777.75, 22.23,   0.00, 0.00, -47.00);
	CreateDynamicObject(983, 283.34, 1784.56, 22.23,   0.00, 0.00, -47.00);
	CreateDynamicObject(983, 283.34, 1784.56, 23.43,   0.00, 0.00, -47.00);
	CreateDynamicObject(983, 278.65, 1780.18, 23.43,   0.00, 0.00, -47.00);
	CreateDynamicObject(983, 285.56, 1782.14, 23.43,   0.00, 0.00, -47.00);
	CreateDynamicObject(983, 280.92, 1777.80, 23.43,   0.00, 0.00, -47.00);
	CreateDynamicObject(983, 279.06, 1779.71, 23.99,   0.00, 90.00, -47.00);
	CreateDynamicObject(983, 279.90, 1778.79, 23.99,   0.00, 90.00, -47.00);
	CreateDynamicObject(983, 280.49, 1778.17, 23.99,   0.00, 90.00, -47.00);
	CreateDynamicObject(983, 285.16, 1782.53, 23.99,   0.00, 90.00, -47.00);
	CreateDynamicObject(983, 283.75, 1784.03, 23.99,   0.00, 90.00, -47.00);
	CreateDynamicObject(983, 284.56, 1783.17, 23.99,   0.00, 90.00, -47.00);
	CreateDynamicObject(700, 297.46, 1799.56, 16.24,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 301.63, 1795.09, 16.24,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 303.12, 1791.66, 16.24,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 304.86, 1788.02, 16.24,   0.00, 0.00, 0.06);
	CreateDynamicObject(700, 303.12, 1791.66, 16.24,   0.00, 0.00, 0.00);
	CreateDynamicObject(700, 306.31, 1784.59, 16.24,   0.00, 0.00, 0.06);
	CreateDynamicObject(700, 294.52, 1800.97, 16.24,   0.00, 0.00, 0.06);
	CreateDynamicObject(700, 291.12, 1802.37, 16.24,   0.00, 0.00, 0.06);
	CreateDynamicObject(700, 286.91, 1803.56, 16.24,   0.00, 0.00, 0.06);
	CreateDynamicObject(700, 319.82, 1841.92, 16.24,   0.00, 0.00, 0.06);
	CreateDynamicObject(700, 319.43, 1862.57, 16.24,   0.00, 0.00, 0.06);
	CreateDynamicObject(700, 320.06, 1882.53, 16.24,   0.00, 0.00, 0.06);
	CreateDynamicObject(3524, 315.75, 1919.11, 19.40,   0.00, 0.00, 180.00);
	CreateDynamicObject(3524, 306.40, 1919.27, 19.40,   0.00, 0.00, 180.00);
	CreateDynamicObject(3533, 306.48, 1885.23, 20.78,   0.00, 0.00, 0.00);
	CreateDynamicObject(3533, 315.54, 1885.07, 20.78,   0.00, 0.00, 0.00);
	CreateDynamicObject(3531, 306.54, 1885.13, 27.62,   0.00, 0.00, 90.00);
	CreateDynamicObject(3531, 315.23, 1885.04, 27.62,   0.00, 0.00, 90.00);
	CreateDynamicObject(3554, 262.54, 1727.73, 26.15,   0.00, 0.00, -25.00);
	CreateDynamicObject(3472, 265.68, 1752.91, 16.58,   0.00, 0.00, 0.00);
	CreateDynamicObject(3472, 197.71, 1755.51, 16.58,   0.00, 0.00, 0.00);
	CreateDynamicObject(3472, 167.47, 1749.33, 16.58,   0.00, 0.00, 0.00);
	CreateDynamicObject(3472, 127.69, 1749.88, 16.58,   0.00, 0.00, 0.00);
	CreateDynamicObject(3472, 88.37, 1750.79, 16.58,   0.00, 0.00, 0.00);
	CreateDynamicObject(3472, 88.26, 1781.26, 16.58,   0.00, 0.00, 0.00);
	CreateDynamicObject(3472, 87.97, 1828.02, 16.58,   0.00, 0.00, 0.00);
	CreateDynamicObject(3472, 87.82, 1881.92, 16.58,   0.00, 0.00, 0.00);
	CreateDynamicObject(3465, 98.09, 1793.90, 18.07,   0.00, 0.00, 0.00);
	CreateDynamicObject(3465, 104.64, 1794.00, 18.07,   0.00, 0.00, 0.00);
	CreateDynamicObject(5033, 43.21, 2044.70, 29.97,   0.00, 0.00, 4.00);
	CreateDynamicObject(987, -1.57, 2036.43, 15.89,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -1.58, 2024.50, 15.89,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -1.59, 2012.58, 15.89,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -1.67, 2000.69, 15.89,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -1.84, 1988.64, 15.89,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, 10.00, 1988.76, 15.89,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, 21.80, 1988.65, 15.89,   0.00, 0.00, 0.00);
	CreateDynamicObject(3749, 91.95, 1967.91, 22.30,   0.00, 0.00, -40.00);
	CreateDynamicObject(705, 86.43, 2013.00, 16.82,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, 149.52, 1975.47, 16.82,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, 150.35, 2010.39, 16.82,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, 150.80, 2038.84, 16.82,   0.00, 0.00, 2.04);
	CreateDynamicObject(705, 142.07, 2067.70, 15.60,   0.00, 0.00, 2.04);
	CreateDynamicObject(705, 119.84, 2080.45, 15.24,   0.00, 0.00, 1.44);
	CreateDynamicObject(982, 5.41, 2073.82, 17.00,   0.00, 0.00, 92.00);
	CreateDynamicObject(982, 30.96, 2074.72, 17.00,   0.00, 0.00, 92.00);
	CreateDynamicObject(982, 56.51, 2075.83, 17.00,   0.00, 0.00, 93.00);
	CreateDynamicObject(982, 81.93, 2077.13, 17.00,   0.00, 0.00, 93.00);
	CreateDynamicObject(3749, -5.64, 2067.17, 21.83,   0.00, 0.00, 90.00);
	CreateDynamicObject(987, -7.48, 2057.47, 15.89,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -7.48, 2045.61, 15.89,   0.00, 0.00, -47.00);
	CreateDynamicObject(708, 75.69, 1856.49, 16.23,   0.00, 0.00, 0.00);
	CreateDynamicObject(708, 73.89, 1886.93, 16.23,   0.00, 0.00, 0.00);
	CreateDynamicObject(708, 74.72, 1916.17, 16.23,   0.00, 0.00, -0.06);
	CreateDynamicObject(708, 73.89, 1886.93, 16.23,   0.00, 0.00, 0.00);
	CreateDynamicObject(708, 76.25, 1944.83, 16.23,   0.00, 0.00, -0.06);
	CreateDynamicObject(708, 100.96, 1935.87, 16.23,   0.00, 0.00, -0.06);
	CreateDynamicObject(708, 100.06, 1893.97, 16.23,   0.00, 0.00, -0.06);
	CreateDynamicObject(708, 74.87, 1826.56, 16.23,   0.00, 0.00, -0.06);
	CreateDynamicObject(708, 100.06, 1893.97, 16.23,   0.00, 0.00, -0.06);
	CreateDynamicObject(708, 99.20, 1841.43, 16.23,   0.00, 0.00, -0.06);
	CreateDynamicObject(708, 75.17, 1796.65, 16.23,   0.00, 0.00, -0.06);
	CreateDynamicObject(708, 75.67, 1768.14, 16.23,   0.00, 0.00, -0.06);
	CreateDynamicObject(708, 51.13, 1739.82, 16.23,   0.00, 0.00, -0.06);
	CreateDynamicObject(708, 91.04, 1727.80, 16.23,   0.00, 0.00, -0.06);
	CreateDynamicObject(708, 119.86, 1727.89, 16.23,   0.00, 0.00, -0.06);
	CreateDynamicObject(708, 148.19, 1727.34, 16.23,   0.00, 0.00, -0.06);
	CreateDynamicObject(708, 178.86, 1727.53, 16.23,   0.00, 0.00, -0.06);
	CreateDynamicObject(708, 145.42, 1793.78, 16.23,   0.00, 0.00, -0.06);
	CreateDynamicObject(708, 115.75, 1794.08, 16.23,   0.00, 0.00, -1.62);
	CreateDynamicObject(708, 145.42, 1793.78, 16.23,   0.00, 0.00, -0.06);
	CreateDynamicObject(708, 175.44, 1792.20, 16.23,   0.00, 0.00, -1.62);
	CreateDynamicObject(708, 205.78, 1791.35, 16.23,   0.00, 0.00, -1.62);
	CreateDynamicObject(708, 236.53, 1792.30, 16.23,   0.00, 0.00, -3.06);
	CreateDynamicObject(708, 205.78, 1791.35, 16.23,   0.00, 0.00, -1.62);
	CreateDynamicObject(708, 209.58, 1746.45, 16.00,   0.00, 0.00, -3.06);
	CreateDynamicObject(708, 253.55, 1735.75, 16.00,   0.00, 0.00, -3.06);
	CreateDynamicObject(708, 272.13, 1716.94, 16.00,   0.00, 0.00, -3.06);
	CreateDynamicObject(708, 275.99, 1698.96, 16.00,   0.00, 0.00, -3.06);
	CreateDynamicObject(708, 272.13, 1716.94, 16.00,   0.00, 0.00, -3.06);
	CreateDynamicObject(708, 272.81, 1678.82, 16.00,   0.00, 0.00, -3.06);
	CreateDynamicObject(708, 281.74, 1657.65, 16.00,   0.00, 0.00, -3.06);
	CreateDynamicObject(708, 316.47, 1655.57, 16.00,   0.00, 0.00, -3.06);
	CreateDynamicObject(708, 341.31, 1797.44, 16.00,   0.00, 0.00, -3.06);
	CreateDynamicObject(708, 346.53, 1800.94, 16.00,   0.00, 0.00, -3.06);
	CreateDynamicObject(708, 317.81, 1788.61, 16.00,   0.00, 0.00, -3.06);
	CreateDynamicObject(708, 349.45, 1849.34, 16.00,   0.00, 0.00, 11.10);
	CreateDynamicObject(708, 317.81, 1788.61, 16.00,   0.00, 0.00, -3.06);
	CreateDynamicObject(708, 373.36, 1904.57, 16.00,   0.00, 0.00, 11.10);
	CreateDynamicObject(708, 357.70, 1977.13, 16.00,   0.00, 0.00, 11.10);
	CreateDynamicObject(708, 358.48, 1956.89, 16.00,   0.00, 0.00, 11.10);
	CreateDynamicObject(705, 354.17, 2028.32, 21.14,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, 336.37, 2066.27, 15.42,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, 325.02, 2034.30, 15.42,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, 329.49, 2014.30, 15.42,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, 346.65, 2002.49, 15.42,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, 321.55, 1964.89, 15.42,   0.00, 0.00, 0.00);
	CreateDynamicObject(705, 234.67, 2034.21, 16.32,   0.00, 0.00, 4.44);
	CreateDynamicObject(705, 235.48, 2059.86, 16.32,   0.00, 0.00, 4.44);
	CreateDynamicObject(705, 264.71, 2056.22, 16.32,   0.00, 0.00, 4.44);
	CreateDynamicObject(705, 294.54, 2055.09, 16.32,   0.00, 0.00, 4.44);
	CreateDynamicObject(5131, 228.70, 1970.11, 23.29,   0.00, 0.00, 0.00);
	CreateDynamicObject(5129, 224.18, 1970.66, 21.76,   0.00, 0.00, 0.00);
	CreateDynamicObject(5130, 218.20, 1962.20, 21.09,   0.00, 0.00, 45.00);
	CreateDynamicObject(5170, 239.82, 1982.65, 19.81,   0.00, 0.00, 90.00);
	CreateDynamicObject(3483, 221.10, 2023.07, 23.73,   0.00, 0.00, 90.00);
	CreateDynamicObject(5262, 262.45, 1995.83, 19.62,   0.00, 0.00, 0.00);
	CreateDynamicObject(6391, 265.64, 1833.97, 57.16,   0.00, 0.00, 98.00);
	CreateDynamicObject(9114, 327.63, 1807.97, 23.40,   0.00, 0.00, 62.00);
	//////////////////////////////АВТО///////////////////////////////////
	CreateVehicle(411, 247.4142, 1990.2548, 17.5043, 0.0000, -1, -1, 100);
	CreateVehicle(420, 53.2630, 2063.6521, 17.1672, -84.0000, -1, -1, 100);
	CreateVehicle(420, 65.5371, 2064.3616, 17.1672, -84.0000, -1, -1, 100);
	CreateVehicle(420, 76.6982, 2064.8743, 17.1672, -84.0000, -1, -1, 100);
	CreateVehicle(431, 30.3388, 2005.0697, 17.8995, 0.0000, -1, -1, 100);
	CreateVehicle(431, 29.1612, 2021.7300, 17.8995, 0.0000, -1, -1, 100);
	CreateVehicle(431, 19.6765, 1998.4723, 17.8995, 0.0000, -1, -1, 100);
	CreateVehicle(431, 13.1094, 1998.0641, 17.8995, 0.0000, -1, -1, 100);
	CreateVehicle(431, 6.7815, 1997.7599, 17.8995, 0.0000, -1, -1, 100);
	CreateVehicle(431, 1.3815, 2011.7421, 17.8995, 0.0000, -1, -1, 100);
	CreateVehicle(431, 1.4268, 2025.1942, 17.8995, 0.0000, -1, -1, 100);
	CreateVehicle(411, 117.3150, 1775.0261, 17.7586, 0.0000, -1, -1, 100);
	CreateVehicle(411, 146.1783, 1770.0719, 17.7586, 0.0000, -1, -1, 100);
	CreateVehicle(411, 176.0983, 1768.1757, 17.7586, 0.0000, -1, -1, 100);
	CreateVehicle(411, 205.5250, 1769.9843, 17.7586, 0.0000, -1, -1, 100);
	CreateVehicle(456, 271.9351, 1733.3783, 17.8930, 0.0000, -1, -1, 100);
	CreateVehicle(456, 266.5342, 1735.3475, 17.8930, 0.0000, -1, -1, 100);
	CreateVehicle(456, 260.6173, 1737.5433, 17.8930, 0.0000, -1, -1, 100);
	CreateVehicle(462, 288.3112, 1740.3156, 17.3969, 0.0000, -1, -1, 100);
	CreateVehicle(462, 288.3501, 1710.3931, 17.3969, 0.0000, -1, -1, 100);
	CreateVehicle(462, 288.0224, 1681.3816, 17.3969, 0.0000, -1, -1, 100);
	CreateVehicle(462, 288.3150, 1769.0029, 17.3969, 0.0000, -1, -1, 100);
	CreateVehicle(554, 231.1501, 1985.6398, 18.0066, 0.0000, -1, -1, 100);
	CreateVehicle(554, 226.5517, 1985.7064, 18.0066, 0.0000, -1, -1, 100);
	CreateVehicle(554, 213.0722, 1974.2811, 18.0066, 0.0000, -1, -1, 100);
	CreateVehicle(554, 208.2542, 1973.7181, 18.0066, 0.0000, -1, -1, 100);
	CreateVehicle(578, 220.6829, 1976.9214, 18.3318, 0.0000, -1, -1, 100);
	CreateVehicle(578, 224.4118, 1977.0017, 18.3318, 0.9600, -1, -1, 100);
	CreateVehicle(578, 209.5086, 1989.0176, 18.3318, -62.0000, -1, -1, 100);
	CreateVehicle(578, 209.6232, 1994.2456, 18.3318, -62.0000, -1, -1, 100);
	CreateVehicle(578, 209.2128, 1999.4395, 18.3318, -62.0000, -1, -1, 100);
	CreateDynamicObject(3472, 284.86, 1794.15, 16.58,   0.00, 0.00, 0.00);
	CreateDynamicObject(3472, 297.54, 1786.16, 16.58,   0.00, 0.00, 0.00);
	CreateDynamicObject(3472, 302.21, 1820.61, 16.58,   0.00, 0.00, 0.00);
	CreateDynamicObject(3472, 301.97, 1852.88, 16.58,   0.00, 0.00, 0.00);
	CreateDynamicObject(3463, 302.20, 1957.82, 16.71,   0.00, 0.00, 0.00);
	CreateDynamicObject(3463, 342.15, 1957.07, 16.71,   0.00, 0.00, 0.00);
	CreateDynamicObject(3463, 302.18, 2007.51, 16.71,   0.00, 0.00, 0.00);
	////////////////////////////ДРАГ 3///////////////////////////////////
	CreateDynamicObject(8150, 2702.47, 1423.92, 8.23,   0.00, 0.00, -90.00);
	CreateDynamicObject(8150, 2702.40, 1547.02, 8.23,   0.00, 0.00, -90.00);
	CreateDynamicObject(8150, 2702.46, 1670.08, 8.23,   0.00, 0.00, -90.00);
	CreateDynamicObject(8150, 2702.48, 1793.13, 8.23,   0.00, 0.00, -90.00);
	CreateDynamicObject(8150, 2702.34, 1916.27, 8.23,   0.00, 0.00, -90.00);
	CreateDynamicObject(8150, 2732.90, 1914.95, 8.23,   0.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2732.89, 1791.83, 8.23,   0.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2733.07, 1668.65, 8.23,   0.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2733.11, 1545.27, 8.23,   0.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2732.96, 1424.35, 8.23,   0.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2729.82, 1424.26, 12.01,   -90.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2723.09, 1424.18, 12.01,   -90.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2716.39, 1424.16, 12.01,   -90.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2710.45, 1424.14, 12.01,   -90.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2706.65, 1424.10, 12.01,   -90.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2706.29, 1524.31, 12.01,   -90.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2712.52, 1524.89, 12.01,   -90.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2718.40, 1524.91, 12.01,   -90.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2724.02, 1524.87, 12.01,   -90.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2730.07, 1524.66, 12.01,   -90.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2730.02, 1647.48, 12.01,   -90.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2723.60, 1647.51, 12.01,   -90.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2717.05, 1647.51, 12.01,   -90.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2710.96, 1647.50, 12.01,   -90.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2706.10, 1647.54, 12.01,   -90.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2706.62, 1769.32, 12.01,   -90.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2713.30, 1769.31, 12.01,   -90.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2720.18, 1769.34, 12.01,   -90.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2726.23, 1769.33, 12.01,   -90.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2730.11, 1769.25, 12.01,   -90.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2730.02, 1889.56, 12.01,   -90.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2723.45, 1889.99, 12.01,   -90.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2717.05, 1890.11, 12.01,   -90.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2711.12, 1890.14, 12.01,   -90.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2706.37, 1890.18, 12.01,   -90.00, 0.00, 90.00);
	CreateDynamicObject(1237, 2702.67, 1361.06, 5.64,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, 2702.67, 1361.06, 6.77,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, 2702.67, 1361.06, 7.80,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, 2702.67, 1361.06, 8.84,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, 2702.67, 1361.06, 10.01,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, 2702.67, 1361.06, 10.94,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, 2702.76, 1361.18, 11.76,   90.00, 0.00, 90.00);
	CreateDynamicObject(1237, 2703.79, 1361.19, 11.76,   90.00, 0.00, 90.00);
	CreateDynamicObject(1237, 2704.91, 1361.18, 11.76,   90.00, 0.00, 90.00);
	CreateDynamicObject(1237, 2705.93, 1361.20, 11.76,   90.00, 0.00, 90.00);
	CreateDynamicObject(1237, 2707.00, 1361.21, 11.76,   90.00, 0.00, 90.00);
	CreateDynamicObject(1237, 2708.06, 1361.21, 11.76,   90.00, 0.00, 90.00);
	CreateDynamicObject(1237, 2709.05, 1361.20, 11.76,   90.00, 0.00, 90.00);
	CreateDynamicObject(1237, 2710.12, 1361.16, 11.76,   90.00, 0.00, 90.00);
	CreateDynamicObject(1237, 2711.19, 1361.17, 11.76,   90.00, 0.00, 90.00);
	CreateDynamicObject(1237, 2712.24, 1361.21, 11.76,   90.00, 0.00, 90.00);
	CreateDynamicObject(1237, 2713.24, 1361.21, 11.76,   90.00, 0.00, 90.00);
	CreateDynamicObject(1237, 2714.27, 1361.23, 11.76,   90.00, 0.00, 90.00);
	CreateDynamicObject(1237, 2715.38, 1361.24, 11.76,   90.00, 0.00, 90.00);
	CreateDynamicObject(1237, 2716.42, 1361.25, 11.76,   90.00, 0.00, 90.00);
	CreateDynamicObject(1237, 2717.46, 1361.23, 11.76,   90.00, 0.00, 90.00);
	CreateDynamicObject(1237, 2718.50, 1361.22, 11.76,   90.00, 0.00, 90.00);
	CreateDynamicObject(1237, 2719.56, 1361.22, 11.76,   90.00, 0.00, 90.00);
	CreateDynamicObject(1237, 2720.60, 1361.21, 11.76,   90.00, 0.00, 90.00);
	CreateDynamicObject(1237, 2721.68, 1361.19, 11.76,   90.00, 0.00, 90.00);
	CreateDynamicObject(1237, 2722.70, 1361.22, 11.76,   90.00, 0.00, 90.00);
	CreateDynamicObject(1237, 2721.68, 1361.19, 11.76,   90.00, 0.00, 90.00);
	CreateDynamicObject(1237, 2723.76, 1361.21, 11.76,   90.00, 0.00, 89.64);
	CreateDynamicObject(1237, 2724.83, 1361.19, 11.76,   90.00, 0.00, 89.64);
	CreateDynamicObject(1237, 2725.88, 1361.13, 11.76,   90.00, 0.00, 89.64);
	CreateDynamicObject(1237, 2726.92, 1361.14, 11.76,   90.00, 0.00, 89.64);
	CreateDynamicObject(1237, 2727.97, 1361.08, 11.76,   90.00, 0.00, 89.64);
	CreateDynamicObject(1237, 2728.99, 1361.04, 11.76,   90.00, 0.00, 89.64);
	CreateDynamicObject(1237, 2730.01, 1361.06, 11.76,   90.00, 0.00, 89.52);
	CreateDynamicObject(1237, 2731.08, 1361.07, 11.76,   90.00, 0.00, 89.52);
	CreateDynamicObject(1237, 2731.79, 1361.08, 11.76,   90.00, 0.00, 89.52);
	CreateDynamicObject(1237, 2732.67, 1361.15, 5.64,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, 2732.67, 1361.15, 6.79,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, 2732.67, 1361.15, 7.86,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, 2732.67, 1361.15, 8.92,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, 2732.67, 1361.15, 9.99,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, 2732.67, 1361.15, 10.94,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, 2717.51, 1361.11, 5.64,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, 2717.51, 1361.11, 6.64,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, 2717.51, 1361.11, 7.66,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, 2717.51, 1361.11, 8.74,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, 2717.51, 1361.11, 9.74,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, 2717.51, 1361.11, 10.76,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, 2717.49, 1378.48, 7.21,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, 2717.47, 1404.08, 7.21,   0.00, 0.00, 0.06);
	CreateDynamicObject(982, 2717.50, 1429.69, 7.21,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, 2717.55, 1455.36, 7.21,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, 2717.48, 1494.02, 7.21,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, 2717.51, 1519.67, 7.21,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, 2717.52, 1545.34, 7.21,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, 2717.53, 1570.96, 7.21,   0.00, 0.00, 0.00);
	CreateDynamicObject(3281, 2717.73, 1603.89, 6.50,   0.00, 0.00, 90.00);
	CreateDynamicObject(3281, 2717.71, 1607.51, 6.50,   0.00, 0.00, 90.00);
	CreateDynamicObject(3281, 2717.72, 1611.12, 6.50,   0.00, 0.00, 90.00);
	CreateDynamicObject(3281, 2717.74, 1614.68, 6.50,   0.00, 0.00, 90.00);
	CreateDynamicObject(3281, 2717.75, 1618.27, 6.50,   0.00, 0.00, 90.00);
	CreateDynamicObject(3281, 2717.75, 1621.85, 6.50,   0.00, 0.00, 90.00);
	CreateDynamicObject(3281, 2717.78, 1625.46, 6.50,   0.00, 0.00, 90.00);
	CreateDynamicObject(3281, 2717.78, 1629.08, 6.50,   0.00, 0.00, 90.00);
	CreateDynamicObject(3281, 2717.78, 1632.65, 6.50,   0.00, 0.00, 90.00);
	CreateDynamicObject(3281, 2717.80, 1636.27, 6.50,   0.00, 0.00, 90.00);
	CreateDynamicObject(3281, 2717.80, 1639.90, 6.50,   0.00, 0.00, 90.00);
	CreateDynamicObject(3281, 2717.81, 1643.47, 6.50,   0.00, 0.00, 90.00);
	CreateDynamicObject(8171, 2717.51, 1430.22, 5.74,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, 2717.50, 1568.42, 5.74,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, 2717.51, 1705.97, 5.74,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, 2717.49, 1844.12, 5.74,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, 2717.72, 1982.30, 5.74,   0.00, 0.00, 0.00);
	CreateDynamicObject(8150, 2732.96, 2038.16, 4.74,   0.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2702.76, 2041.19, 4.74,   0.00, 0.00, -90.00);
	CreateDynamicObject(8150, 2729.81, 2038.20, 8.85,   -90.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2723.03, 2038.22, 8.85,   -90.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2716.56, 2038.23, 8.85,   -90.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2710.80, 2038.21, 8.85,   -90.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2706.75, 2038.21, 8.85,   -90.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2702.65, 2161.35, 4.74,   0.00, 0.00, -90.00);
	CreateDynamicObject(8150, 2732.88, 2161.30, 4.74,   0.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2729.72, 2161.27, 8.85,   -90.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2722.99, 2161.32, 8.85,   -90.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2716.66, 2161.42, 8.85,   -90.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2722.99, 2161.32, 8.85,   -90.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2710.58, 2161.41, 8.85,   -90.00, 0.00, 90.00);
	CreateDynamicObject(8150, 2705.81, 2161.45, 8.85,   -90.00, 0.00, 90.00);
	CreateDynamicObject(1237, 2702.94, 2224.51, 5.67,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, 2702.94, 2224.51, 6.73,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, 2702.94, 2224.51, 7.70,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, 2703.09, 2224.76, 8.56,   90.00, 0.00, 90.00);
	CreateDynamicObject(1237, 2704.13, 2224.75, 8.56,   90.00, 0.00, 90.00);
	CreateDynamicObject(1237, 2705.08, 2224.73, 8.56,   90.00, 0.00, 90.30);
	CreateDynamicObject(1237, 2706.11, 2224.73, 8.56,   90.00, 0.00, 90.30);
	CreateDynamicObject(1237, 2707.25, 2224.71, 8.56,   90.00, 0.00, 90.30);
	CreateDynamicObject(1237, 2708.37, 2224.70, 8.56,   90.00, 0.00, 90.30);
	CreateDynamicObject(1237, 2709.52, 2224.70, 8.56,   90.00, 0.00, 90.30);
	CreateDynamicObject(1237, 2710.56, 2224.67, 8.56,   90.00, 0.00, 90.30);
	CreateDynamicObject(1237, 2711.65, 2224.69, 8.56,   90.00, 0.00, 90.30);
	CreateDynamicObject(1237, 2712.80, 2224.74, 8.56,   90.00, 0.00, 90.30);
	CreateDynamicObject(1237, 2713.85, 2224.68, 8.56,   90.00, 0.00, 90.30);
	CreateDynamicObject(1237, 2715.27, 2224.73, 8.56,   90.00, 0.00, 90.30);
	CreateDynamicObject(1237, 2715.98, 2224.70, 8.56,   90.00, 0.00, 90.30);
	CreateDynamicObject(1237, 2714.91, 2224.72, 8.56,   90.00, 0.00, 90.30);
	CreateDynamicObject(1237, 2717.06, 2224.69, 8.56,   90.00, 0.00, 90.30);
	CreateDynamicObject(1237, 2718.13, 2224.63, 8.56,   90.00, 0.00, 90.30);
	CreateDynamicObject(1237, 2719.29, 2224.58, 8.56,   90.00, 0.00, 90.30);
	CreateDynamicObject(1237, 2720.33, 2224.53, 8.56,   90.00, 0.00, 90.30);
	CreateDynamicObject(1237, 2721.45, 2224.50, 8.56,   90.00, 0.00, 90.30);
	CreateDynamicObject(1237, 2722.53, 2224.46, 8.56,   90.00, 0.00, 90.30);
	CreateDynamicObject(1237, 2723.61, 2224.47, 8.56,   90.00, 0.00, 90.30);
	CreateDynamicObject(1237, 2724.71, 2224.47, 8.56,   90.00, 0.00, 90.30);
	CreateDynamicObject(1237, 2725.73, 2224.44, 8.56,   90.00, 0.00, 90.30);
	CreateDynamicObject(1237, 2726.91, 2224.44, 8.56,   90.00, 0.00, 90.30);
	CreateDynamicObject(1237, 2728.07, 2224.47, 8.56,   90.00, 0.00, 90.30);
	CreateDynamicObject(1237, 2729.14, 2224.46, 8.56,   90.00, 0.00, 90.30);
	CreateDynamicObject(1237, 2730.31, 2224.49, 8.56,   90.00, 0.00, 90.30);
	CreateDynamicObject(1237, 2731.39, 2224.46, 8.56,   90.00, 0.00, 90.36);
	CreateDynamicObject(1237, 2732.62, 2224.41, 5.67,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, 2732.62, 2224.41, 6.72,   0.00, 0.00, 0.00);
	CreateDynamicObject(1237, 2732.62, 2224.41, 7.65,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, 2717.75, 2120.29, 5.74,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, 2717.75, 2258.39, 5.74,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, 2720.94, 1975.30, 8.38,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, 2708.96, 1975.29, 8.38,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, 2702.74, 1975.32, 8.38,   0.00, 0.00, -0.12);
	CreateDynamicObject(987, 2708.96, 1975.29, 8.38,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, 2702.31, 1963.34, 12.21,   90.00, 0.00, 90.00);
	CreateDynamicObject(987, 2707.01, 1963.36, 12.21,   90.00, 0.00, 90.00);
	CreateDynamicObject(987, 2711.68, 1963.34, 12.21,   90.00, 0.00, 90.00);
	CreateDynamicObject(987, 2716.48, 1963.40, 12.21,   90.00, 0.00, 90.06);
	CreateDynamicObject(987, 2711.68, 1963.34, 12.21,   90.00, 0.00, 90.00);
	CreateDynamicObject(987, 2721.23, 1963.41, 12.21,   90.00, 0.00, 90.06);
	CreateDynamicObject(987, 2725.09, 1963.39, 12.21,   90.00, 0.00, 90.06);
	CreateDynamicObject(987, 2727.77, 1963.46, 12.21,   90.00, 0.00, 90.06);
	CreateDynamicObject(16092, 2725.28, 1361.93, 3.63,   0.00, 0.00, 90.00);
	CreateDynamicObject(16092, 2710.03, 1361.92, 3.63,   0.00, 0.00, 90.00);
	CreateDynamicObject(1262, 2709.25, 1361.04, 10.75,   0.00, 0.00, 180.00);
	CreateDynamicObject(1262, 2710.69, 1361.04, 10.75,   0.00, 0.00, 180.00);
	CreateDynamicObject(1262, 2709.99, 1361.02, 10.75,   0.00, 0.00, 180.00);
	CreateDynamicObject(1262, 2723.78, 1361.07, 10.75,   0.00, 0.00, 180.00);
	CreateDynamicObject(1262, 2724.57, 1361.09, 10.75,   0.00, 0.00, 180.00);
	CreateDynamicObject(1262, 2725.39, 1361.04, 10.75,   0.00, 0.00, 180.00);
	CreateDynamicObject(982, 2717.49, 1378.48, 8.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, 2717.49, 1378.48, 9.64,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, 2717.49, 1378.48, 10.90,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, 2717.44, 1348.22, 6.20,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, 2702.71, 1348.09, 6.20,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, 2732.52, 1348.29, 6.20,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, 2732.52, 1348.29, 7.45,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, 2732.52, 1348.29, 8.72,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, 2732.52, 1348.29, 9.93,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, 2732.50, 1348.30, 11.16,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, 2717.44, 1348.22, 7.41,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, 2717.44, 1348.22, 8.71,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, 2717.44, 1348.22, 9.95,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, 2717.44, 1348.22, 11.20,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, 2702.71, 1348.09, 7.49,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, 2702.71, 1348.09, 8.78,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, 2702.71, 1348.09, 10.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, 2702.71, 1348.09, 11.23,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, 2702.71, 1348.09, 11.23,   0.00, 0.00, 0.00);
	CreateDynamicObject(982, 2703.29, 1348.09, 11.98,   0.00, 90.00, 0.00);
	CreateDynamicObject(982, 2704.57, 1348.07, 11.98,   0.00, 90.00, 0.00);
	CreateDynamicObject(982, 2705.83, 1348.07, 11.98,   0.00, 90.00, 0.00);
	CreateDynamicObject(982, 2704.57, 1348.07, 11.98,   0.00, 90.00, 0.00);
	CreateDynamicObject(982, 2707.15, 1348.07, 11.98,   0.00, 90.00, 0.00);
	CreateDynamicObject(982, 2708.43, 1348.07, 11.98,   0.00, 90.00, 0.00);
	CreateDynamicObject(982, 2709.68, 1348.06, 11.98,   0.00, 90.00, 0.00);
	CreateDynamicObject(982, 2708.43, 1348.07, 11.98,   0.00, 90.00, 0.00);
	CreateDynamicObject(982, 2710.94, 1348.05, 11.98,   0.00, 90.00, 0.00);
	CreateDynamicObject(982, 2712.21, 1348.05, 11.98,   0.00, 90.00, 0.00);
	CreateDynamicObject(982, 2713.48, 1348.07, 11.98,   0.00, 90.00, 0.00);
	CreateDynamicObject(982, 2714.77, 1348.06, 11.98,   0.00, 90.00, -0.12);
	CreateDynamicObject(982, 2713.48, 1348.07, 11.98,   0.00, 90.00, 0.00);
	CreateDynamicObject(982, 2716.00, 1348.04, 11.98,   0.00, 90.00, -0.12);
	CreateDynamicObject(982, 2717.25, 1348.05, 11.98,   0.00, 90.00, -0.12);
	CreateDynamicObject(982, 2718.50, 1348.03, 11.98,   0.00, 90.00, -0.12);
	CreateDynamicObject(982, 2719.76, 1348.02, 11.98,   0.00, 90.00, -0.12);
	CreateDynamicObject(982, 2721.01, 1347.99, 11.98,   0.00, 90.00, -0.18);
	CreateDynamicObject(982, 2719.76, 1348.02, 11.98,   0.00, 90.00, -0.12);
	CreateDynamicObject(982, 2722.30, 1347.98, 11.98,   0.00, 90.00, -0.18);
	CreateDynamicObject(982, 2719.76, 1348.02, 11.98,   0.00, 90.00, -0.12);
	CreateDynamicObject(982, 2721.01, 1347.99, 11.98,   0.00, 90.00, -0.18);
	CreateDynamicObject(982, 2723.55, 1347.99, 11.98,   0.00, 90.00, -0.18);
	CreateDynamicObject(982, 2719.76, 1348.02, 11.98,   0.00, 90.00, -0.12);
	CreateDynamicObject(982, 2721.01, 1347.99, 11.98,   0.00, 90.00, -0.18);
	CreateDynamicObject(982, 2722.30, 1347.98, 11.98,   0.00, 90.00, -0.18);
	CreateDynamicObject(982, 2724.82, 1347.97, 11.98,   0.00, 90.00, -0.30);
	CreateDynamicObject(982, 2726.07, 1348.00, 11.98,   0.00, 90.00, -0.30);
	CreateDynamicObject(982, 2727.32, 1347.98, 11.98,   0.00, 90.00, -0.30);
	CreateDynamicObject(982, 2728.55, 1347.97, 11.98,   0.00, 90.00, -0.30);
	CreateDynamicObject(982, 2729.83, 1347.97, 11.98,   0.00, 90.00, -0.30);
	CreateDynamicObject(982, 2731.14, 1347.97, 11.98,   0.00, 90.00, -0.30);
	CreateDynamicObject(982, 2732.01, 1347.96, 11.98,   0.00, 90.00, -0.36);
	CreateDynamicObject(982, 2732.54, 1348.29, 11.36,   0.00, 0.00, 0.00);
	//uho
	CreateDynamicObject(18275,-298.66015625,1506.69140625,76.63683319,0.00000000,0.00000000,0.00000000); //object(cw2_mtbfinish) (1)
	CreateDynamicObject(18275,-305.72528076,1506.70825195,76.63101196,0.00000000,0.00000000,0.00000000); //object(cw2_mtbfinish) (2)
	CreateDynamicObject(16092,-300.95996094,1490.24707031,74.00608826,0.00000000,0.00000000,272.75207520); //object(des_pipestrut05) (1)
	CreateDynamicObject(3281,-295.71337891,1504.17248535,75.41996765,0.00000000,355.50000000,270.30029297); //object(mtb_banner1) (1)
	CreateDynamicObject(3281,-295.05929565,1493.37573242,75.62093353,0.00000000,0.00000000,274.28112793); //object(mtb_banner1) (3)
	CreateDynamicObject(3281,-295.53125000,1500.55761719,75.57463074,0.00000000,0.00000000,276.26220703); //object(mtb_banner1) (4)
	CreateDynamicObject(3281,-295.26464844,1496.96777344,75.58135223,0.00000000,0.00000000,272.29614258); //object(mtb_banner1) (5)
	CreateDynamicObject(3281,-294.81097412,1509.16918945,75.58325958,0.00000000,0.00000000,238.32226562); //object(mtb_banner1) (6)
	CreateDynamicObject(3281,-292.51803589,1511.87255859,75.58089447,0.00000000,0.00000000,222.44104004); //object(mtb_banner1) (7)
	CreateDynamicObject(3281,-289.82015991,1514.28417969,75.58325958,0.00000000,0.00000000,222.44018555); //object(mtb_banner1) (8)
	CreateDynamicObject(3281,-284.49981689,1519.08325195,75.58325958,0.00000000,0.00000000,222.44018555); //object(mtb_banner1) (10)
	CreateDynamicObject(3281,-281.82086182,1521.47412109,75.58325958,0.00000000,0.00000000,222.44018555); //object(mtb_banner1) (11)
	CreateDynamicObject(3281,-279.15634155,1523.86181641,75.58325958,0.00000000,0.00000000,222.44018555); //object(mtb_banner1) (12)
	CreateDynamicObject(3281,-276.48980713,1526.24975586,75.58325958,0.00000000,0.00000000,222.44018555); //object(mtb_banner1) (13)
	CreateDynamicObject(3281,-273.85894775,1528.69067383,75.58325958,0.00000000,0.00000000,224.42517090); //object(mtb_banner1) (14)
	CreateDynamicObject(3281,-271.26782227,1531.14843750,75.58325958,0.00000000,0.00000000,224.42321777); //object(mtb_banner1) (15)
	CreateDynamicObject(3281,-287.17089844,1516.69726562,75.58325958,0.00000000,0.00000000,222.44018555); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-347.29992676,1513.06933594,75.53014374,0.00000000,0.00000000,100.76544189); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-347.73181152,1520.22851562,75.58325958,0.00000000,0.00000000,90.83496094); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-347.65716553,1516.63195801,75.58325958,0.00000000,0.00000000,90.83496094); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-348.70828247,1523.58593750,75.58089447,0.00000000,0.00000000,120.69989014); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-349.52719116,1526.91748047,75.45513916,0.00000000,2.00000000,86.81582642); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-349.23638916,1530.50268555,75.38013458,0.00000000,0.00000000,82.84399414); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-347.70013428,1533.47167969,75.38013458,0.00000000,0.00000000,41.11260986); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-309.85531616,1509.01794434,75.58325958,0.00000000,0.00000000,128.22167969); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-312.72845459,1510.85522461,75.58325958,0.00000000,0.00000000,166.07128906); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-316.26821899,1511.25158691,75.58325958,0.00000000,0.00000000,179.96423340); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-319.85263062,1511.22509766,75.58325958,0.00000000,0.00000000,179.96154785); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-323.45703125,1511.19726562,75.58325958,0.00000000,0.00000000,179.96154785); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-327.07324219,1511.17089844,75.58325958,0.00000000,0.00000000,179.96154785); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-330.65832520,1511.16699219,75.58325958,0.00000000,0.00000000,179.96154785); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-344.07409668,1549.67932129,75.58325958,0.00000000,0.00000000,359.46618652); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-337.84732056,1511.13354492,75.58325958,0.00000000,0.00000000,179.96154785); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-341.45111084,1511.13073730,75.58325958,0.00000000,0.00000000,179.96154785); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-345.05133057,1511.20495605,75.53325653,0.00000000,0.00000000,176.50659180); //object(mtb_banner1) (9)
	CreateDynamicObject(1348,-345.52774048,1535.52551270,75.26502991,0.00000000,0.00000000,0.00000000); //object(cj_o2tanks) (1)
	CreateDynamicObject(3633,-340.05026245,1548.34460449,75.03730011,0.00000000,0.00000000,0.00000000); //object(imoildrum4_las) (1)
	CreateDynamicObject(3633,-341.34402466,1548.37548828,75.03730011,0.00000000,0.00000000,23.81982422); //object(imoildrum4_las) (2)
	CreateDynamicObject(3633,-340.64022827,1548.28417969,75.98509979,0.00000000,0.00000000,318.04345703); //object(imoildrum4_las) (3)
	CreateDynamicObject(1262,-297.85943604,1491.22204590,81.47664642,0.00000000,0.00000000,0.00000000); //object(mtraffic4) (1)
	CreateDynamicObject(1262,-299.48098755,1491.16906738,81.47664642,0.00000000,0.00000000,0.00000000); //object(mtraffic4) (2)
	CreateDynamicObject(1262,-300.89062500,1491.07617188,81.47664642,0.00000000,0.00000000,0.00000000); //object(mtraffic4) (3)
	CreateDynamicObject(1262,-303.93493652,1490.85498047,81.47664642,0.00000000,0.00000000,0.00000000); //object(mtraffic4) (4)
	CreateDynamicObject(955,-303.33605957,1538.65270996,74.96252441,0.00000000,0.00000000,47.81799316); //object(cj_ext_sprunk) (1)
	CreateDynamicObject(1370,-340.57083130,1548.39465332,77.00170898,0.00000000,0.00000000,0.00000000); //object(cj_flame_drum) (1)
	CreateDynamicObject(1437,-318.16833496,1536.61791992,74.56250000,0.00000000,0.00000000,0.00000000); //object(dyn_ladder_2) (1)
	CreateDynamicObject(1521,-308.50094604,1538.26623535,75.72425842,0.00000000,0.00000000,45.83502197); //object(dyn_scaff2_cover) (1)
	CreateDynamicObject(8674,-333.99966431,1545.30895996,76.02941895,0.00000000,0.00000000,0.00000000); //object(csrsfence02_lvs) (1)
	CreateDynamicObject(8674,-314.30258179,1547.51477051,76.02941895,0.00000000,0.00000000,41.81988525); //object(csrsfence02_lvs) (2)
	CreateDynamicObject(18074,-293.65032959,1541.71313477,74.70201874,0.00000000,0.00000000,44.65478516); //object(donut_rail) (1)
	CreateDynamicObject(18074,-296.32064819,1534.73388672,74.70201874,0.00000000,0.00000000,89.94384766); //object(donut_rail) (2)
	CreateDynamicObject(18074,-306.57043457,1534.70996094,74.70201874,0.00000000,0.00000000,89.93957520); //object(donut_rail) (3)
	CreateDynamicObject(18074,-316.76684570,1534.70349121,74.70201874,0.00000000,0.00000000,89.93957520); //object(donut_rail) (4)
	CreateDynamicObject(18074,-327.03289795,1534.74060059,74.70201874,0.00000000,0.00000000,89.93957520); //object(donut_rail) (5)
	CreateDynamicObject(16151,-299.52160645,1541.57153320,74.88742828,0.00000000,0.00000000,135.56500244); //object(ufo_bar) (1)
	CreateDynamicObject(1432,-298.08212280,1536.39746094,74.56250000,0.00000000,0.00000000,0.00000000); //object(dyn_table_2) (1)
	CreateDynamicObject(1810,-329.81900024,1536.79907227,75.61170959,0.00000000,0.00000000,35.72976685); //object(cj_foldchair) (1)
	CreateDynamicObject(2802,-293.56729126,1538.52587891,74.89276123,0.00000000,0.00000000,0.00000000); //object(castable1) (1)
	CreateDynamicObject(2800,-293.50390625,1538.48828125,75.05368805,0.00000000,0.00000000,0.00000000); //object(castable2top) (1)
	CreateDynamicObject(3506,-292.06921387,1494.22766113,75.03724670,0.00000000,0.00000000,0.00000000); //object(vgsn_nitree_y02) (1)
	CreateDynamicObject(3506,-292.35836792,1503.09875488,74.94295502,0.00000000,0.00000000,0.00000000); //object(vgsn_nitree_y02) (2)
	CreateDynamicObject(3506,-309.61984253,1502.13696289,74.59343719,0.00000000,0.00000000,0.00000000); //object(vgsn_nitree_y02) (3)
	CreateDynamicObject(3506,-308.98599243,1493.70959473,74.74890900,0.00000000,0.00000000,0.00000000); //object(vgsn_nitree_y02) (4)
	CreateDynamicObject(3511,-369.78485107,1477.32263184,62.31079102,0.00000000,0.00000000,0.00000000); //object(vgsn_nitree_b01) (2)
	CreateDynamicObject(2048,-302.17877197,1507.25610352,77.41907501,0.00000000,0.00000000,179.57043457); //object(cj_flag2) (1)
	CreateDynamicObject(7520,-287.17187500,1551.37500000,74.35937500,0.00000000,0.00000000,314.91210938); //object(vgnlowbuild203) (1)
	CreateDynamicObject(3281,-307.23684692,1492.74694824,75.56694031,0.00000000,358.75000000,94.82135010); //object(mtb_banner1) (5)
	CreateDynamicObject(3281,-307.55273438,1496.32617188,75.61750793,0.00000000,358.99475098,94.81201172); //object(mtb_banner1) (5)
	CreateDynamicObject(3281,-307.89883423,1499.89672852,75.55285645,0.00000000,359.49206543,95.56201172); //object(mtb_banner1) (5)
	CreateDynamicObject(3281,-308.32666016,1503.48522949,75.50608063,0.00000000,0.73913574,95.30908203); //object(mtb_banner1) (5)
	CreateDynamicObject(3281,-313.32171631,1561.23681641,75.58325958,0.00000000,0.00000000,128.17150879); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-315.67190552,1563.93457031,75.58325958,0.00000000,0.00000000,133.13641357); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-318.15042114,1566.56030273,75.58325958,0.00000000,0.00000000,133.38232422); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-319.17031860,1569.58496094,75.53014374,0.00000000,0.00000000,79.60461426); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-317.61849976,1572.63159180,75.58325958,0.00000000,0.00000000,45.67645264); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-315.09576416,1575.19799805,75.58325958,0.00000000,0.00000000,44.19067383); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-312.54360962,1577.72924805,75.58325958,0.00000000,0.00000000,44.18701172); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-309.99514771,1580.27453613,75.58325958,0.00000000,0.00000000,44.93701172); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-307.51040649,1582.88854980,75.58325958,0.00000000,0.00000000,46.91906738); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-304.98577881,1585.46325684,75.58325958,0.00000000,0.00000000,43.43212891); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-299.62115479,1583.25561523,75.58355713,0.00000000,0.00000000,314.28906250); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-302.29882812,1585.61621094,75.50514221,0.00000000,0.00000000,321.72363281); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-297.04962158,1580.73291016,75.58446503,0.00000000,0.00000000,316.27087402); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-294.48135376,1578.24169922,75.58589172,0.00000000,0.00000000,314.76892090); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-293.66683960,1575.19299316,75.60514832,0.00000000,0.00000000,254.76562500); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-334.25976562,1511.15625000,75.58325958,0.00000000,0.00000000,179.96154785); //object(mtb_banner1) (9)
	CreateDynamicObject(1238,-311.29766846,1401.69189453,71.41777039,0.00000000,0.00000000,0.00000000); //object(trafficcone) (1)
	CreateDynamicObject(1238,-308.47787476,1401.30957031,71.51658630,0.00000000,0.00000000,0.00000000); //object(trafficcone) (2)
	CreateDynamicObject(1238,-306.17224121,1401.58349609,71.60572815,0.00000000,0.00000000,0.00000000); //object(trafficcone) (3)
	CreateDynamicObject(1238,-304.57519531,1402.35717773,71.62454987,0.00000000,0.00000000,0.00000000); //object(trafficcone) (4)
	CreateDynamicObject(1238,-303.44628906,1403.33886719,71.61802673,0.00000000,0.00000000,0.00000000); //object(trafficcone) (5)
	CreateDynamicObject(1238,-302.47079468,1405.00268555,71.60337067,0.00000000,0.00000000,0.00000000); //object(trafficcone) (6)
	CreateDynamicObject(1238,-309.98339844,1401.49865723,71.46446228,0.00000000,0.00000000,0.00000000); //object(trafficcone) (7)
	CreateDynamicObject(1238,-307.39743042,1401.42321777,71.58328247,0.00000000,0.00000000,0.00000000); //object(trafficcone) (8)
	CreateDynamicObject(1238,-301.95220947,1406.49523926,71.59165955,0.00000000,0.00000000,0.00000000); //object(trafficcone) (9)
	CreateDynamicObject(1238,-301.48696899,1407.99841309,71.57765198,0.00000000,0.00000000,0.00000000); //object(trafficcone) (10)
	CreateDynamicObject(1238,-312.04092407,1402.69970703,71.12748718,0.00000000,0.00000000,0.00000000); //object(trafficcone) (11)
	CreateDynamicObject(1238,-356.70385742,1457.84252930,63.54178238,0.00000000,0.00000000,0.00000000); //object(trafficcone) (12)
	CreateDynamicObject(1238,-360.32919312,1458.51147461,63.25307846,0.00000000,0.00000000,0.00000000); //object(trafficcone) (13)
	CreateDynamicObject(1238,-364.08627319,1458.38598633,62.80887604,0.00000000,0.00000000,0.00000000); //object(trafficcone) (14)
	CreateDynamicObject(1238,-367.40560913,1457.78125000,62.26379395,0.00000000,0.00000000,0.00000000); //object(trafficcone) (15)
	CreateDynamicObject(1238,-369.09280396,1457.04553223,61.90884018,0.00000000,0.00000000,0.00000000); //object(trafficcone) (16)
	CreateDynamicObject(1238,-370.51928711,1456.20166016,61.59343338,0.00000000,0.00000000,0.00000000); //object(trafficcone) (17)
	CreateDynamicObject(1238,-371.61541748,1455.25988770,61.32390976,0.00000000,0.00000000,0.00000000); //object(trafficcone) (18)
	CreateDynamicObject(1238,-373.55221558,1450.08618164,60.84804153,0.00000000,0.00000000,0.00000000); //object(trafficcone) (19)
	CreateDynamicObject(1238,-372.19976807,1445.53833008,60.60423279,0.00000000,0.00000000,0.00000000); //object(trafficcone) (20)
	CreateDynamicObject(1238,-372.65026855,1447.05224609,60.68487167,0.00000000,0.00000000,0.00000000); //object(trafficcone) (21)
	CreateDynamicObject(1238,-373.09408569,1448.56518555,60.76591110,0.00000000,0.00000000,0.00000000); //object(trafficcone) (22)
	CreateDynamicObject(1238,-358.55770874,1458.18041992,63.38511276,0.00000000,0.00000000,0.00000000); //object(trafficcone) (23)
	CreateDynamicObject(1238,-362.36608887,1458.44543457,62.99996185,0.00000000,0.00000000,0.00000000); //object(trafficcone) (24)
	CreateDynamicObject(1238,-365.69049072,1458.11608887,62.57028580,0.00000000,0.00000000,0.00000000); //object(trafficcone) (25)
	CreateDynamicObject(1238,-373.24926758,1451.65930176,60.91929626,0.00000000,0.00000000,0.00000000); //object(trafficcone) (28)
	CreateDynamicObject(1238,-372.34451294,1454.10998535,61.14151382,0.00000000,0.00000000,0.00000000); //object(trafficcone) (29)
	CreateDynamicObject(1238,-372.85577393,1453.02905273,60.98354721,0.00000000,0.00000000,0.00000000); //object(trafficcone) (30)
	CreateDynamicObject(1238,-329.39895630,1322.10058594,51.89086914,0.00000000,0.00000000,0.00000000); //object(trafficcone) (31)
	CreateDynamicObject(1238,-371.72949219,1443.81738281,60.50957108,0.00000000,0.00000000,0.00000000); //object(trafficcone) (32)
	CreateDynamicObject(1238,-328.11041260,1322.81518555,52.25366974,0.00000000,0.00000000,0.00000000); //object(trafficcone) (33)
	CreateDynamicObject(1238,-326.30532837,1325.41882324,52.92094421,0.00000000,0.00000000,0.00000000); //object(trafficcone) (34)
	CreateDynamicObject(1238,-332.28628540,1322.19812012,51.35661697,0.00000000,0.00000000,0.00000000); //object(trafficcone) (35)
	CreateDynamicObject(1238,-335.69729614,1323.56030273,50.88260651,0.00000000,0.00000000,0.00000000); //object(trafficcone) (36)
	CreateDynamicObject(1238,-326.00503540,1328.94506836,53.30167770,0.00000000,0.00000000,0.00000000); //object(trafficcone) (37)
	CreateDynamicObject(1238,-326.12808228,1327.07495117,53.09842300,0.00000000,0.00000000,0.00000000); //object(trafficcone) (38)
	CreateDynamicObject(1238,-333.83752441,1322.79479980,51.13758850,0.00000000,0.00000000,0.00000000); //object(trafficcone) (39)
	CreateDynamicObject(1238,-327.03396606,1324.01550293,52.59884262,0.00000000,0.00000000,0.00000000); //object(trafficcone) (40)
	CreateDynamicObject(1238,-330.85299683,1322.02929688,51.60293198,0.00000000,0.00000000,0.00000000); //object(trafficcone) (41)
	CreateDynamicObject(1238,-433.55151367,1451.01379395,33.34466171,0.00000000,0.00000000,0.00000000); //object(trafficcone) (43)
	CreateDynamicObject(1238,-436.10742188,1452.08984375,33.26166153,0.00000000,0.00000000,0.00000000); //object(trafficcone) (44)
	CreateDynamicObject(1238,-434.90014648,1451.56420898,33.31760788,0.00000000,0.00000000,0.00000000); //object(trafficcone) (45)
	CreateDynamicObject(1238,-432.25537109,1451.71862793,33.41331100,0.00000000,0.00000000,0.00000000); //object(trafficcone) (46)
	CreateDynamicObject(1238,-430.88641357,1452.47460938,33.48628616,0.00000000,0.00000000,0.00000000); //object(trafficcone) (47)
	CreateDynamicObject(1238,-436.43325806,1453.54992676,33.27788925,0.00000000,0.00000000,0.00000000); //object(trafficcone) (48)
	CreateDynamicObject(1238,-437.19372559,1456.64465332,33.30741501,0.00000000,0.00000000,0.00000000); //object(trafficcone) (49)
	CreateDynamicObject(1238,-400.29016113,1902.53637695,57.31188965,0.00000000,0.00000000,0.00000000); //object(trafficcone) (51)
	CreateDynamicObject(1238,-403.93176270,1907.43969727,57.60702515,0.00000000,0.00000000,0.00000000); //object(trafficcone) (52)
	CreateDynamicObject(1238,-409.40554810,1910.27319336,57.41780472,0.00000000,0.00000000,0.00000000); //object(trafficcone) (53)
	CreateDynamicObject(1238,-415.64929199,1910.55676270,57.13519669,0.00000000,0.00000000,0.00000000); //object(trafficcone) (54)
	CreateDynamicObject(1238,-421.33706665,1908.06237793,57.08816147,0.00000000,0.00000000,0.00000000); //object(trafficcone) (55)
	CreateDynamicObject(1238,-424.89614868,1903.28442383,57.62464905,0.00000000,0.00000000,0.00000000); //object(trafficcone) (56)
	CreateDynamicObject(1238,-418.50796509,1909.47607422,57.08755875,0.00000000,0.00000000,0.00000000); //object(trafficcone) (57)
	CreateDynamicObject(1238,-423.16458130,1905.91491699,57.31736374,0.00000000,0.00000000,0.00000000); //object(trafficcone) (58)
	CreateDynamicObject(1238,-412.35983276,1910.48120117,57.28153229,0.00000000,0.00000000,0.00000000); //object(trafficcone) (59)
	CreateDynamicObject(1238,-406.59384155,1908.89697266,57.50628281,0.00000000,0.00000000,0.00000000); //object(trafficcone) (60)
	CreateDynamicObject(1238,-402.01910400,1904.92077637,57.45523453,0.00000000,0.00000000,0.00000000); //object(trafficcone) (61)
	CreateDynamicObject(1238,-399.03387451,1893.89611816,56.20718765,0.00000000,0.00000000,0.00000000); //object(trafficcone) (62)
	CreateDynamicObject(1238,-399.67669678,1898.24267578,56.76612091,0.00000000,0.00000000,0.00000000); //object(trafficcone) (63)
	CreateDynamicObject(1238,-426.48330688,1895.30554199,58.94201279,0.00000000,0.00000000,0.00000000); //object(trafficcone) (64)
	CreateDynamicObject(1238,-425.71325684,1899.62854004,58.23505402,0.00000000,0.00000000,0.00000000); //object(trafficcone) (65)
	CreateDynamicObject(1238,-430.37969971,1783.12072754,70.69570923,0.00000000,0.00000000,0.00000000); //object(trafficcone) (66)
	CreateDynamicObject(1238,-431.71026611,1777.13940430,71.34028625,0.00000000,0.00000000,0.00000000); //object(trafficcone) (67)
	CreateDynamicObject(1238,-436.80703735,1771.08947754,71.53797913,0.00000000,0.00000000,0.00000000); //object(trafficcone) (68)
	CreateDynamicObject(1238,-527.05456543,2002.74621582,59.73812866,0.00000000,0.00000000,0.00000000); //object(trafficcone) (69)
	CreateDynamicObject(1238,-451.13449097,1766.49035645,71.55716705,0.00000000,0.00000000,0.00000000); //object(trafficcone) (70)
	CreateDynamicObject(1238,-456.03814697,1769.22827148,71.98884583,0.00000000,0.00000000,0.00000000); //object(trafficcone) (71)
	CreateDynamicObject(1238,-458.74462891,1772.25891113,72.50803375,0.00000000,0.00000000,0.00000000); //object(trafficcone) (72)
	CreateDynamicObject(1238,-459.73846436,1776.53552246,72.96438599,0.00000000,0.00000000,0.00000000); //object(trafficcone) (73)
	CreateDynamicObject(1238,-453.71557617,1767.79284668,71.75901794,0.00000000,0.00000000,0.00000000); //object(trafficcone) (74)
	CreateDynamicObject(1238,-447.82394409,1766.57067871,71.52941895,0.00000000,0.00000000,0.00000000); //object(trafficcone) (75)
	CreateDynamicObject(1238,-441.80725098,1768.47485352,71.52555084,0.00000000,0.00000000,0.00000000); //object(trafficcone) (76)
	CreateDynamicObject(1238,-439.27508545,1769.70812988,71.52587891,0.00000000,0.00000000,0.00000000); //object(trafficcone) (77)
	CreateDynamicObject(1238,-434.65783691,1773.20605469,71.44698334,0.00000000,0.00000000,0.00000000); //object(trafficcone) (78)
	CreateDynamicObject(1238,-432.93698120,1775.22180176,71.38320160,0.00000000,0.00000000,0.00000000); //object(trafficcone) (79)
	CreateDynamicObject(1238,-431.15081787,1779.08801270,71.11286926,0.00000000,0.00000000,0.00000000); //object(trafficcone) (80)
	CreateDynamicObject(1238,-430.60595703,1781.17114258,70.88894653,0.00000000,0.00000000,0.00000000); //object(trafficcone) (81)
	CreateDynamicObject(1238,-457.43310547,1770.67724609,72.23572540,0.00000000,0.00000000,0.00000000); //object(trafficcone) (82)
	CreateDynamicObject(1238,-459.36911011,1774.47863770,72.74475098,0.00000000,0.00000000,0.00000000); //object(trafficcone) (83)
	CreateDynamicObject(1238,-1211.80053711,1807.81652832,40.89518356,0.00000000,0.00000000,0.00000000); //object(trafficcone) (89)
	CreateDynamicObject(1238,-1209.61621094,1807.55664062,40.91867065,0.00000000,0.00000000,0.00000000); //object(trafficcone) (90)
	CreateDynamicObject(1238,-1211.63452148,1809.34960938,40.94654846,0.00000000,0.00000000,0.00000000); //object(trafficcone) (91)
	CreateDynamicObject(1238,-1211.42053223,1811.12500000,41.02624130,0.00000000,0.00000000,0.00000000); //object(trafficcone) (92)
	CreateDynamicObject(1238,-1207.70178223,1807.26257324,40.94733810,0.00000000,0.00000000,0.00000000); //object(trafficcone) (93)
	CreateDynamicObject(1238,-1190.58312988,1830.55126953,41.01932144,0.00000000,0.00000000,0.00000000); //object(trafficcone) (95)
	CreateDynamicObject(1238,-1191.72229004,1830.01513672,41.03623199,0.00000000,0.00000000,0.00000000); //object(trafficcone) (96)
	CreateDynamicObject(1238,-1192.79980469,1829.21398926,41.04127884,0.00000000,0.00000000,0.00000000); //object(trafficcone) (97)
	CreateDynamicObject(1238,-1190.01586914,1829.13305664,40.96241760,0.00000000,0.00000000,0.00000000); //object(trafficcone) (98)
	CreateDynamicObject(1238,-1189.31250000,1827.64270020,40.90253067,0.00000000,0.00000000,0.00000000); //object(trafficcone) (99)
	CreateDynamicObject(1238,-1188.62414551,1826.00805664,40.89189148,0.00000000,0.00000000,0.00000000); //object(trafficcone) (100)
	CreateDynamicObject(1238,-1188.07287598,1824.27575684,40.92687225,0.00000000,0.00000000,0.00000000); //object(trafficcone) (101)
	CreateDynamicObject(3578,-429.32812500,1454.16601562,34.07686234,0.00000000,356.49536133,23.81835938); //object(dockbarr1_la) (1)
	CreateDynamicObject(3578,-436.34008789,1457.77343750,33.81765366,0.00000000,0.74536133,282.22351074); //object(dockbarr1_la) (2)
	CreateDynamicObject(3578,-437.81076050,1428.20043945,32.84934235,0.00000000,357.75000000,14.03009033); //object(dockbarr1_la) (3)
	CreateDynamicObject(3578,-429.19854736,1434.15551758,33.75029373,0.00000000,355.25000000,53.90954590); //object(dockbarr1_la) (4)
	CreateDynamicObject(3578,-445.09082031,1432.61511230,32.97794342,0.00000000,1.74780273,284.69982910); //object(dockbarr1_la) (5)
	CreateDynamicObject(1238,-429.48495483,1452.95617676,33.57000351,0.00000000,0.00000000,0.00000000); //object(trafficcone) (103)
	CreateDynamicObject(1238,-428.12054443,1453.21142578,33.62733078,0.00000000,0.00000000,0.00000000); //object(trafficcone) (104)
	CreateDynamicObject(1238,-426.84774780,1453.47521973,33.68293762,0.00000000,0.00000000,0.00000000); //object(trafficcone) (105)
	CreateDynamicObject(1238,-425.47671509,1453.76086426,33.74296188,0.00000000,0.00000000,0.00000000); //object(trafficcone) (106)
	CreateDynamicObject(1238,-424.17297363,1454.01867676,33.79889297,0.00000000,0.00000000,0.00000000); //object(trafficcone) (107)
	CreateDynamicObject(1238,-422.62829590,1454.08483887,33.89249802,0.00000000,0.00000000,0.00000000); //object(trafficcone) (108)
	CreateDynamicObject(1238,-421.29013062,1454.09790039,33.98566055,0.00000000,0.00000000,0.00000000); //object(trafficcone) (109)
	CreateDynamicObject(1238,-419.79193115,1454.10351562,34.08933640,0.00000000,0.00000000,0.00000000); //object(trafficcone) (110)
	CreateDynamicObject(1238,-418.38388062,1454.17663574,34.19150162,0.00000000,0.00000000,0.00000000); //object(trafficcone) (111)
	CreateDynamicObject(3578,-422.10681152,1460.37500000,34.67202377,0.00000000,356.49536133,57.69839478); //object(dockbarr1_la) (6)
	CreateDynamicObject(3578,-434.83615112,1467.08325195,34.05897903,0.00000000,357.73986816,60.19470215); //object(dockbarr1_la) (7)
	CreateDynamicObject(1238,-436.75683594,1454.81835938,33.28911209,0.00000000,0.00000000,0.00000000); //object(trafficcone) (113)
	CreateDynamicObject(1238,-437.63140869,1458.34191895,33.32217026,0.00000000,0.00000000,0.00000000); //object(trafficcone) (114)
	CreateDynamicObject(1238,-437.89251709,1459.99133301,33.34994507,0.00000000,0.00000000,0.00000000); //object(trafficcone) (115)
	CreateDynamicObject(1238,-438.18371582,1462.16882324,33.36187744,0.00000000,0.00000000,0.00000000); //object(trafficcone) (116)
	CreateDynamicObject(1238,-438.42718506,1463.99743652,33.37202835,0.00000000,0.00000000,0.00000000); //object(trafficcone) (117)
	CreateDynamicObject(1238,-438.57431030,1465.70275879,33.39130783,0.00000000,0.00000000,0.00000000); //object(trafficcone) (118)
	CreateDynamicObject(1238,-438.80963135,1467.53686523,33.39830780,0.00000000,0.00000000,0.00000000); //object(trafficcone) (119)
	CreateDynamicObject(1238,-439.08215332,1469.69274902,33.41027451,0.00000000,0.00000000,0.00000000); //object(trafficcone) (120)
	CreateDynamicObject(1238,-425.74859619,1439.56115723,33.72985077,0.00000000,0.00000000,0.00000000); //object(trafficcone) (121)
	CreateDynamicObject(1238,-427.58889771,1438.27734375,33.70862961,0.00000000,0.00000000,0.00000000); //object(trafficcone) (122)
	CreateDynamicObject(1238,-429.40188599,1435.89672852,33.64023972,0.00000000,0.00000000,0.00000000); //object(trafficcone) (123)
	CreateDynamicObject(1238,-428.48941040,1437.13330078,33.67520142,0.00000000,0.00000000,0.00000000); //object(trafficcone) (124)
	CreateDynamicObject(1238,-446.39178467,1438.80383301,32.75362778,0.00000000,0.00000000,0.00000000); //object(trafficcone) (125)
	CreateDynamicObject(1238,-421.79278564,1441.26171875,34.02425766,0.00000000,0.00000000,0.00000000); //object(trafficcone) (126)
	CreateDynamicObject(1238,-419.65194702,1441.43920898,34.37467957,0.00000000,0.00000000,0.00000000); //object(trafficcone) (127)
	CreateDynamicObject(1238,-417.76818848,1440.95617676,34.78400803,0.00000000,0.00000000,0.00000000); //object(trafficcone) (128)
	CreateDynamicObject(1238,-414.79553223,1439.19726562,35.54006195,0.00000000,0.00000000,0.00000000); //object(trafficcone) (129)
	CreateDynamicObject(1238,-416.10882568,1440.00976562,35.21606445,0.00000000,0.00000000,0.00000000); //object(trafficcone) (130)
	CreateDynamicObject(1238,-413.63998413,1438.05017090,35.81256485,0.00000000,0.00000000,0.00000000); //object(trafficcone) (131)
	CreateDynamicObject(1238,-412.67709351,1436.92333984,36.05952072,0.00000000,0.00000000,0.00000000); //object(trafficcone) (132)
	CreateDynamicObject(1238,-411.76757812,1435.45019531,36.27731705,0.00000000,0.00000000,0.00000000); //object(trafficcone) (133)
	CreateDynamicObject(1238,-423.92285156,1440.61328125,33.79348755,0.00000000,0.00000000,0.00000000); //object(trafficcone) (135)
	CreateDynamicObject(1238,-446.80999756,1440.65014648,32.81198502,0.00000000,0.00000000,0.00000000); //object(trafficcone) (136)
	CreateDynamicObject(1238,-447.19412231,1442.30053711,32.86558914,0.00000000,0.00000000,0.00000000); //object(trafficcone) (137)
	CreateDynamicObject(1238,-447.65939331,1444.23071289,32.93051529,0.00000000,0.00000000,0.00000000); //object(trafficcone) (138)
	CreateDynamicObject(1238,-448.15689087,1446.34899902,32.99994278,0.00000000,0.00000000,0.00000000); //object(trafficcone) (139)
	CreateDynamicObject(1238,-448.58569336,1448.49731445,33.08581543,0.00000000,0.00000000,0.00000000); //object(trafficcone) (140)
	CreateDynamicObject(1238,-448.95828247,1450.51098633,33.16319656,0.00000000,0.00000000,0.00000000); //object(trafficcone) (141)
	CreateDynamicObject(1238,-449.34552002,1452.41711426,33.24046707,0.00000000,0.00000000,0.00000000); //object(trafficcone) (142)
	CreateDynamicObject(3578,-522.73980713,2001.16076660,60.23957443,0.00000000,359.98681641,322.43408203); //object(dockbarr1_la) (8)
	CreateDynamicObject(3578,-514.32421875,1995.70214844,60.18918991,0.00000000,0.47790527,332.44628906); //object(dockbarr1_la) (9)
	CreateDynamicObject(3578,-504.90646362,1994.46887207,60.08264923,0.00000000,359.73132324,12.14599609); //object(dockbarr1_la) (10)
	CreateDynamicObject(3578,-496.08386230,1998.59436035,60.13920212,0.00000000,359.73083496,38.17547607); //object(dockbarr1_la) (11)
	CreateDynamicObject(1238,-444.40625000,1767.14453125,71.52536011,0.00000000,0.00000000,0.00000000); //object(trafficcone) (144)
	CreateDynamicObject(1238,-524.42028809,2000.85986328,59.75047302,0.00000000,0.00000000,0.00000000); //object(trafficcone) (145)
	CreateDynamicObject(1238,-522.08728027,1999.15576172,59.72750092,0.00000000,0.00000000,0.00000000); //object(trafficcone) (146)
	CreateDynamicObject(1238,-519.77947998,1997.42724609,59.71958923,0.00000000,0.00000000,0.00000000); //object(trafficcone) (147)
	CreateDynamicObject(1238,-517.24133301,1995.81286621,59.71449661,0.00000000,0.00000000,0.00000000); //object(trafficcone) (148)
	CreateDynamicObject(1238,-514.77441406,1994.52050781,59.69995880,0.00000000,0.00000000,0.00000000); //object(trafficcone) (149)
	CreateDynamicObject(1238,-511.63690186,1993.28576660,59.69192505,0.00000000,0.00000000,0.00000000); //object(trafficcone) (150)
	CreateDynamicObject(1238,-507.92877197,1992.88989258,59.70600510,0.00000000,0.00000000,0.00000000); //object(trafficcone) (151)
	CreateDynamicObject(1238,-505.17623901,1993.16784668,59.70940781,0.00000000,0.00000000,0.00000000); //object(trafficcone) (152)
	CreateDynamicObject(1238,-502.82858276,1993.66870117,59.70271301,0.00000000,0.00000000,0.00000000); //object(trafficcone) (153)
	CreateDynamicObject(1238,-500.35690308,1994.64855957,59.70284271,0.00000000,0.00000000,0.00000000); //object(trafficcone) (154)
	CreateDynamicObject(1238,-498.16323853,1995.96630859,59.69703293,0.00000000,0.00000000,0.00000000); //object(trafficcone) (155)
	CreateDynamicObject(1238,-496.11715698,1997.45837402,59.70262146,0.00000000,0.00000000,0.00000000); //object(trafficcone) (156)
	CreateDynamicObject(1238,-494.03836060,1999.16101074,59.69540787,0.00000000,0.00000000,0.00000000); //object(trafficcone) (157)
	CreateDynamicObject(1238,-491.70294189,2000.94079590,59.68320847,0.00000000,0.00000000,0.00000000); //object(trafficcone) (158)
	CreateDynamicObject(1238,-386.63052368,2066.59008789,60.68178940,0.00000000,0.00000000,0.00000000); //object(trafficcone) (159)
	CreateDynamicObject(1238,-386.14294434,2062.94238281,60.79083633,0.00000000,0.00000000,0.00000000); //object(trafficcone) (160)
	CreateDynamicObject(1238,-386.42501831,2064.87451172,60.73772812,0.00000000,0.00000000,0.00000000); //object(trafficcone) (161)
	CreateDynamicObject(1238,-387.88049316,2068.47143555,60.71331406,0.00000000,0.00000000,0.00000000); //object(trafficcone) (162)
	CreateDynamicObject(1238,-389.20748901,2070.44140625,60.74465942,0.00000000,0.00000000,0.00000000); //object(trafficcone) (163)
	CreateDynamicObject(1238,-391.40258789,2071.92871094,60.84858322,0.00000000,0.00000000,0.00000000); //object(trafficcone) (164)
	CreateDynamicObject(1238,-393.96002197,2073.52563477,60.97150803,0.00000000,0.00000000,0.00000000); //object(trafficcone) (165)
	CreateDynamicObject(1238,-396.15493774,2074.01269531,61.06187057,0.00000000,0.00000000,0.00000000); //object(trafficcone) (166)
	CreateDynamicObject(1238,-398.24783325,2074.44824219,61.15090942,0.00000000,0.00000000,0.00000000); //object(trafficcone) (167)
	CreateDynamicObject(1238,-400.32510376,2074.07934570,61.20795059,0.00000000,0.00000000,0.00000000); //object(trafficcone) (168)
	CreateDynamicObject(1238,-387.09399414,2060.92822266,60.97390366,0.00000000,0.00000000,0.00000000); //object(trafficcone) (169)
	CreateDynamicObject(1238,-388.18667603,2058.68041992,61.18070602,0.00000000,0.00000000,0.00000000); //object(trafficcone) (170)
	CreateDynamicObject(1238,-402.39727783,2072.38623047,61.18371964,0.00000000,0.00000000,0.00000000); //object(trafficcone) (171)
	CreateDynamicObject(3578,-1206.24963379,1807.83032227,41.39677811,0.00000000,359.00000000,348.09008789); //object(dockbarr1_la) (12)
	CreateDynamicObject(3578,-1189.46313477,1824.96166992,41.29677200,0.00000000,358.99475098,111.69689941); //object(dockbarr1_la) (13)
	CreateDynamicObject(1238,-1190.09997559,1805.26232910,40.57626724,0.00000000,0.00000000,0.00000000); //object(trafficcone) (173)
	CreateDynamicObject(1238,-1188.79541016,1805.61743164,40.49301910,0.00000000,0.00000000,0.00000000); //object(trafficcone) (174)
	CreateDynamicObject(1238,-1187.65368652,1806.46533203,40.28964615,0.00000000,0.00000000,0.00000000); //object(trafficcone) (175)
	CreateDynamicObject(1238,-1186.72534180,1807.30383301,40.18196487,0.00000000,0.00000000,0.00000000); //object(trafficcone) (176)
	CreateDynamicObject(1238,-1186.48571777,1808.56909180,40.22687149,0.00000000,0.00000000,0.00000000); //object(trafficcone) (177)
	CreateDynamicObject(3578,-1196.17871094,1806.01074219,41.42924500,0.00000000,358.99475098,350.06835938); //object(dockbarr1_la) (14)
	CreateDynamicObject(3578,-1187.10168457,1815.17883301,40.84790421,0.00000000,355.74475098,95.76757812); //object(dockbarr1_la) (15)
	CreateDynamicObject(3666,-1190.07800293,1806.05383301,41.06153488,0.00000000,0.00000000,0.00000000); //object(airuntest_las) (1)
	CreateDynamicObject(3666,-1188.27099609,1807.09741211,40.84122086,0.00000000,0.00000000,0.00000000); //object(airuntest_las) (2)
	CreateDynamicObject(3666,-1187.36889648,1809.07434082,40.81756210,0.00000000,0.00000000,0.00000000); //object(airuntest_las) (3)
	CreateDynamicObject(3578,-1203.14025879,1814.94702148,41.49678421,0.00000000,359.99279785,41.22232056); //object(dockbarr1_la) (16)
	CreateDynamicObject(3578,-1175.04187012,1825.85009766,41.07067108,0.50000000,358.49279785,103.42221069); //object(dockbarr1_la) (17)
	CreateDynamicObject(1238,-1173.47851562,1808.95251465,40.09241867,0.00000000,0.00000000,0.00000000); //object(trafficcone) (180)
	CreateDynamicObject(1238,-1173.42248535,1807.76098633,40.05176544,0.00000000,0.00000000,0.00000000); //object(trafficcone) (181)
	CreateDynamicObject(1238,-1172.73461914,1806.57019043,39.85988617,0.00000000,0.00000000,0.00000000); //object(trafficcone) (182)
	CreateDynamicObject(1238,-1171.93237305,1805.40686035,39.66891479,0.00000000,0.00000000,0.00000000); //object(trafficcone) (183)
	CreateDynamicObject(1238,-1170.75915527,1804.95959473,39.59871674,0.00000000,0.00000000,0.00000000); //object(trafficcone) (184)
	CreateDynamicObject(1238,-1169.22302246,1804.50878906,39.50703812,0.00000000,0.00000000,0.00000000); //object(trafficcone) (185)
	CreateDynamicObject(3881,-1195.17529297,1823.60461426,42.57031250,0.00000000,0.00000000,312.18017578); //object(airsecbooth_sfse) (1)
	CreateDynamicObject(8877,-1208.39782715,1811.22241211,46.81303024,0.00000000,0.00000000,69.97027588); //object(vgsecnstrct10) (1)
	CreateDynamicObject(8877,-1198.69726562,1819.81933594,46.81303024,0.00000000,0.00000000,107.81433105); //object(vgsecnstrct10) (2)
	CreateDynamicObject(3578,-1173.50683594,1815.43652344,40.81965256,0.00000000,357.98950195,93.01025391); //object(dockbarr1_la) (18)
	CreateDynamicObject(3578,-1203.35485840,1838.27185059,41.42177963,0.00000000,0.73913574,33.28073120); //object(dockbarr1_la) (19)
	CreateDynamicObject(3578,-1194.16320801,1842.53369141,41.29151154,0.00000000,0.73913574,15.41265869); //object(dockbarr1_la) (20)
	CreateDynamicObject(3578,-1184.74316406,1841.82324219,41.26271439,0.00000000,359.48913574,335.61840820); //object(dockbarr1_la) (21)
	CreateDynamicObject(3666,-1212.03503418,1830.52209473,41.44337082,0.00000000,0.00000000,0.00000000); //object(airuntest_las) (5)
	CreateDynamicObject(3666,-1210.59130859,1832.02478027,41.44337082,0.00000000,0.00000000,0.00000000); //object(airuntest_las) (6)
	CreateDynamicObject(3666,-1208.97546387,1833.67419434,41.44337082,0.00000000,0.00000000,0.00000000); //object(airuntest_las) (7)
	CreateDynamicObject(3666,-1179.40209961,1837.99792480,41.23948669,0.00000000,0.00000000,0.00000000); //object(airuntest_las) (8)
	CreateDynamicObject(3666,-1178.10937500,1835.35314941,41.19092178,0.00000000,0.00000000,0.00000000); //object(airuntest_las) (9)
	CreateDynamicObject(3666,-1177.09582520,1832.98876953,41.11936951,0.00000000,0.00000000,0.00000000); //object(airuntest_las) (10)
	CreateDynamicObject(3666,-1172.51855469,1808.61279297,40.48425293,0.00000000,0.00000000,0.00000000); //object(airuntest_las) (12)
	CreateDynamicObject(3666,-1171.57922363,1806.35681152,40.23564529,0.00000000,0.00000000,0.00000000); //object(airuntest_las) (13)
	CreateDynamicObject(3666,-1169.52856445,1805.42651367,40.20518112,0.00000000,0.00000000,0.00000000); //object(airuntest_las) (14)
	CreateDynamicObject(3578,-1150.32690430,1792.72509766,40.18971252,0.00000000,356.23901367,7.60571289); //object(dockbarr1_la) (22)
	CreateDynamicObject(3578,-1181.04907227,1791.79663086,40.34969711,0.00000000,1.98852539,0.60424805); //object(dockbarr1_la) (23)
	CreateDynamicObject(3578,-1170.84960938,1791.89453125,39.98836136,0.00000000,1.98852539,0.60424805); //object(dockbarr1_la) (24)
	CreateDynamicObject(3578,-1160.59375000,1791.99804688,39.82629395,0.00000000,359.73632812,0.60424805); //object(dockbarr1_la) (25)
	CreateDynamicObject(3578,-1223.08886719,1816.34436035,41.33303070,0.00000000,358.48608398,73.11254883); //object(dockbarr1_la) (26)
	CreateDynamicObject(3578,-1224.66125488,1806.36364746,41.11954880,0.00000000,359.23388672,88.98846436); //object(dockbarr1_la) (27)
	CreateDynamicObject(3578,-1220.79089355,1798.47851562,41.11045456,359.25000000,1.22839355,143.47875977); //object(dockbarr1_la) (28)
	CreateDynamicObject(3666,-1215.59838867,1795.38378906,41.18933105,0.00000000,0.00000000,0.00000000); //object(airuntest_las) (16)
	CreateDynamicObject(3666,-1213.91845703,1795.08068848,41.21792984,0.00000000,0.00000000,0.00000000); //object(airuntest_las) (17)
	CreateDynamicObject(3666,-1212.31701660,1794.85754395,41.23337936,0.00000000,0.00000000,0.00000000); //object(airuntest_las) (18)
	CreateDynamicObject(3666,-1187.27478027,1792.02880859,40.54842377,0.00000000,0.00000000,0.00000000); //object(airuntest_las) (19)
	CreateDynamicObject(3666,-1188.79711914,1792.07104492,40.64556503,0.00000000,0.00000000,0.00000000); //object(airuntest_las) (20)
	CreateDynamicObject(3666,-1190.38842773,1792.12390137,40.73072052,0.00000000,0.00000000,0.00000000); //object(airuntest_las) (21)
	CreateDynamicObject(3666,-1144.30712891,1793.39733887,40.14059448,0.00000000,0.00000000,0.00000000); //object(airuntest_las) (22)
	CreateDynamicObject(3666,-1142.94299316,1793.59289551,40.22418594,0.00000000,0.00000000,0.00000000); //object(airuntest_las) (23)
	CreateDynamicObject(3666,-1141.56884766,1793.82983398,40.30499268,0.00000000,0.00000000,0.00000000); //object(airuntest_las) (24)
	CreateDynamicObject(3578,-1163.35729980,1805.08544922,39.80556870,0.00000000,359.73852539,3.07421875); //object(dockbarr1_la) (29)
	CreateDynamicObject(3666,-1157.32666016,1805.33874512,39.83976364,0.00000000,0.00000000,0.00000000); //object(airuntest_las) (26)
	CreateDynamicObject(3666,-1155.82202148,1805.44335938,39.86398697,0.00000000,0.00000000,0.00000000); //object(airuntest_las) (27)
	CreateDynamicObject(3666,-1154.69860840,1805.51696777,39.88013840,0.00000000,0.00000000,0.00000000); //object(airuntest_las) (28)
	CreateDynamicObject(1238,-1153.82324219,1805.11962891,39.50153732,0.00000000,0.00000000,0.00000000); //object(trafficcone) (187)
	CreateDynamicObject(1238,-1152.62561035,1805.18664551,39.51382446,0.00000000,0.00000000,0.00000000); //object(trafficcone) (188)
	CreateDynamicObject(1238,-1151.46472168,1805.38085938,39.55514526,0.00000000,0.00000000,0.00000000); //object(trafficcone) (189)
	CreateDynamicObject(1238,-1211.43981934,1794.95190430,41.00743484,0.00000000,0.00000000,0.00000000); //object(trafficcone) (190)
	CreateDynamicObject(1238,-1210.66503906,1794.14379883,41.14223480,0.00000000,0.00000000,0.00000000); //object(trafficcone) (191)
	CreateDynamicObject(1238,-1209.83471680,1793.07165527,41.29706955,0.00000000,0.00000000,0.00000000); //object(trafficcone) (192)
	CreateDynamicObject(1238,-1191.21972656,1791.87658691,40.63012314,0.00000000,0.00000000,0.00000000); //object(trafficcone) (194)
	CreateDynamicObject(1238,-1192.47326660,1791.43811035,40.78544617,0.00000000,0.00000000,0.00000000); //object(trafficcone) (195)
	CreateDynamicObject(1238,-1193.82189941,1790.99511719,40.94126892,0.00000000,0.00000000,0.00000000); //object(trafficcone) (196)
	CreateDynamicObject(1238,-1196.22619629,1790.87792969,41.04587555,0.00000000,0.00000000,0.00000000); //object(trafficcone) (197)
	CreateDynamicObject(1238,-1198.01354980,1791.22045898,41.09123230,0.00000000,0.00000000,0.00000000); //object(trafficcone) (198)
	CreateDynamicObject(1238,-1199.75390625,1791.54931641,41.13541031,0.00000000,0.00000000,0.00000000); //object(trafficcone) (199)
	CreateDynamicObject(1238,-1201.63012695,1791.83752441,41.18321228,0.00000000,0.00000000,0.00000000); //object(trafficcone) (200)
	CreateDynamicObject(1238,-1203.67065430,1792.24743652,41.23494339,0.00000000,0.00000000,0.00000000); //object(trafficcone) (201)
	CreateDynamicObject(1238,-1205.69091797,1792.57214355,41.28638077,0.00000000,0.00000000,0.00000000); //object(trafficcone) (202)
	CreateDynamicObject(1238,-1207.79577637,1792.90185547,41.32258987,0.00000000,0.00000000,0.00000000); //object(trafficcone) (203)
	CreateDynamicObject(16337,-311.55902100,1505.95104980,74.57015228,0.00000000,0.00000000,1.98498535); //object(des_cranecontrol) (1)
	CreateDynamicObject(3281,-309.35354614,1325.44799805,54.31383133,0.00000000,1.75000000,263.51110840); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-308.95117188,1329.04003906,54.40844727,0.00000000,1.24694824,263.50708008); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-317.88067627,1310.51647949,53.45265198,0.00000000,3.24694824,211.80712891); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-309.77441406,1321.89746094,54.13737488,0.00000000,4.24694824,263.50708008); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-311.02734375,1318.69726562,53.97315979,0.00000000,2.74658203,233.72863770); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-313.16210938,1315.79980469,53.77481842,0.00000000,2.74658203,233.72863770); //object(mtb_banner1) (9)
	CreateDynamicObject(3281,-315.29101562,1312.90917969,53.60891342,0.00000000,2.74658203,233.72863770); //object(mtb_banner1) (9)
	CreateDynamicObject(3877,-307.36523438,1402.62597656,71.06864929,0.00000000,0.00000000,7.93762207); //object(sf_rooflite) (1)
	CreateDynamicObject(3877,-304.97265625,1388.14843750,73.13910675,0.00000000,0.00000000,7.93212891); //object(sf_rooflite) (2)
	CreateDynamicObject(3877,-368.18917847,1456.16052246,63.31073761,0.00000000,0.00000000,27.78753662); //object(sf_rooflite) (3)
	CreateDynamicObject(3877,-374.93087769,1468.71411133,63.14639282,0.00000000,0.00000000,27.78442383); //object(sf_rooflite) (4)
	CreateDynamicObject(3877,-328.87109375,1323.66699219,53.61922836,0.00000000,0.00000000,27.77893066); //object(sf_rooflite) (6)
	CreateDynamicObject(3877,-412.68835449,1908.95458984,58.72234344,0.00000000,0.00000000,9.91949463); //object(sf_rooflite) (7)
	CreateDynamicObject(3877,-847.36132812,1820.80432129,60.81600189,0.00000000,0.00000000,9.91516113); //object(sf_rooflite) (8)
	CreateDynamicObject(3877,-390.88085938,2070.38671875,62.23809052,0.00000000,0.00000000,9.91516113); //object(sf_rooflite) (9)
	CreateDynamicObject(1262,-295.58764648,1507.24853516,76.91493225,0.00000000,0.00000000,0.00000000); //object(mtraffic4) (3)
	CreateDynamicObject(1262,-302.66888428,1507.29016113,76.13655090,0.00000000,0.00000000,0.00000000); //object(mtraffic4) (3)
	CreateDynamicObject(1262,-301.57421875,1507.27343750,76.11489105,0.00000000,0.00000000,0.00000000); //object(mtraffic4) (3)
	CreateDynamicObject(1262,-308.69650269,1507.26525879,76.97837830,0.00000000,0.00000000,0.00000000); //object(mtraffic4) (3)
	CreateDynamicObject(3877,-446.07519531,1768.00976562,72.94361115,0.00000000,0.00000000,9.91516113); //object(sf_rooflite) (8)
	CreateDynamicObject(3877,-939.33984375,1791.21313477,60.92319107,0.00000000,0.00000000,9.91516113); //object(sf_rooflite) (8)
	CreateDynamicObject(3877,-928.68487549,1804.89440918,61.43984985,0.00000000,0.00000000,9.91516113); //object(sf_rooflite) (8)
	CreateDynamicObject(3877,-865.02722168,1825.70458984,61.53115845,0.00000000,0.00000000,9.91516113); //object(sf_rooflite) (8)
	CreateDynamicObject(1262,-302.50683594,1490.99804688,81.49121094,0.00000000,0.00000000,0.00000000); //object(mtraffic4) (4)
	CreateDynamicObject(3877,-424.33273315,1439.34069824,35.12869644,0.00000000,0.00000000,27.77343750); //object(sf_rooflite) (6)
	CreateDynamicObject(3877,-436.23208618,1462.43627930,34.88134003,0.00000000,0.00000000,27.77893066); //object(sf_rooflite) (6)
	CreateDynamicObject(3877,-434.13494873,1453.46398926,34.75504303,0.00000000,0.00000000,27.77893066); //object(sf_rooflite) (6)
	CreateDynamicObject(3877,-425.24005127,1457.25317383,35.38695908,0.00000000,0.00000000,27.77893066); //object(sf_rooflite) (6)
	CreateDynamicObject(3877,-528.98156738,1988.35778809,61.05636597,0.00000000,0.00000000,55.70391846); //object(sf_rooflite) (6)
	CreateDynamicObject(1238,-527.30340576,1987.25964355,59.70880508,0.00000000,0.00000000,0.00000000); //object(trafficcone) (149)
	CreateDynamicObject(1238,-525.23895264,1986.18078613,59.70880508,0.00000000,0.00000000,0.00000000); //object(trafficcone) (149)
	CreateDynamicObject(1238,-523.03851318,1985.22106934,59.70880508,0.00000000,0.00000000,0.00000000); //object(trafficcone) (149)
	CreateDynamicObject(1238,-520.37188721,1984.39160156,59.70880508,0.00000000,0.00000000,0.00000000); //object(trafficcone) (149)
	CreateDynamicObject(3877,-379.62057495,2084.28173828,61.55606842,0.00000000,0.00000000,9.91516113); //object(sf_rooflite) (9)
	CreateDynamicObject(621,-295.53952026,1370.91113281,68.22042847,0.00000000,0.00000000,0.00000000); //object(veg_palm02) (1)
	CreateDynamicObject(621,-315.51074219,1383.60351562,69.99920654,0.00000000,0.00000000,0.00000000); //object(veg_palm02) (2)
	CreateDynamicObject(621,-343.27966309,1309.76293945,44.97257233,0.00000000,0.00000000,0.00000000); //object(veg_palm02) (3)
	CreateDynamicObject(621,-316.47247314,1343.30993652,49.95304108,0.00000000,0.00000000,0.00000000); //object(veg_palm02) (4)
	CreateDynamicObject(621,-431.61810303,1459.88183594,32.43209457,0.00000000,0.00000000,0.00000000); //object(veg_palm02) (5)
	CreateDynamicObject(621,-428.97116089,1429.00268555,31.81048203,0.00000000,0.00000000,0.00000000); //object(veg_palm02) (6)
	CreateDynamicObject(621,-385.32354736,1751.18444824,42.03387451,0.00000000,0.00000000,0.00000000); //object(veg_palm02) (7)
	CreateDynamicObject(621,-444.47207642,1873.98876953,60.19545746,0.00000000,0.00000000,0.00000000); //object(veg_palm02) (8)
	CreateDynamicObject(621,-474.89385986,1762.97558594,71.22278595,0.00000000,0.00000000,0.00000000); //object(veg_palm02) (9)
	CreateDynamicObject(621,-492.08099365,1940.06262207,85.02601624,0.00000000,0.00000000,0.00000000); //object(veg_palm02) (10)
	CreateDynamicObject(621,-521.00421143,2005.40417480,57.17543030,0.00000000,0.00000000,0.00000000); //object(veg_palm02) (11)
	CreateDynamicObject(621,-504.16714478,1997.29846191,59.07496643,0.00000000,0.00000000,0.00000000); //object(veg_palm02) (12)
	CreateDynamicObject(621,-861.78454590,1846.04089355,58.81469727,0.00000000,0.00000000,0.00000000); //object(veg_palm02) (13)
	CreateDynamicObject(621,-1146.67846680,1789.87744141,37.65126801,0.00000000,0.00000000,0.00000000); //object(veg_palm02) (14)
	CreateDynamicObject(621,-953.76660156,1789.92871094,59.59924316,0.00000000,0.00000000,0.00000000); //object(veg_palm02) (16)
	CreateDynamicObject(621,-1191.36242676,1816.72058105,40.08773804,0.00000000,0.00000000,0.00000000); //object(veg_palm02) (17)
	CreateDynamicObject(621,-465.06176758,1632.40600586,37.96423340,0.00000000,0.00000000,0.00000000); //object(veg_palm02) (18)
	CreateDynamicObject(3877,-304.94192505,1403.70166016,71.06864929,0.00000000,0.00000000,41.19763184); //object(sf_rooflite) (1)
	CreateDynamicObject(3877,-297.26113892,1390.92309570,73.15921021,0.00000000,0.00000000,39.69213867); //object(sf_rooflite) (2)
	CreateDynamicObject(1238,-296.34167480,1391.78161621,71.80731201,0.00000000,0.00000000,0.00000000); //object(trafficcone) (5)
	CreateDynamicObject(1238,-299.74359131,1389.87988281,71.80529785,0.00000000,0.00000000,0.00000000); //object(trafficcone) (5)
	CreateDynamicObject(1238,-300.93270874,1389.31774902,71.80473328,0.00000000,0.00000000,0.00000000); //object(trafficcone) (5)
	CreateDynamicObject(1238,-302.09606934,1388.82727051,71.79910278,0.00000000,0.00000000,0.00000000); //object(trafficcone) (5)
	CreateDynamicObject(1238,-306.67926025,1388.08142090,71.76097107,0.00000000,0.00000000,0.00000000); //object(trafficcone) (5)
	CreateDynamicObject(3877,-292.17950439,1396.24768066,73.13610840,0.00000000,0.00000000,61.52310181); //object(sf_rooflite) (2)
	CreateDynamicObject(1238,-298.62402344,1390.43652344,71.80345917,0.00000000,0.00000000,0.00000000); //object(trafficcone) (5)
	CreateDynamicObject(1238,-295.47668457,1392.58569336,71.80329132,0.00000000,0.00000000,0.00000000); //object(trafficcone) (5)
	CreateDynamicObject(1238,-294.63513184,1393.41345215,71.79621124,0.00000000,0.00000000,0.00000000); //object(trafficcone) (5)
	CreateDynamicObject(1238,-293.74603271,1394.24108887,71.79283905,0.00000000,0.00000000,0.00000000); //object(trafficcone) (5)
	CreateDynamicObject(1238,-292.87374878,1395.19189453,71.78670502,0.00000000,0.00000000,0.00000000); //object(trafficcone) (5)
	CreateDynamicObject(3877,-312.93441772,1388.06091309,73.04767609,0.00000000,0.00000000,354.04263306); //object(sf_rooflite) (2)
	CreateDynamicObject(1238,-303.31445312,1388.49707031,71.79511261,0.00000000,0.00000000,0.00000000); //object(trafficcone) (5)
	CreateDynamicObject(1238,-308.31988525,1388.02124023,71.74224854,0.00000000,0.00000000,0.00000000); //object(trafficcone) (5)
	CreateDynamicObject(1238,-309.71313477,1387.93469238,71.73980713,0.00000000,0.00000000,0.00000000); //object(trafficcone) (5)
	CreateDynamicObject(1238,-311.14431763,1387.88061523,71.73245239,0.00000000,0.00000000,0.00000000); //object(trafficcone) (5)
	CreateDynamicObject(3877,-418.40933228,1439.77856445,35.98358917,0.00000000,0.00000000,27.77343750); //object(sf_rooflite) (6)
	CreateDynamicObject(3877,-413.63034058,1436.82849121,37.40474701,0.00000000,0.00000000,27.77343750); //object(sf_rooflite) (6)
	CreateDynamicObject(3877,-384.72830200,1363.85253906,46.30185699,0.00000000,0.00000000,27.77343750); //object(sf_rooflite) (6)
	CreateDynamicObject(3877,-381.35388184,1357.90637207,47.10634995,0.00000000,0.00000000,27.77343750); //object(sf_rooflite) (6)
	CreateDynamicObject(3877,-378.06384277,1351.73547363,47.77257156,0.00000000,0.00000000,27.77343750); //object(sf_rooflite) (6)
	CreateDynamicObject(3877,-375.07989502,1345.40417480,48.28903198,0.00000000,0.00000000,27.77343750); //object(sf_rooflite) (6)
	CreateDynamicObject(1238,-375.60992432,1346.56201172,46.94561386,0.00000000,0.00000000,0.00000000); //object(trafficcone) (133)
	CreateDynamicObject(1238,-376.23016357,1347.92248535,46.83348846,0.00000000,0.00000000,0.00000000); //object(trafficcone) (133)
	CreateDynamicObject(1238,-376.91149902,1349.22839355,46.70853043,0.00000000,0.00000000,0.00000000); //object(trafficcone) (133)
	CreateDynamicObject(1238,-377.60449219,1350.42443848,46.58018494,0.00000000,0.00000000,0.00000000); //object(trafficcone) (133)
	CreateDynamicObject(1238,-378.69189453,1352.94714355,46.38490677,0.00000000,0.00000000,0.00000000); //object(trafficcone) (133)
	CreateDynamicObject(1238,-379.25885010,1354.11096191,46.28165817,0.00000000,0.00000000,0.00000000); //object(trafficcone) (133)
	CreateDynamicObject(1238,-380.02178955,1355.27270508,46.13888931,0.00000000,0.00000000,0.00000000); //object(trafficcone) (133)
	CreateDynamicObject(1238,-380.66461182,1356.49621582,46.00544739,0.00000000,0.00000000,0.00000000); //object(trafficcone) (133)
	CreateDynamicObject(1238,-382.09490967,1359.04357910,45.67333221,0.00000000,0.00000000,0.00000000); //object(trafficcone) (133)
	CreateDynamicObject(1238,-382.73245239,1360.12292480,45.52886200,0.00000000,0.00000000,0.00000000); //object(trafficcone) (133)
	CreateDynamicObject(1238,-383.37261963,1361.20678711,45.38379288,0.00000000,0.00000000,0.00000000); //object(trafficcone) (133)
	CreateDynamicObject(1238,-384.01354980,1362.39440918,45.23203659,0.00000000,0.00000000,0.00000000); //object(trafficcone) (133)
	CreateDynamicObject(1238,-386.21295166,1365.00341797,44.80448532,0.00000000,0.00000000,0.00000000); //object(trafficcone) (133)
	CreateDynamicObject(1238,-387.56280518,1365.90478516,44.58656693,0.00000000,0.00000000,0.00000000); //object(trafficcone) (133)
	CreateDynamicObject(1238,-389.02658081,1366.71411133,44.36094284,0.00000000,0.00000000,0.00000000); //object(trafficcone) (133)
	CreateDynamicObject(1238,-374.63354492,1343.92321777,47.11741638,0.00000000,0.00000000,0.00000000); //object(trafficcone) (133)
	CreateDynamicObject(1238,-374.79373169,1342.55847168,47.07221222,0.00000000,0.00000000,0.00000000); //object(trafficcone) (133)
	CreateDynamicObject(1238,-375.11560059,1341.15759277,46.99407959,0.00000000,0.00000000,0.00000000); //object(trafficcone) (133)
	//тут была база
	CreateObject(8171, -147.45, 1807.90, 103.00,   0.00, 0.00, 0.00);
	CreateObject(8171, -266.91, 1808.57, 103.00,   0.00, 0.00, 0.00);
	CreateObject(3485, -282.54, 1998.91, 110.00,   0.00, 0.00, 0.00);
	CreateObject(3485, -142.74, 1921.51, 110.00,   0.00, 0.00, 180.00);
	CreateObject(16644, -6791.13, -214.75, 113.70,   0.00, 40.00, -90.00);
	CreateObject(16644, -6228.28, 475.51, 92.55,   0.00, 40.00, -90.00);
	CreateObject(16613, -2661.81, 11222.05, 1734.00,   0.00, 0.00, 0.00);
	CreateObject(16613, -497.02, 120.42, 103.00,   0.00, 0.00, 0.00);
	CreateObject(8171, -226.95, 1808.57, 103.00,   0.00, 0.00, 0.00);
	CreateObject(7806, -174.69, 1773.68, 103.00,   0.00, 0.00, 0.00);
	CreateObject(7832, -9991.53, 1032.74, 109.00,   0.00, 0.00, 0.00);
	CreateObject(8171, -187.13, 1808.57, 103.00,   0.00, 0.00, 0.00);
	CreateObject(18449, -303.58, 1772.18, 102.79,   0.00, 0.00, 90.00);
	CreateObject(0, -282.87, 1856.24, 103.00,   0.00, 0.00, 90.00);
	CreateObject(16147, -190.31, 1565.30, 42.46,   0.00, 0.00, 0.00);
	CreateObject(16147, -190.31, 1565.30, 42.46,   0.00, 0.00, 0.00);
	CreateObject(16147, -190.31, 1565.30, 42.46,   0.00, 0.00, 0.00);
	CreateObject(16147, -190.31, 1565.30, 42.46,   0.00, 0.00, 0.00);
	CreateObject(16147, -190.31, 1565.30, 42.46,   0.00, 0.00, 0.00);
	CreateObject(16147, -190.31, 1565.30, 42.46,   0.00, 0.00, 0.00);
	CreateObject(16147, -190.31, 1565.30, 42.46,   0.00, 0.00, 0.00);
	CreateObject(16147, -190.31, 1565.30, 42.46,   0.00, 0.00, 0.00);
	CreateObject(8171, -306.69, 1808.57, 103.00,   0.00, 0.00, 0.00);
	CreateObject(8171, -306.69, 1946.85, 103.00,   0.00, 0.00, 0.00);
	CreateObject(8171, -266.91, 1946.85, 103.00,   0.00, 0.00, 0.00);
	CreateObject(8171, -226.95, 1946.85, 103.00,   0.00, 0.00, 0.00);
	CreateObject(8171, -187.13, 1946.85, 103.00,   0.00, 0.00, 0.00);
	CreateObject(8171, -147.38, 1946.28, 103.00,   0.00, 0.00, 0.00);
	CreateObject(3485, -252.29, 1998.91, 110.00,   0.00, 0.00, 0.00);
	CreateObject(3485, -212.68, 1998.91, 110.00,   0.00, 0.00, 0.00);
	CreateObject(3485, -172.91, 1998.91, 110.00,   0.00, 0.00, 0.00);
	CreateObject(3485, -142.68, 1998.91, 110.00,   0.00, 0.00, 0.00);
	CreateObject(19868, -190.67, 2015.79, 103.00,   0.00, 0.00, 0.00);
	CreateObject(19868, -195.89, 2015.79, 103.00,   0.00, 0.00, 0.00);
	CreateObject(3485, -172.89, 1921.51, 110.00,   0.00, 0.00, 180.00);
	CreateObject(3485, -142.74, 1887.71, 110.00,   0.00, 0.00, 0.00);
	CreateObject(3485, -173.13, 1854.21, 110.00,   0.00, 0.00, 0.00);
	CreateObject(3485, -203.31, 1854.21, 110.00,   0.00, 0.00, 0.00);
	CreateObject(3485, -235.24, 1885.88, 110.00,   0.00, 0.00, -90.00);
	CreateObject(3485, -235.24, 1916.13, 110.00,   0.00, 0.00, -90.00);
	CreateObject(3485, -202.96, 1933.95, 110.00,   0.00, 0.00, 180.00);
	CreateObject(987, -321.65, 1926.95, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -321.65, 1914.93, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -321.65, 1903.07, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -321.65, 1891.15, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -321.65, 1879.38, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -321.65, 1867.64, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -321.65, 1855.84, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -321.65, 1844.06, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -321.65, 1832.12, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -321.65, 1820.31, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -321.65, 1808.33, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -321.65, 1796.48, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -321.65, 1784.64, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -321.65, 1772.73, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -321.65, 1761.01, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -321.65, 1749.04, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -321.65, 1740.10, 103.00,   0.00, 0.00, 90.00);
	CreateObject(16644, -6791.13, -214.75, 113.70,   0.00, 40.00, -90.00);
	CreateObject(16644, -6228.28, 475.51, 92.55,   0.00, 40.00, -90.00);
	CreateObject(16613, -2661.81, 11222.05, 1734.00,   0.00, 0.00, 0.00);
	CreateObject(16613, -497.02, 120.42, 103.00,   0.00, 0.00, 0.00);
	CreateObject(7806, -174.69, 1773.68, 103.00,   0.00, 0.00, 0.00);
	CreateObject(7832, -9991.53, 1032.74, 109.00,   0.00, 0.00, 0.00);
	CreateObject(3268, -146.75, 1749.88, 103.00,   0.00, 0.00, -90.00);
	CreateObject(3279, -290.97, 1741.92, 103.00,   0.00, 0.00, 90.00);
	CreateObject(19868, -311.29, 1809.29, 104.00,   0.00, 0.00, 90.00);
	CreateObject(0, -282.87, 1856.24, 103.00,   0.00, 0.00, 90.00);
	CreateObject(16147, -190.31, 1565.30, 42.46,   0.00, 0.00, 0.00);
	CreateObject(16147, -190.31, 1565.30, 42.46,   0.00, 0.00, 0.00);
	CreateObject(16147, -190.31, 1565.30, 42.46,   0.00, 0.00, 0.00);
	CreateObject(16147, -190.31, 1565.30, 42.46,   0.00, 0.00, 0.00);
	CreateObject(16147, -190.31, 1565.30, 42.46,   0.00, 0.00, 0.00);
	CreateObject(16147, -190.31, 1565.30, 42.46,   0.00, 0.00, 0.00);
	CreateObject(16147, -190.31, 1565.30, 42.46,   0.00, 0.00, 0.00);
	CreateObject(16147, -190.31, 1565.30, 42.46,   0.00, 0.00, 0.00);
	CreateObject(3279, -316.23, 1741.92, 103.00,   0.00, 0.00, 90.00);
	CreateObject(19868, -190.67, 2015.79, 103.00,   0.00, 0.00, 0.00);
	CreateObject(19868, -195.89, 2015.79, 103.00,   0.00, 0.00, 0.00);
	CreateObject(3485, -173.13, 1854.21, 110.00,   0.00, 0.00, 0.00);
	CreateObject(3485, -203.31, 1854.21, 110.00,   0.00, 0.00, 0.00);
	CreateObject(987, -321.65, 1926.95, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -321.65, 1914.93, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -321.65, 1903.07, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -321.65, 1891.15, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -321.65, 1879.38, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -321.65, 1867.64, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -321.65, 1855.84, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -321.65, 1844.06, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -321.65, 1832.12, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -321.65, 1820.31, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -321.65, 1808.33, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -321.65, 1796.48, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -321.65, 1784.64, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -321.65, 1772.73, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -321.65, 1761.01, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -321.65, 1749.04, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -321.65, 1740.10, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -286.27, 1739.68, 103.00,   0.00, 0.00, 0.00);
	CreateObject(987, -274.32, 1739.68, 103.00,   0.00, 0.00, 0.00);
	CreateObject(987, -262.40, 1739.68, 103.00,   0.00, 0.00, 0.00);
	CreateObject(987, -250.44, 1739.68, 103.00,   0.00, 0.00, 0.00);
	CreateObject(987, -238.47, 1739.68, 103.00,   0.00, 0.00, 0.00);
	CreateObject(987, -226.54, 1739.68, 103.00,   0.00, 0.00, 0.00);
	CreateObject(987, -214.73, 1739.68, 103.00,   0.00, 0.00, 0.00);
	CreateObject(987, -202.78, 1739.68, 103.00,   0.00, 0.00, 0.00);
	CreateObject(987, -190.90, 1739.68, 103.00,   0.00, 0.00, 0.00);
	CreateObject(987, -178.90, 1739.68, 103.00,   0.00, 0.00, 0.00);
	CreateObject(987, -167.00, 1739.68, 103.00,   0.00, 0.00, 0.00);
	CreateObject(987, -155.08, 1739.68, 103.00,   0.00, 0.00, 0.00);
	CreateObject(987, -143.16, 1739.68, 103.00,   0.00, 0.00, 0.00);
	CreateObject(987, -131.54, 1739.62, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -131.54, 1751.53, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -131.54, 1763.44, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -131.54, 1775.38, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -131.54, 1787.31, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -131.54, 1799.23, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -131.54, 1811.20, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -131.54, 1823.13, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -131.54, 1835.04, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -131.54, 1846.98, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -131.54, 1858.84, 103.00,   0.00, 0.00, 72.00);
	CreateObject(987, -127.64, 1939.03, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -127.64, 1950.97, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -127.64, 1962.93, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -127.64, 1971.96, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -321.65, 1958.86, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -321.65, 1946.81, 103.00,   0.00, 0.00, 90.00);
	CreateObject(3268, -176.76, 1749.88, 103.00,   0.00, 0.00, -90.00);
	CreateObject(3268, -206.80, 1749.88, 103.00,   0.00, 0.00, -90.00);
	CreateObject(3268, -236.67, 1749.88, 103.00,   0.00, 0.00, -90.00);
	CreateObject(3268, -266.58, 1749.88, 103.00,   0.00, 0.00, -90.00);
	CreateObject(19868, -311.29, 1804.06, 104.00,   0.00, 0.00, 90.00);
	CreateObject(19868, -311.29, 1798.92, 104.00,   0.00, 0.00, 90.00);
	CreateObject(19868, -311.29, 1793.70, 104.00,   0.00, 0.00, 90.00);
	CreateObject(19868, -311.29, 1788.52, 104.00,   0.00, 0.00, 90.00);
	CreateObject(19868, -311.29, 1783.44, 104.00,   0.00, 0.00, 90.00);
	CreateObject(19868, -311.29, 1778.30, 104.00,   0.00, 0.00, 90.00);
	CreateObject(19868, -311.29, 1773.12, 104.00,   0.00, 0.00, 90.00);
	CreateObject(19868, -311.29, 1767.98, 104.00,   0.00, 0.00, 90.00);
	CreateObject(19868, -311.29, 1762.81, 104.00,   0.00, 0.00, 90.00);
	CreateObject(19868, -311.29, 1757.63, 104.00,   0.00, 0.00, 90.00);
	CreateObject(19868, -311.29, 1752.46, 104.00,   0.00, 0.00, 90.00);
	CreateObject(19868, -311.29, 1747.30, 104.00,   0.00, 0.00, 90.00);
	CreateObject(18449, -233.11, 2055.58, 102.70,   0.00, 0.00, 90.00);
	CreateObject(18449, -233.11, 2135.38, 102.70,   0.00, 0.00, 90.00);
	CreateObject(18449, -233.11, 2214.88, 106.83,   0.00, -6.00, 90.00);
	CreateObject(18449, -233.11, 2294.56, 111.00,   0.00, 0.00, 90.00);
	CreateObject(16685, -298.73, 2296.50, 111.30,   0.00, 0.00, 0.00);
	CreateObject(16685, -298.73, 2348.35, 111.30,   0.00, 0.00, 0.00);
	CreateObject(16685, -298.73, 2399.83, 111.30,   0.00, 0.00, 0.00);
	CreateObject(18449, -303.58, 1692.90, 95.86,   0.00, -10.00, 90.00);
	CreateObject(18449, -303.58, 1614.42, 82.02,   0.00, -10.00, 90.00);
	CreateObject(18449, -303.58, 1603.83, 80.15,   0.00, -10.00, 90.00);
	CreateObject(3279, -180.87, 1884.85, 115.00,   0.00, 0.00, 0.00);
	CreateObject(3279, -204.93, 1900.27, 126.00,   0.00, 0.00, 0.00);
	CreateObject(987, -311.29, 1732.29, 103.00,   0.00, 0.00, 90.00);
	CreateObject(987, -295.81, 1744.05, 103.00,   0.00, 0.00, -90.00);
	CreateObject(987, -299.29, 1737.94, 109.00,   90.00, 180.00, 0.00);
	CreateObject(987, -311.29, 1737.95, 109.00,   90.00, 0.00, 0.00);
	CreateObject(987, -295.85, 1737.94, 109.00,   90.00, 180.00, 0.00);
	CreateObject(987, -307.88, 1737.95, 109.00,   90.00, 0.00, 0.00);
	CreateObject(987, -303.56, 1744.31, 103.00,   0.00, 0.00, -90.00);
	CreateObject(987, -303.56, 1732.47, 103.00,   0.00, 0.00, 90.00);
	// грувстрит
	//------------------------------------------------------------БАЗА ADMINS
	CreateDynamicObject(987, -2028.56, 113.73, 27.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, -2040.66, 113.80, 27.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, -2052.63, 113.89, 27.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, -2068.36, 114.24, 30.00,   0.00, 11.00, 0.00);
	CreateDynamicObject(987, -2058.81, 113.80, 27.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, -2079.94, 115.22, 32.00,   0.00, 11.00, -5.00);
	CreateDynamicObject(987, -2091.14, 115.33, 33.00,   0.00, 8.00, 0.00);
	CreateDynamicObject(987, -2097.17, 115.29, 34.00,   0.00, 8.00, 0.00);
	CreateDynamicObject(987, -2108.30, 115.13, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, -2119.87, 115.09, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, -2131.53, 115.14, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, -2143.27, 114.92, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, -2149.35, 114.83, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, -2146.46, 125.78, 34.00,   0.00, 0.00, -105.00);
	CreateDynamicObject(987, -2143.79, 136.43, 34.00,   0.00, 0.00, -105.00);
	CreateDynamicObject(987, -2142.22, 148.16, 34.00,   0.00, 0.00, -98.00);
	CreateDynamicObject(987, -2140.58, 159.28, 34.00,   0.00, 0.00, -98.00);
	CreateDynamicObject(987, -2140.54, 170.77, 34.00,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -2140.51, 182.43, 34.00,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -2140.36, 193.64, 34.00,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -2140.30, 204.20, 34.00,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -2140.28, 215.56, 34.00,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -2142.71, 225.28, 34.00,   0.00, 0.00, -78.00);
	CreateDynamicObject(987, -2142.44, 236.66, 34.00,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -2142.33, 248.54, 34.00,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -2142.11, 259.83, 34.00,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -2141.85, 270.54, 34.00,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -2141.81, 282.26, 34.00,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -2141.85, 293.78, 34.00,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -2141.81, 305.13, 34.00,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -2141.58, 315.10, 34.00,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -2141.57, 314.91, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, -2129.76, 315.03, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, -2117.96, 315.13, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, -2106.59, 315.15, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, -2094.90, 315.25, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, -2083.06, 315.14, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, -2071.15, 314.89, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, -2059.58, 314.87, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, -2047.90, 314.72, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, -2036.05, 314.61, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, -2024.04, 314.59, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, -2012.44, 314.39, 34.00,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -2012.27, 309.66, 34.00,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -2012.46, 298.31, 34.00,   0.00, 5.00, -90.00);
	CreateDynamicObject(987, -2012.45, 286.65, 33.00,   0.00, 5.00, -90.00);
	CreateDynamicObject(987, -2012.57, 274.97, 32.00,   0.00, 5.00, -90.00);
	CreateDynamicObject(987, -2012.88, 263.35, 31.00,   0.00, 5.00, -90.00);
	CreateDynamicObject(987, -2013.02, 251.47, 30.00,   0.00, 5.00, -90.00);
	CreateDynamicObject(987, -2013.00, 239.91, 29.00,   0.00, 5.00, -90.00);
	CreateDynamicObject(987, -2012.97, 228.37, 28.00,   0.00, 5.00, -90.00);
	CreateDynamicObject(987, -2012.94, 216.57, 27.00,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -2012.76, 204.36, 27.00,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -2012.63, 192.30, 27.00,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -2012.54, 169.27, 27.00,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -2012.54, 157.35, 27.00,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -2012.54, 145.70, 27.00,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -2012.46, 134.51, 27.00,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -2012.47, 128.40, 27.00,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -2012.61, 125.26, 27.00,   0.00, 0.00, -90.00);
	CreateDynamicObject(987, -2024.58, 113.57, 27.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(8171, -2095.74, 245.33, 34.90,   0.00, 0.00, 0.00);
	CreateDynamicObject(3485, -2098.04, 273.79, 41.90,   0.00, 0.00, 90.00);
	CreateDynamicObject(3485, -2098.04, 227.85, 41.90,   0.00, 0.00, 90.00);
	CreateDynamicObject(3485, -2098.04, 191.40, 41.90,   0.00, 0.00, 90.00);
	CreateDynamicObject(673, -2034.17, 174.26, 28.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(673, -2037.17, 182.13, 28.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(673, -2037.17, 166.85, 28.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(2725, -2048.43, 134.73, 28.20,   0.00, 0.00, 0.00);
	CreateDynamicObject(2350, -2048.43, 135.29, 28.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(2350, -2049.10, 134.70, 28.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(2350, -2048.45, 134.10, 28.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(2350, -2047.78, 134.72, 28.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(2858, -2048.42, 134.71, 28.70,   0.00, 0.00, 0.00);
	CreateDynamicObject(13592, -2048.36, 246.43, 44.00,   0.00, 0.00, 90.00);
	CreateDynamicObject(673, -2047.05, 228.93, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(673, -2037.93, 234.64, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(673, -2052.84, 216.27, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(673, -2035.29, 225.78, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(673, -2047.51, 221.91, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(673, -2036.56, 210.78, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(673, -2026.04, 223.44, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(673, -2032.69, 245.71, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(673, -2034.71, 272.77, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(673, -2049.66, 280.99, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(673, -2065.44, 279.21, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(673, -2065.85, 233.25, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(673, -2065.35, 241.54, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(673, -2061.14, 224.83, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(673, -2050.64, 206.07, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(673, -2048.40, 212.14, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(673, -2039.19, 203.33, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(673, -2031.87, 206.27, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(673, -2031.76, 218.48, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(673, -2027.95, 236.87, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(673, -2028.07, 251.55, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(673, -2033.63, 263.44, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(673, -2046.76, 289.39, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(673, -2039.93, 290.70, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(673, -2058.01, 292.57, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(673, -2060.56, 285.78, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(673, -2054.34, 280.84, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(673, -2043.63, 271.46, 34.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(673, -2043.63, 271.46, 34.00,   0.00, 0.00, 0.00);
	CreateVehicle(411, -2033.1998, 170.4955, 29.0000, -90.0000, -1, -1, 100);
	CreateVehicle(411, -2035.4745, 133.4225, 29.0000, 0.0000, -1, -1, 100);
	CreateVehicle(411, -2025.4117, 133.6774, 29.0000, 0.0000, -1, -1, 100);
	CreateVehicle(411, -2028.3231, 155.5358, 29.0000, 0.0000, -1, -1, 100);
	CreateVehicle(411, -2022.7371, 154.6745, 29.0000, 180.0000, -1, -1, 100);
	return 1;
}

public OnGameModeExit()
{
	print("ZiMod выгружен успешно!");
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 2659.8625488281,-2137.1726074219,23.505228042603);
	SetPlayerFacingAngle(playerid, 43.670043945313);
	SetPlayerCameraPos(playerid, 2654.8178710938,-2132.4484863281,23.780223083496);
	SetPlayerCameraLookAt(playerid, 2659.8625488281,-2137.1726074219,23.505228042603);
	return 1;
}

public OnPlayerConnect(playerid)
{
	h[playerid]=21;m[playerid]=20;
	new str[128];
	format(str,128,"{00FF00}%s {9999FF}вошел {FFFF33}в {33CCFF}игру", PlayerName(playerid));
	SendClientMessageToAll(COLOR_ORANGE,str);
	SendClientMessage(playerid, COLOR_YELLOW,"Добро пожаловать на ZiDrift!");
	switch(random(4))
	{
	case 0: PlayAudioStreamForPlayer(playerid,"http://zidrift.tk/sources/music/music1.mp3"); //I bellive I Can FLY!
	case 1: PlayAudioStreamForPlayer(playerid,"http://zidrift.tk/sources/music/music2.mp3"); //Калинка-Малинка
	case 2: PlayAudioStreamForPlayer(playerid,"http://zidrift.tk/sources/music/music3.mp3"); //Лезгинка Чеченская
	case 3: PlayAudioStreamForPlayer(playerid,"http://zidrift.tk/sources/music/music4.mp3"); //Wreaking Ball
	}
	return 1;
}
public OnPlayerDisconnect(playerid, reason)
{
	DestroyObject(migalki[playerid][0]);
	DestroyObject(migalki[playerid][1]);
	new str[128];
	format(str,128,"{00FF00}%s {9999FF}вышел {33CCFF}из игры", PlayerName(playerid));
	SendClientMessageToAll(COLOR_RED,str);
}
public OnPlayerSpawn(playerid)
{
	SetPlayerInterior(playerid,0);
	SetPlayerPos(playerid,1110.9763,-1837.4794,16.6020);
	SetCameraBehindPlayer(playerid);
	SetPlayerTime(playerid,14,0);
	new rand = random(sizeof(RandomSpawn));
	SetPlayerPos(playerid,RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2]);
	StopAudioStreamForPlayer(playerid);
	return 1;
}


stock PlayerName(playerid)
{
	new pname[MAX_PLAYER_NAME];
	GetPlayerName(playerid,pname,sizeof(pname));
	return pname;
}
public OnPlayerCommandText(playerid, cmdtext[])
{
	new cmd[256];
	new	tmp[256];
	new Message[256];
	new gMessage[256];
	new pName[MAX_PLAYER_NAME+1];
	new iName[MAX_PLAYER_NAME+1];
	new	idx;

	cmd = strtok(cmdtext, idx);
	if(strcmp("/pm", cmd, true) == 0)
	{
		tmp = strtok(cmdtext,idx);

		if(!strlen(tmp) || strlen(tmp) > 5) {
			SendClientMessage(playerid,COLOR_RED,"[ZiDrift]: /pm [ID] [сообщение]");
			return 1;
		}

		new id = strval(tmp);
		gMessage = strrest(cmdtext,idx);

		if(!strlen(gMessage)) {
			SendClientMessage(playerid,COLOR_RED,"[ZiDrift]: /pm [ID] [сообщение]");
			return 1;
		}

		if(!IsPlayerConnected(id)) {
			SendClientMessage(playerid,COLOR_RED,"[ZiDrift]: Игрок не обнаружен");
			return 1;
		}

		if(playerid != id) {
			GetPlayerName(id,iName,sizeof(iName));
			GetPlayerName(playerid,pName,sizeof(pName));
			format(Message,sizeof(Message),">> %s(%d): %s",iName,id,gMessage);
			SendClientMessage(playerid,PM_OUTGOING_COLOR,Message);
			format(Message,sizeof(Message),"** %s(%d): %s",pName,playerid,gMessage);
			SendClientMessage(id,PM_INCOMING_COLOR,Message);
			PlayerPlaySound(id,1085,0.0,0.0,0.0);
		}
		else {
			SendClientMessage(playerid,COLOR_RED,"[ZiDrift]: Вы не можете писать в PM самому себе");
		}
		return 1;
	}
	if(strcmp(cmdtext, "/создатель", true) == 0)
	{
		SendClientMessage(playerid,0xFFFF80AA,"Мод: ZiMod 3.6");
		SendClientMessage(playerid,0x00FF00AA,"Автор мода: ZipGarder");
		SendClientMessage(playerid,COLOR_GREEN,"Вконтакте: 1derex1");
		return 1;
	}

	if(strcmp(cmdtext, "/help", true) == 0)
	{
		SendClientMessage(playerid,0xFFFF00AA,"Команды помощи:");
		SendClientMessage(playerid,0x00FF00AA,"Создатель: /создатель");
		SendClientMessage(playerid,0xFF8000AA,"Команды: /команды, /клан");
		return 1;
	}

	if(strcmp(cmdtext, "/lotta", true) == 0)
	{
		GivePlayerMoney(playerid,-1000);
		SendClientMessage(playerid,0xFFFF00AA,"С вашего счета снято 1000$");
		switch(random(10))
		{
		case 0: SendClientMessage(playerid,0xFF0000AA,"Жаль, но вы ничего не выиграли");
		case 1:
			{
				SendClientMessage(playerid,0x00FF00AA,"Вы выиграли 500$! Поздравляем!");
				GivePlayerMoney(playerid,500);
			}
		case 2: SendClientMessage(playerid,0xFF0000AA,"Жаль, но вы ничего не выиграли");
		case 3: SendClientMessage(playerid,0xFF0000AA,"Жаль, но вы ничего не выиграли");
		case 4: SendClientMessage(playerid,0xFF0000AA,"Жаль, но вы ничего не выиграли");
		case 5: SendClientMessage(playerid,0xFF0000AA,"Жаль, но вы ничего не выиграли");
		case 6:
			{
				SendClientMessage(playerid,0x00FF00AA,"Вы выиграли 10000$! Поздравляем!");
				GivePlayerMoney(playerid,10000);
				SendClientMessageToAll(COLOR_RED,"А тем временем, один из игроков выиграл 10000$, участвуя в лотерее.");
				SendClientMessageToAll(COLOR_RED,"Учавствуй и ты! /lotta (Услуга платная. 1000$)");
			}
		case 7: SendClientMessage(playerid,0xFF0000AA,"Жаль, но вы ничего не выиграли");
		case 8: SendClientMessage(playerid,0xFF0000AA,"Жаль, но вы ничего не выиграли");
		case 9: SendClientMessage(playerid,0xFF0000AA,"Жаль, но вы ничего не выиграли");
		}
		return 1;
	}
	
	if(strcmp(cmdtext, "/команды", true) == 0)
	{
		SendClientMessage(playerid,0xFF8000AA,"Чтобы получить авто/мото/авиа транспорт:");
		SendClientMessage(playerid,0x00FF00AA,"			Нажать кнопку ALT(если вы пешком) или 2(если вы в машине);");
		SendClientMessage(playerid,0x00FF00AA,"     	Выбрать пункт 'Транспорт'.");
		SendClientMessage(playerid,0xFF8000AA,"Телепортация:");
		SendClientMessage(playerid,0x00FF00AA,"     	Нажать кнопку ALT(если вы пешком) или 2(если вы в машине);");
		SendClientMessage(playerid,0x00FF00AA,"     	1.Выбрать пункт 'Телепорты';");
		SendClientMessage(playerid,0x00FF00AA,"     	2.Drift-трассы: '/d1-9'(без пробела);");
		SendClientMessage(playerid,0xFF8000AA,"Тюнинг автомобиля:");
		SendClientMessage(playerid,0x00FF00AA,"     	Нажать кнопку 2;");
		SendClientMessage(playerid,0x00FF00AA,"     	Выбрать пункт 'Тюнинг автомобиля';");
		SendClientMessage(playerid,0x00FF00AA,"     	Далее выбираете ту деталь, которая вам нужна.");
		SendClientMessage(playerid,0xFF8000AA,"Сменить скин и прочее:");
		SendClientMessage(playerid,0x00FF00AA,"     	Нажать кнопку ALT(если вы пешком) или 2(если вы в машине);");
		SendClientMessage(playerid,0x00FF00AA,"     	Выбрать пункт 'Управление персонажем';");
		SendClientMessage(playerid,0x00FF00AA,"     	Далее выбираете то, что вам нужно.");
		SendClientMessage(playerid,0xFF8000AA,"Дополнительно:");
		SendClientMessage(playerid,0x00FF00AA,"     	'/dt [id]*' - режим дрифт-тренировки;");
		SendClientMessage(playerid,0xFFFF00AA,"     	0 - общий мир. Далее - ваши отдельные.");
		SendClientMessage(playerid,0xFFFF00AA,"     	/gang - система банд.");
		SendClientMessage(playerid,0xFFFF00AA,"     	/pocelui - поцеловать игрока");
		SendClientMessage(playerid,0xFFFF00AA,"     	/iznas - изнасиловать игрока");
		SendClientMessage(playerid,0xFFFF00AA,"     	/sexon - заняться сексом с игроком.");
		return 1;
	}
	if(strcmp(cmdtext, "/цвет", true)==0)
	{
		ShowPlayerDialog(playerid,794,DIALOG_STYLE_LIST,"{FFB6C1}Выберите цвет ника","{FF0000}Красный\n{BEBEBE}Серый\n{006400}Зеленый\n{EEA2AD}Розовый\n{00FF00}Лайм\n{0000FF}Синий\n{FFFF00}Желтый\n{00FFFF}Голубой\n{FFA500}Оранжевый\n{FF00FF}Магента\n{FF6347}Томатный\n{551A8B}Индиго\n{B8860B}Золотой\n{698B22}Оливковый\n{9ACD32}Желто-Зеленый\n{8B4513}Коричневый\n{EE6A50}Коралловый\n{FF4500}Красно-оранжевый\nОтключить цвет","Применить"," Отмена");
		return 1;
	}
	if(strcmp(cmdtext, "/радио", true) == 0)
	{
		if(IsPlayerConnected(playerid))
		{
			ShowPlayerDialog(playerid, RADIO, DIALOG_STYLE_LIST, "Выберите Радио волну:","Zaycev FM\nNoise FM\nRadio Record\nEuropa +\n{FF3300}Выключить радио", "Ok", "Выход");
		}
		return 1;
	}
	if (strcmp("/обнулить", cmdtext, true, 10) == 0)
	{
		SetPlayerScore(playerid, 0);
		ResetPlayerMoney(playerid);
		SendClientMessage(playerid, 0x00FF00AA, "[ZiDrift]: Вы обнулили очки");
		return 1;
	}
	if(strcmp(cmdtext, "/help", true) == 0)ShowPlayerDialog(playerid, 7, DIALOG_STYLE_LIST, "Помощь", "Администрация\nПлатные услуги\nКоманды сервера\nУстранение неполадок\nОбновления\nПравила", "Выбрать", "Выход");

	if (strcmp("/меню", cmdtext, true, 10) == 0)ShowPlayerDialog(playerid, 3, DIALOG_STYLE_LIST, "Игровое меню", "{FF0000}Тюнинг автомобиля\n{FF8000}Телепорты\n{FFFF00}Анимации\n{00FF00}Радио\n{00BFFF}Транспорт\n{0000FF}Управление персонажем\n{8000FF}Помощь\n{FF0000}Отсчёт\n{FF8000}Управление Авто\n{FFFF00}Администрация в сети\n{00FF00}Смена цвета ника\n{00BFFF}Сброс очков", "Выбрать", "Выход");

	if (strcmp("/отсчет", cmdtext, true, 10) == 0)
	{
		if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)return SendClientMessage(playerid, 0xFF0000AA,"[ZiDrift]: Вы должны быть в автомобиле");
		new Float: X, Float:Y, Float: Z;
		GetPlayerPos(playerid, X, Y, Z);
		countdown[playerid]=11;
		for(new i=0;i<MAX_PLAYERS;i++)
		if(IsPlayerInRangeOfPoint(i,15.0,X,Y,Z))
		{
			if(GetPlayerState(i) != PLAYER_STATE_ONFOOT && countdown[i]==-1)countdown[i]=11;
		}
		return 1;
	}

	dcmd(dt, 2, cmdtext);
	return 0;
}

public OnPlayerText(playerid, text[])
{
	SetPlayerChatBubble(playerid, text, 0xAED06FAA, 250.0, 8000);
	new string[256], sendername[32];
	GetPlayerName(playerid, sendername, 32);
	format(string, sizeof(string), "%s(%d)", sendername, playerid);
	SetPlayerName(playerid, string);
	format(string, 128, "%s", text);
	SendPlayerMessageToAll(playerid, string);
	SetPlayerName(playerid, sendername);
	return 0;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if ((newkeys==KEY_SUBMISSION))
	{
		if(IsPlayerInAnyVehicle(playerid))
		ShowPlayerDialog(playerid, 3, DIALOG_STYLE_LIST, "Игровое меню", "{FF0000}Тюнинг автомобиля\n{FF8000}Телепорты\n{FFFF00}Анимации\n{00FF00}Радио\n{00BFFF}Транспорт\n{0000FF}Управление персонажем\n{8000FF}Помощь\n{FF0000}Отсчёт\n{FF8000}Управление Авто\n{FFFF00}Администрация в сети\n{00FF00}Смена цвета ника\n{00BFFF}Сброс очков", "Выбрать", "Выход");
	}
	
	if ((newkeys==1024))
	{
		if(!IsPlayerInAnyVehicle(playerid))
		ShowPlayerDialog(playerid, 3, DIALOG_STYLE_LIST, "Игровое меню", "{FF0000}Тюнинг автомобиля\n{FF8000}Телепорты\n{FFFF00}Анимации\n{00FF00}Радио\n{00BFFF}Транспорт\n{0000FF}Управление персонажем\n{8000FF}Помощь\n{FF0000}Отсчёт\n{FF8000}Управление Авто\n{FFFF00}Администрация в сети\n{00FF00}Смена цвета ника\n{00BFFF}Сброс очков", "Выбрать", "Выход");
	}
	
	if( newkeys == 1 || newkeys == 9 || newkeys == 33 && oldkeys != 1 || oldkeys != 9 || oldkeys != 33)
	{
		new Car = GetPlayerVehicleID(playerid), Model = GetVehicleModel(Car);
		switch(Model)
		{
		case 446,432,448,452,424,453,454,461,462,463,468,471,430,472,449,473,481,484,493,495,509,510,521,538,522,523,532,537,570,581,586,590,569,595,604,611: return 0;
		}
		AddVehicleComponent(GetPlayerVehicleID(playerid), 1010);
	}
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	SendClientMessage(playerid, 0xFFFF00AA, "Вы умерли :D");
	PlayAudioStreamForPlayer(playerid,"http://zidrift.tk/sources/sounds/kill.mp3");
	GivePlayerMoney(killerid, 10000);
	SendDeathMessage(killerid,playerid,reason);
}


public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	new carid = GetPlayerVehicleID(playerid);
	new engine,lights,alarm,doors,bonnet,boot,objective;
	if(dialogid == 0)
	{
		if(response)
		{
			if(listitem == 0)//капот отк
			{
				GetVehicleParamsEx(carid,engine,lights,alarm,doors,bonnet,boot,objective);
				SetVehicleParamsEx(carid,engine,lights,alarm,doors,true,boot,objective);
			}
			else if(listitem == 1)//багажник отк
			{
				GetVehicleParamsEx(carid,engine,lights,alarm,doors,bonnet,boot,objective);
				SetVehicleParamsEx(carid,engine,lights,alarm,doors,bonnet,true,objective);
			}
			else if(listitem == 2)//капот зак
			{
				GetVehicleParamsEx(carid,engine,lights,alarm,doors,bonnet,boot,objective);
				SetVehicleParamsEx(carid,engine,lights,alarm,doors,false,boot,objective);
			}
			else if(listitem == 3)//багажник зак
			{
				GetVehicleParamsEx(carid,engine,lights,alarm,doors,bonnet,boot,objective);
				SetVehicleParamsEx(carid,engine,lights,alarm,doors,bonnet,false,objective);
			}
			else if(listitem == 5)
			{
				ShowPlayerDialog(playerid,1,DIALOG_STYLE_LIST,"Выберите цвет неоновой подсветки","{FF3300}Красный\n{0033CC}Синий\n{33FF00}Зелёный\n{FFFF00}Желтый\n{FEBFEF}Розовый\nБелый\nУдалить Неон","Выбрать","Отмена");
			}
			else if(listitem == 4)//смена номера
			{
				ShowPlayerDialog(playerid,2,DIALOG_STYLE_INPUT,"{33FF00}Смена номера","{FF3300}Введите новый номер автомобиля:","Готово","Отмена");
				return 1;
			}
		}
	}
	if(dialogid == 999)
	{
		if(response)
		{
			if(listitem == 0)
			{
				SetPlayerTime(playerid, 12, 00);
			}
			if(listitem == 1)
			{
				SetPlayerTime(playerid, 00, 00);
			}
		}
	}
	if(dialogid == 7)
	{
		if(response)
		{
			if(listitem == 0)
			{
				ShowPlayerDialog(playerid, 88, DIALOG_STYLE_MSGBOX, "{33FF00}Администрация сервера", "\n{FF3300}Гл. администратор: ZipGarder\nЗам. гл. администратора: Nikita_Bombo\nСооснователи: MSkream, Lisenok, Jizzy99", "OK", "");
			}
			if(listitem == 1)
			{
				ShowPlayerDialog(playerid, 88, DIALOG_STYLE_MSGBOX, "{33FF00}Платные услуги", "{33FF00}Желаете купить полномочия администратора или игровую валюту?\nОбращайтесь Вконтакте: http://vk.com/1derex1", "Выбор", "");
			}
			if(listitem == 2)
			{
				ShowPlayerDialog(playerid, 88, DIALOG_STYLE_MSGBOX, "{33FF00}Команды сервера", "{FF3300}/меню - {33FF00}меню сервера (также можно вызвать на ALT(пешком) или 2(в автомобиле))\n{FF3300}/обнулить - {33FF00}сброс очков (денег)\n{FF3300}/цвет - {33FF00}выбрать цвет ника\n{FF3300}/радио - {33FF00}включить радио\n{FF3300}/деньги [id] [кол-во] - {33FF00}передать деньги", "Выбор", "");
			}
			if(listitem == 3)
			{
				ShowPlayerDialog(playerid, 88, DIALOG_STYLE_MSGBOX, "{33FF00}Устранение проблем", "{FF3300}Если радио не работает, попробуйте прибавить громкости в {33FF00}меню игры (ESC)\nЕсли не загружаются текстуры (дороги), {33FF00}выйдите из машины\nЕсли у вас другие проблемы - то обращайтесь на форум:\nzidrift.tk/forum", "Выбор", "");
			}
			if(listitem == 4)
			{
				ShowPlayerDialog(playerid, 88, DIALOG_STYLE_MSGBOX, "{33FF00}Обновления", "{FF3300}Версия 3.6\n{FF3300}Вся информация об обновлениях в нашей группе {33FF00}Вконтакте: vk.com/zidrift", "Выбор", "");
			}
			if(listitem == 5)
			{
				ShowPlayerDialog(playerid, 88, DIALOG_STYLE_MSGBOX, "{33FF00}Правила сервера", "{FF3300}1. {33FF00}Не использовать читы,клео скрипты на нашем сервере (искл. FreeRunning Story) \n{FF3300}2. {33FF00}Не оскорблять других игроков, маты разрешены\n{FF3300}3. {33FF00}Администрация оставляет за собой право не соблюдать правила\n{FF3300}4. {33FF00}Играя на сервере, вы соглашаетесь с правилами", "Служу Селестии!", "");
			}
		}
	}
	if(dialogid == 1)
	{
		if(response)
		{
			if(listitem == 0)
			{
				DestroyObject(neon[playerid][0]);
				DestroyObject(neon[playerid][1]);
				neon[playerid][0] = CreateObject(18647,0,0,0,0,0,0,100.0);
				neon[playerid][1] = CreateObject(18647,0,0,0,0,0,0,100.0);
				AttachObjectToVehicle(neon[playerid][0], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
				AttachObjectToVehicle(neon[playerid][1], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
			}
			else if(listitem == 1)
			{
				DestroyObject(neon[playerid][0]);
				DestroyObject(neon[playerid][1]);
				neon[playerid][0] = CreateObject(18648,0,0,0,0,0,0,100.0);
				neon[playerid][1] = CreateObject(18648,0,0,0,0,0,0,100.0);
				AttachObjectToVehicle(neon[playerid][0], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
				AttachObjectToVehicle(neon[playerid][1], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
			}
			else if(listitem == 2)
			{
				DestroyObject(neon[playerid][0]);
				DestroyObject(neon[playerid][1]);
				neon[playerid][0] = CreateObject(18649,0,0,0,0,0,0,100.0);
				neon[playerid][1] = CreateObject(18649,0,0,0,0,0,0,100.0);
				AttachObjectToVehicle(neon[playerid][0], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
				AttachObjectToVehicle(neon[playerid][1], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
			}
			else if(listitem==3)
			{
				DestroyObject(neon[playerid][0]);
				DestroyObject(neon[playerid][1]);
				neon[playerid][0] = CreateObject(18650,0,0,0,0,0,0,100.0);
				neon[playerid][1] = CreateObject(18650,0,0,0,0,0,0,100.0);
				AttachObjectToVehicle(neon[playerid][0], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
				AttachObjectToVehicle(neon[playerid][1], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
			}
			else if(listitem==4)
			{
				DestroyObject(neon[playerid][0]);
				DestroyObject(neon[playerid][1]);
				neon[playerid][0] = CreateObject(18651,0,0,0,0,0,0,100.0);
				neon[playerid][1] = CreateObject(18651,0,0,0,0,0,0,100.0);
				AttachObjectToVehicle(neon[playerid][0], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
				AttachObjectToVehicle(neon[playerid][1], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
			}
			else if(listitem==5)
			{
				DestroyObject(neon[playerid][0]);
				DestroyObject(neon[playerid][1]);
				neon[playerid][0] = CreateObject(18652,0,0,0,0,0,0,100.0);
				neon[playerid][1] = CreateObject(18652,0,0,0,0,0,0,100.0);
				AttachObjectToVehicle(neon[playerid][0], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
				AttachObjectToVehicle(neon[playerid][1], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
			}
			else if(listitem==6)
			{
				DestroyObject(neon[playerid][0]);
				DestroyObject(neon[playerid][1]);
			}
		}
	}
	if(dialogid == 2)
	{
		if(response)
		{
			if(!strlen(inputtext))
			{
				ShowPlayerDialog(playerid,2,DIALOG_STYLE_INPUT,"{33FF00}Смена номера","{FF3300}Введите новый номер автомобиля:","Готово","Отмена");
				return 1;
			}
			if(strlen(inputtext) > 10)
			{
				ShowPlayerDialog(playerid,2,DIALOG_STYLE_INPUT,"{33FF00}Смена номера","{FF3300}Вы ввели слишком длинный номер!\n{FF3300}Введите новый номер автомобиля:","Готово","Отмена");
				return 1;
			}
			new Float:x,Float:y,Float:z,Float:ang;
			SetVehicleNumberPlate(GetPlayerVehicleID(playerid), inputtext);
			GetVehiclePos(GetPlayerVehicleID(playerid),x,y,z);
			GetVehicleZAngle(GetPlayerVehicleID(playerid),ang);
			SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			SetVehiclePos(GetPlayerVehicleID(playerid),x,y,z);
			PutPlayerInVehicle(playerid,GetPlayerVehicleID(playerid),0);
			SetVehicleZAngle(GetPlayerVehicleID(playerid),ang);
		}
	}

	if(dialogid == 3)//главное меню
	{
		if(response)
		{
			if(listitem == 0)
			{
				if(IsPlayerInAnyVehicle(playerid))
				{
					if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)ShowPlayerDialog(playerid, 4, DIALOG_STYLE_LIST, "Тюнинг автомобиля", "Диски \nГидравлика \nАрхангел Тюнинг \nЦвет \nВинилы ", "Выбрать", "Назад");
					else SendClientMessage(playerid, COLOR_RED, "[ZiDrift]: Вы не водитель автомобиля!");
				}
				else SendClientMessage(playerid, COLOR_RED, "[ZiDrift]: Вы не в автомобиле");
			}

			if(listitem == 1)ShowPlayerDialog(playerid, 5, DIALOG_STYLE_LIST, "Телепорты", "Ухо\nДоки СФ\nХолм СФ\nАэропорт ЛС\nДрифт островок\nФорт карсон\nСимметрия\nСклад ЛВ\nПарковка СФ\nПарковка ЛВ\nДраг 1\nДраг 2\nДраг 3\nРалли\nSpawn\nПрыжки с парашютом\nШикарный отель", "Выбрать", "Назад");
			if(listitem == 2)ShowPlayerDialog(playerid, 6, DIALOG_STYLE_LIST, "Меню Анимации", "Напитки и Cигареты\nТанцевать\nЗвонить\nМочеиспускание\nОстановить анимацию", "OK", "Назад");
			if(listitem == 3)return OnPlayerCommandText(playerid,"/радио");
			if(listitem == 4)
			{
				if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,0xFF0000AA,"[ZiDrift]: Вы уже в транспорте");
				ShowPlayerDialog(playerid,9,DIALOG_STYLE_LIST,"Выберите автомобиль:","Elegy\nSultan\nInfernus\nBanshee\nBuffalo\nHuntley\nCheetah\nTurismo\nSlamvan\nBlade\nUranus\nBullet\nJester\nHotring\nBandito\nDune\nSavanna\nMonster\nTaxi\nBus\nMaverick\nShamal\nBeagle\nPhoenix\nWindsor\nStretch\nSabre\nFlash\nStratum\nZR-350\nSandking\nCopCarLa\nKart\nSuperGT\nNRG-500\nSanchez\nBMX\nMtBike\nHotknife\nPacker\nClub\nStuntplane","ОК","Назад");
				return 1;
			}
			if(listitem == 5)ShowPlayerDialog(playerid, 8, DIALOG_STYLE_LIST, "Управление Персонажем", "Пополнить броню\nПополнить жизни\nСменить скин\nСамоубийство\nПолучить оружие", "OK", "Назад");
			if(listitem == 6)ShowPlayerDialog(playerid, 7, DIALOG_STYLE_LIST, "Помощь", "Администрация\nПлатные услуги\nКоманды сервера\nВозможные проблемы\nОбновления\nПравила", "ОК", "Назад");
			if(listitem == 7)return OnPlayerCommandText(playerid,"/отсчет");
			if(listitem == 8)
			{
				if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,0xFF0000AA,"[ZiDrift]: Вы должны быть в машине!");
				ShowPlayerDialog(playerid,0,DIALOG_STYLE_LIST,"Авто-Меню","Открыть капот\nОткрыть багажник\nЗакрыть капот\nЗакрыть багажник\nСменить номер\nНеон","Выбрать","Отмена");
			}
			if(listitem == 9)return OnPlayerCommandText(playerid,"/admins");
			if(listitem == 10)return OnPlayerCommandText(playerid,"/цвет");
			if(listitem == 11)return OnPlayerCommandText(playerid,"/обнулить");
		}			  
	}

	if(dialogid == 8)//upravl persom
	{
		if(response)
		{
			if(listitem == 0)
			{
				SetPlayerArmour(playerid,100);
				ShowPlayerDialog(playerid, 8, DIALOG_STYLE_LIST, "Управление Персонажем", "Пополнить броню\nПополнить жизни\nСменить скин\nСамоубийство\nПолучить оружие", "OK", "Назад");
				PlayerPlaySound(playerid,1149,0.0,0.0,0.0);
			}
			if(listitem == 3)
			{
				SetPlayerHealth(playerid,0);
				PlayerPlaySound(playerid,1149,0.0,0.0,0.0);
			}
			if(listitem == 1)
			{
				SetPlayerHealth(playerid,100);
				ShowPlayerDialog(playerid, 8, DIALOG_STYLE_LIST, "Управление Персонажем", "Пополнить броню\nПополнить жизни\nСменить скин\nСамоубийство\nПолучить оружие", "OK", "Назад");
				PlayerPlaySound(playerid,1149,0.0,0.0,0.0);
			}
			if(listitem == 2)ShowPlayerDialog(playerid, 10, DIALOG_STYLE_INPUT, "{33FF00}Смена скина", "{FF3300}Введите ID нового скина:", "OK", "назад");
			if(listitem == 4)
			{
				SetPlayerHealth(playerid,100);
				SetPlayerArmour(playerid,100);
				GivePlayerWeapon(playerid,30,100);
				GivePlayerWeapon(playerid,4,100);
				GivePlayerWeapon(playerid,28,100);
				PlayerPlaySound(playerid,1149,0.0,0.0,0.0);
			}
		}
		else ShowPlayerDialog(playerid, 3, DIALOG_STYLE_LIST, "Игровое меню", "{FF0000}Тюнинг автомобиля\n{FF8000}Телепорты\n{FFFF00}Анимации\n{00FF00}Радио\n{00BFFF}Транспорт\n{0000FF}Управление персонажем\n{8000FF}Помощь\n{FF0000}Отсчёт\n{FF8000}Управление Авто\n{FFFF00}Администрация в сети\n{00FF00}Смена цвета ника\n{00BFFF}Сброс очков", "Выбрать", "Выход");
	}
	if(dialogid == 4)//tuning menu главная
	{
		if(response)
		{
			if(listitem == 0)
			{
				ShowPlayerDialog(playerid, 11, DIALOG_STYLE_LIST, "Список дисков", "Shadow\nMega\nWires\nClassic\nRimshine\nCutter\nTwist\nSwitch\nGrove\nImport\nDollar\nTrance\nAtomic", "OK", "Назад");
			}
			if(listitem == 1)
			{
				new vehicleid = GetPlayerVehicleID(playerid);
				AddVehicleComponent(vehicleid,1087);
				PlayerPlaySound(playerid,1133,0.0,0.0,0.0);
				ShowPlayerDialog(playerid, 4, DIALOG_STYLE_LIST, "Тюнинг меню", "Диски \nГидравлика \nАрхангел Тюнинг \nЦвет \nВинилы ", "Выбрать", "Назад");
			}
			if(listitem == 2)
			{
				new Car = GetPlayerVehicleID(playerid), Model = GetVehicleModel(Car);
				switch(Model)
				{
				case 559,560,561,562,565,558: ShowPlayerDialog(playerid, 12, DIALOG_STYLE_LIST, "Тюнинг Wheel Arch Angels", "Передний бампер X-flow\nПередний бампер Alien\nЗадний бампер X-Flow\nЗадний бампер Alien\nСпойлер X-Flow \nСпойлер Alien \nБоковая юбка X-Flow \nБоковая юбка Alien\nВоздухозаборник X-Flow\nВоздухозаборник Alien\nВыхлоп X-flow\nВыхлоп Alien", "OK", "Назад");
				default: SendClientMessage(playerid,0xFF0000AA,"[ZiDrift]: Вы должны быть в: Elegy, Stratum, Flash, Sultan,  ");
				}
			}
			if(listitem == 3)ShowPlayerDialog(playerid, 13, DIALOG_STYLE_LIST, "Выбор цвета", "Красный \nСиний \nЖелтый \nЗеленый \nСерый \nОранжевый \nЧерный \nБелый \nФиолетовый \nСалатовый", "ОК", "Назад");
			if(listitem == 4)ShowPlayerDialog(playerid, 14, DIALOG_STYLE_LIST, "Выбор винила", "Винил №1 \nВинил №2 \nВинил №3 ", "ОК", "Назад");
		}
		else ShowPlayerDialog(playerid, 3, DIALOG_STYLE_LIST, "Игровое меню", "{FF0000}Тюнинг автомобиля\n{FF8000}Телепорты\n{FFFF00}Анимации\n{00FF00}Радио\n{00BFFF}Транспорт\n{0000FF}Управление персонажем\n{8000FF}Помощь\n{FF0000}Отсчёт\n{FF8000}Управление Авто\n{FFFF00}Администрация в сети\n{00FF00}Смена цвета ника\n{00BFFF}Сброс очков", "Выбрать", "Выход");
	}

	if(dialogid == 11)//spisok diskov
	{
		if(response)
		{
			new vehicleid = GetPlayerVehicleID(playerid);
			
			if(listitem == 0)AddVehicleComponent(vehicleid,1073);
			if(listitem == 1)AddVehicleComponent(vehicleid,1074);
			if(listitem == 2)AddVehicleComponent(vehicleid,1076);
			if(listitem == 3)AddVehicleComponent(vehicleid,1077);
			if(listitem == 4)AddVehicleComponent(vehicleid,1075);
			if(listitem == 5)AddVehicleComponent(vehicleid,1079);
			if(listitem == 6)AddVehicleComponent(vehicleid,1078);
			if(listitem == 7)AddVehicleComponent(vehicleid,1080);
			if(listitem == 8)AddVehicleComponent(vehicleid,1081);
			if(listitem == 9)AddVehicleComponent(vehicleid,1082);
			if(listitem == 10)AddVehicleComponent(vehicleid,1083);
			if(listitem == 11)AddVehicleComponent(vehicleid,1084);
			if(listitem == 12)AddVehicleComponent(vehicleid,1085);
			
			PlayerPlaySound(playerid,1133,0.0,0.0,0.0);
			ShowPlayerDialog(playerid, 11, DIALOG_STYLE_LIST, "Список дисков", "Shadow\nMega\nWires\nClassic\nRimshine\nCutter\nTwist\nSwitch\nGrove\nImport\nDollar\nTrance\nAtomic", "OK", "Назад");
		}
		else ShowPlayerDialog(playerid, 4, DIALOG_STYLE_LIST, "Тюнинг меню", "Диски \nГидравлика \nАрхангел Тюнинг \nЦвет \nВинилы ", "Выбрать", "Назад");
	}

	if(dialogid == 13)//colors             cveta
	{
		if(response)
		{
			new vehicleid = GetPlayerVehicleID(playerid);
			
			if(listitem == 0)ChangeVehicleColor(vehicleid, 3, 3);
			if(listitem == 1)ChangeVehicleColor(vehicleid, 79, 79);
			if(listitem == 2)ChangeVehicleColor(vehicleid, 142, 142);
			if(listitem == 3)ChangeVehicleColor(vehicleid, 128, 128);
			if(listitem == 4)ChangeVehicleColor(vehicleid, 251, 251);
			if(listitem == 5)ChangeVehicleColor(vehicleid, 6, 6);
			if(listitem == 6)ChangeVehicleColor(vehicleid, 0, 0);
			if(listitem == 7)ChangeVehicleColor(vehicleid, 1, 1);
			if(listitem == 8)ChangeVehicleColor(vehicleid, 167, 167);
			if(listitem == 9)ChangeVehicleColor(vehicleid, 147, 147);
			
			
			PlayerPlaySound(playerid,1134,0.0,0.0,0.0);
			ShowPlayerDialog(playerid, 13, DIALOG_STYLE_LIST, "Выбор цвета", "Красный \nСиний \nЖелтый \nЗеленый \nСерый \nОранжевый \nЧерный \nБелый \nФиолетовый \nСалатовый", "ОК", "Назад");
		}
		else ShowPlayerDialog(playerid, 4, DIALOG_STYLE_LIST, "Тюнинг меню", "Диски \nГидравлика \nАрхангел Тюнинг \nЦвет \nВинилы ", "Выбрать", "Назад");
	}

	if(dialogid == 9)//car spawning into
	{
		if(response)//написано не мной, взято из чьего-то меню, тем не менее - автору спасибо.
		{
			new carvlad[20],Float:X,Float:Y,Float:Z,Float:Angle,id,string[256];
			GetPlayerPos(playerid,X,Y,Z);
			GetPlayerFacingAngle(playerid,Angle);
			switch(listitem)
			{
			case 0: carvlad = "Elegy", id = 562;
			case 1: carvlad = "Sultan", id = 560;
			case 2: carvlad = "Infernus", id = 411;
			case 3: carvlad = "Banshee", id = 429;
			case 4: carvlad = "Buffalo", id = 402;
			case 5: carvlad = "Huntley", id = 579;
			case 6: carvlad = "Cheetah", id = 415;
			case 7: carvlad = "Turismo", id = 451;
			case 8: carvlad = "Slamvan", id = 535;
			case 9: carvlad = "Blade", id = 536;
			case 10: carvlad = "Uranus", id = 558;
			case 11: carvlad = "Bullet", id = 541;
			case 12: carvlad = "Jester", id = 559;
			case 13: carvlad = "Hotrina", id = 502;
			case 14: carvlad = "Bandito", id = 568;
			case 15: carvlad = "Dune", id = 573;
			case 16: carvlad = "Savanna", id = 567;
			case 17: carvlad = "Monster", id = 444;
			case 18: carvlad = "Taxi", id = 420;
			case 19: carvlad = "Bus", id = 431;
			case 20: carvlad = "Maverick", id = 487;
			case 21: carvlad = "Shamal", id = 519;
			case 22: carvlad = "Beagle", id = 511;
			case 23: carvlad = "Phoenix", id = 603;
			case 24: carvlad = "Windsor", id = 555;
			case 25: carvlad = "Stretch", id = 409;
			case 26: carvlad = "Sabre", id = 475;
			case 27: carvlad = "Flash", id = 565;
			case 28: carvlad = "Stratum", id = 561;
			case 29: carvlad = "ZR-350", id = 477;
			case 30: carvlad = "Sandking", id = 495;
			case 31: carvlad = "CopCarLA", id = 596;
			case 32: carvlad = "Kart", id = 571;
			case 33: carvlad = "SuperGt", id = 506;
			case 34: carvlad = "Nrg500", id = 522;
			case 35: carvlad = "Sanchez", id = 468;
			case 36: carvlad = "Bmx", id = 481;
			case 37: carvlad = "MtBike", id = 510;
			case 38: carvlad = "Hotknife", id = 434;
			case 39: carvlad = "Packer", id = 443;
			case 40: carvlad = "Club", id = 589;
			case 41: carvlad = "Stuntplane", id = 513;
			}
			format(string,sizeof(string),"[ZiDrift]: автомобиль %s создан",carvlad); SendClientMessage(playerid,0x00FF00AA,string);
			if(ta4katest[playerid] == 1)DestroyVehicle(ta4ka[playerid]);
			ta4ka[playerid] = CreateVehicle(id,X,Y,Z,Angle,-1,-1,50000);
			if(GetPlayerInterior(playerid)) LinkVehicleToInterior(ta4ka[playerid],GetPlayerInterior(playerid));
			SetVehicleVirtualWorld(ta4ka[playerid],GetPlayerVirtualWorld(playerid));
			PutPlayerInVehicle(playerid,ta4ka[playerid],0);
			ta4katest[playerid] = 1;
		}
		return 1;
	}

	if(dialogid == 6)//Меню анимации взято из скрипта Panther'a
	{
		if(response)
		{
			if(listitem == 0)ShowPlayerDialog(playerid, 15, DIALOG_STYLE_LIST, "Напитки и Cигареты", "Пиво\nКурение\nВино\nСпрайт", "OK", "Назад");
			if(listitem == 1)ShowPlayerDialog(playerid, 16, DIALOG_STYLE_LIST, "Танцевать", "Танец - 1\nТанец - 2\nТанец - 3\nТанец - 4\nРуки Вверх", "OK", "Назад");
			if(listitem == 2)ShowPlayerDialog(playerid, 17, DIALOG_STYLE_LIST, "Звонить", "Звонок\nОпьянение", "OK", "Назад");
			if(listitem == 3)
			{
				SetPlayerSpecialAction(playerid,68);
				SendClientMessage(playerid, 0x00FF00AA, "[ZiDrift]: Анимация - мочеиспускание");
			}
			if(listitem == 4)
			{
				SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
				SetPlayerDrunkLevel(playerid, 0);
				SetPlayerSpecialAction (playerid, 13 - SPECIAL_ACTION_STOPUSECELLPHONE);
				SendClientMessage(playerid, 0x00FF00AA, "[ZiDrift]: Анимация остановлена");
			}
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
		}
	}

	if(dialogid == 15)//anim buhlo
	{
		if(response)
		{
			if(listitem == 0)
			{
				SetPlayerSpecialAction (playerid, SPECIAL_ACTION_DRINK_BEER );
				SendClientMessage(playerid, 0x00FF00AA, "[ZiDrift]: Анимация - Пиво");
			}
			if(listitem == 1)
			{
				SetPlayerSpecialAction (playerid, SPECIAL_ACTION_SMOKE_CIGGY );
				SendClientMessage(playerid, 0x00FF00AA, "[ZiDrift]: Анимация - Курение");
			}
			if(listitem == 2)
			{
				SetPlayerSpecialAction (playerid, SPECIAL_ACTION_DRINK_WINE );
				SendClientMessage(playerid, 0x00FF00AA, "[ZiDrift]: Анимация - Вино");
			}
			if(listitem == 3)
			{
				SetPlayerSpecialAction (playerid, SPECIAL_ACTION_DRINK_SPRUNK );
				SendClientMessage(playerid, 0x00FF00AA, "[ZiDrift]: Анимация - Спрайт");
			}
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
		}
		else ShowPlayerDialog(playerid, 6, DIALOG_STYLE_LIST, "Меню Анимации", "Напитки и Cигареты\nТанцевать\nЗвонить\nПисать\nОстановить анимацию", "OK", "Назад");
	}

	if(dialogid == 16)//anim dance
	{
		if(response)
		{
			if(listitem == 0)
			{
				SetPlayerSpecialAction (playerid, SPECIAL_ACTION_DANCE1);
				SendClientMessage(playerid, 0x00FF00AA, "[ZiDrift]: Танец - 1");
			}
			if(listitem == 1)
			{
				SetPlayerSpecialAction (playerid, SPECIAL_ACTION_DANCE2);
				SendClientMessage(playerid, 0x00FF00AA, "[ZiDrift]: Танец - 2");
			}
			if(listitem == 2)
			{
				SetPlayerSpecialAction (playerid, SPECIAL_ACTION_DANCE3);
				SendClientMessage(playerid, 0x00FF00AA, "[ZiDrift]: Танец - 3");
			}
			if(listitem == 3)
			{
				SetPlayerSpecialAction (playerid, SPECIAL_ACTION_DANCE4);
				SendClientMessage(playerid, 0x00FF00AA, "[ZiDrift]: Танец - 4");
			}
			if(listitem == 4)
			{
				SetPlayerSpecialAction (playerid, SPECIAL_ACTION_HANDSUP);
				SendClientMessage(playerid, 0x00FF00AA, "[ZiDrift]: Анимация - Руки Вверх");
			}
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
		}
		else ShowPlayerDialog(playerid, 6, DIALOG_STYLE_LIST, "Меню Анимации", "Напитки и Cигареты\nТанцевать\nЗвонить\nОстановить анимацию", "OK", "Назад");
	}


	if(dialogid == 17)//Звонки
	{
		if(response)
		{
			if(listitem == 0)
			{
				SetPlayerSpecialAction (playerid, SPECIAL_ACTION_USECELLPHONE);
				SendClientMessage(playerid, 0x00FF00AA, "[ZiDrift]: Анимация - Звонок");
				GivePlayerMoney(playerid,-50);
			}
			if(listitem == 1)
			{
				SetPlayerDrunkLevel(playerid, 2323000);
				SendClientMessage(playerid, 0x00FF00AA, "[ZiDrift]: Анимация - Опьянение(чтобы снять эффект выберите (Остановить анимацию)");
			}
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
		}
		else ShowPlayerDialog(playerid, 6, DIALOG_STYLE_LIST, "Меню Анимации", "Напитки и Cигареты\nТанцевать\nЗвонить\nПисать\nОстановить анимацию", "OK", "Назад");
	}

	if(dialogid == 14)//vinils
	{
		if(response)
		{
			new vehicleid = GetPlayerVehicleID(playerid);
			ChangeVehiclePaintjob(vehicleid,listitem+1);
			PlayerPlaySound(playerid,1134,0.0,0.0,0.0);
			ShowPlayerDialog(playerid, 14, DIALOG_STYLE_LIST, "Выбор винила", "Винил №1 \nВинил №2 \nВинил №3 ", "ОК", "Назад");
		}
		else ShowPlayerDialog(playerid, 4, DIALOG_STYLE_LIST, "Тюнинг меню", "Диски \nГидравлика \nАрхангел Тюнинг \nЦвет \nВинилы ", "Выбрать", "Назад");
	}

	if(dialogid == 12)//WAA tune
	{
		if(response)
		{
			if(listitem == 0)// x front
			{
				new vehicleid = GetPlayerVehicleID(playerid);
				new cartype = GetVehicleModel(vehicleid);
				
				if(cartype == 562)AddVehicleComponent(vehicleid,1172);
				if(cartype == 560)AddVehicleComponent(vehicleid,1170);
				if(cartype == 565)AddVehicleComponent(vehicleid,1152);
				if(cartype == 559)AddVehicleComponent(vehicleid,1173);
				if(cartype == 561)AddVehicleComponent(vehicleid,1157);
				if(cartype == 558)AddVehicleComponent(vehicleid,1165);

				PlayerPlaySound(playerid,1133,0.0,0.0,0.0);
				ShowPlayerDialog(playerid, 12, DIALOG_STYLE_LIST, "Тюнинг Wheel Arch Angels", "Передний бампер X-flow\nПередний бампер Alien\nЗадний бампер X-Flow\nЗадний бампер Alien\nСпойлер X-Flow \nСпойлер Alien \nБоковая юбка X-Flow \nБоковая юбка Alien\nВоздухозаборник X-Flow\nВоздухозаборник Alien\nВыхлоп X-flow\nВыхлоп Alien", "OK", "Назад");
			}
			
			if(listitem == 1)//alien front
			{
				new vehicleid = GetPlayerVehicleID(playerid);
				new cartype = GetVehicleModel(vehicleid);
				
				if(cartype == 562)AddVehicleComponent(vehicleid,1171);
				if(cartype == 560)AddVehicleComponent(vehicleid,1169);
				if(cartype == 565)AddVehicleComponent(vehicleid,1153);
				if(cartype == 559)AddVehicleComponent(vehicleid,1160);
				if(cartype == 561)AddVehicleComponent(vehicleid,1155);
				if(cartype == 558)AddVehicleComponent(vehicleid,1166);

				PlayerPlaySound(playerid,1133,0.0,0.0,0.0);
				ShowPlayerDialog(playerid, 12, DIALOG_STYLE_LIST, "Тюнинг Wheel Arch Angels", "Передний бампер X-flow\nПередний бампер Alien\nЗадний бампер X-Flow\nЗадний бампер Alien\nСпойлер X-Flow \nСпойлер Alien \nБоковая юбка X-Flow \nБоковая юбка Alien\nВоздухозаборник X-Flow\nВоздухозаборник Alien\nВыхлоп X-flow\nВыхлоп Alien", "OK", "Назад");
			}
			
			if(listitem == 2)//x rear
			{
				new vehicleid = GetPlayerVehicleID(playerid);
				new cartype = GetVehicleModel(vehicleid);
				
				if(cartype == 562)AddVehicleComponent(vehicleid,1148);
				if(cartype == 560)AddVehicleComponent(vehicleid,1140);
				if(cartype == 565)AddVehicleComponent(vehicleid,1151);
				if(cartype == 559)AddVehicleComponent(vehicleid,1161);
				if(cartype == 561)AddVehicleComponent(vehicleid,1156);
				if(cartype == 558)AddVehicleComponent(vehicleid,1167);

				PlayerPlaySound(playerid,1133,0.0,0.0,0.0);
				ShowPlayerDialog(playerid, 12, DIALOG_STYLE_LIST, "Тюнинг Wheel Arch Angels", "Передний бампер X-flow\nПередний бампер Alien\nЗадний бампер X-Flow\nЗадний бампер Alien\nСпойлер X-Flow \nСпойлер Alien \nБоковая юбка X-Flow \nБоковая юбка Alien\nВоздухозаборник X-Flow\nВоздухозаборник Alien\nВыхлоп X-flow\nВыхлоп Alien", "OK", "Назад");
			}
			
			if(listitem == 3)//alien rear
			{
				new vehicleid = GetPlayerVehicleID(playerid);
				new cartype = GetVehicleModel(vehicleid);
				
				if(cartype == 562)AddVehicleComponent(vehicleid,1149);
				if(cartype == 560)AddVehicleComponent(vehicleid,1141);
				if(cartype == 565)AddVehicleComponent(vehicleid,1150);
				if(cartype == 559)AddVehicleComponent(vehicleid,1159);
				if(cartype == 561)AddVehicleComponent(vehicleid,1154);
				if(cartype == 558)AddVehicleComponent(vehicleid,1168);

				PlayerPlaySound(playerid,1133,0.0,0.0,0.0);
				ShowPlayerDialog(playerid, 12, DIALOG_STYLE_LIST, "Тюнинг Wheel Arch Angels", "Передний бампер X-flow\nПередний бампер Alien\nЗадний бампер X-Flow\nЗадний бампер Alien\nСпойлер X-Flow \nСпойлер Alien \nБоковая юбка X-Flow \nБоковая юбка Alien\nВоздухозаборник X-Flow\nВоздухозаборник Alien\nВыхлоп X-flow\nВыхлоп Alien", "OK", "Назад");
			}
			
			if(listitem == 4)//x spoiler
			{
				new vehicleid = GetPlayerVehicleID(playerid);
				new cartype = GetVehicleModel(vehicleid);
				
				if(cartype == 562)AddVehicleComponent(vehicleid,1146);
				if(cartype == 560)AddVehicleComponent(vehicleid,1139);
				if(cartype == 565)AddVehicleComponent(vehicleid,1050);
				if(cartype == 559)AddVehicleComponent(vehicleid,1158);
				if(cartype == 561)AddVehicleComponent(vehicleid,1160);
				if(cartype == 558)AddVehicleComponent(vehicleid,1163);
				
				PlayerPlaySound(playerid,1133,0.0,0.0,0.0);
				ShowPlayerDialog(playerid, 12, DIALOG_STYLE_LIST, "Тюнинг Wheel Arch Angels", "Передний бампер X-flow\nПередний бампер Alien\nЗадний бампер X-Flow\nЗадний бампер Alien\nСпойлер X-Flow \nСпойлер Alien \nБоковая юбка X-Flow \nБоковая юбка Alien\nВоздухозаборник X-Flow\nВоздухозаборник Alien\nВыхлоп X-flow\nВыхлоп Alien", "OK", "Назад");
			}
			if(listitem == 5)//alien spoiler
			{
				new vehicleid = GetPlayerVehicleID(playerid);
				new cartype = GetVehicleModel(vehicleid);
				
				if(cartype == 562)AddVehicleComponent(vehicleid,1147);
				if(cartype == 560)AddVehicleComponent(vehicleid,1138);
				if(cartype == 565)AddVehicleComponent(vehicleid,1049);
				if(cartype == 559)AddVehicleComponent(vehicleid,1162);
				if(cartype == 561)AddVehicleComponent(vehicleid,1058);
				if(cartype == 558)AddVehicleComponent(vehicleid,1164);
				
				PlayerPlaySound(playerid,1133,0.0,0.0,0.0);
				ShowPlayerDialog(playerid, 12, DIALOG_STYLE_LIST, "Тюнинг Wheel Arch Angels", "Передний бампер X-flow\nПередний бампер Alien\nЗадний бампер X-Flow\nЗадний бампер Alien\nСпойлер X-Flow \nСпойлер Alien \nБоковая юбка X-Flow \nБоковая юбка Alien\nВоздухозаборник X-Flow\nВоздухозаборник Alien\nВыхлоп X-flow\nВыхлоп Alien", "OK", "Назад");
			}
			if(listitem == 6)//x side
			{
				new vehicleid = GetPlayerVehicleID(playerid);
				new cartype = GetVehicleModel(vehicleid);
				
				if(cartype == 562)
				{
					AddVehicleComponent(vehicleid,1041);
					AddVehicleComponent(vehicleid,1039);
				}
				if(cartype == 560)
				{
					AddVehicleComponent(vehicleid,1031);
					AddVehicleComponent(vehicleid,1030);
				}
				if(cartype == 565)
				{
					AddVehicleComponent(vehicleid,1052);
					AddVehicleComponent(vehicleid,1048);
				}
				if(cartype == 559)
				{
					AddVehicleComponent(vehicleid,1070);
					AddVehicleComponent(vehicleid,1072);
				}
				if(cartype == 561)
				{
					AddVehicleComponent(vehicleid,1057);
					AddVehicleComponent(vehicleid,1063);
				}
				if(cartype == 558)
				{
					AddVehicleComponent(vehicleid,1093);
					AddVehicleComponent(vehicleid,1095);
				}
				
				PlayerPlaySound(playerid,1133,0.0,0.0,0.0);
				ShowPlayerDialog(playerid, 12, DIALOG_STYLE_LIST, "Тюнинг Wheel Arch Angels", "Передний бампер X-flow\nПередний бампер Alien\nЗадний бампер X-Flow\nЗадний бампер Alien\nСпойлер X-Flow \nСпойлер Alien \nБоковая юбка X-Flow \nБоковая юбка Alien\nВоздухозаборник X-Flow\nВоздухозаборник Alien\nВыхлоп X-flow\nВыхлоп Alien", "OK", "Назад");
			}
			
			if(listitem == 7)//alien side
			{
				new vehicleid = GetPlayerVehicleID(playerid);
				new cartype = GetVehicleModel(vehicleid);
				
				if(cartype == 562)
				{
					AddVehicleComponent(vehicleid,1036);
					AddVehicleComponent(vehicleid,1040);
				}
				if(cartype == 560)
				{
					AddVehicleComponent(vehicleid,1026);
					AddVehicleComponent(vehicleid,1027);
				}
				if(cartype == 565)
				{
					AddVehicleComponent(vehicleid,1051);
					AddVehicleComponent(vehicleid,1047);
				}
				if(cartype == 559)
				{
					AddVehicleComponent(vehicleid,1069);
					AddVehicleComponent(vehicleid,1071);
				}
				if(cartype == 561)
				{
					AddVehicleComponent(vehicleid,1056);
					AddVehicleComponent(vehicleid,1062);
				}
				if(cartype == 558)
				{
					AddVehicleComponent(vehicleid,1090);
					AddVehicleComponent(vehicleid,1094);
				}
				
				PlayerPlaySound(playerid,1133,0.0,0.0,0.0);
				ShowPlayerDialog(playerid, 12, DIALOG_STYLE_LIST, "Тюнинг Wheel Arch Angels", "Передний бампер X-flow\nПередний бампер Alien\nЗадний бампер X-Flow\nЗадний бампер Alien\nСпойлер X-Flow \nСпойлер Alien \nБоковая юбка X-Flow \nБоковая юбка Alien\nВоздухозаборник X-Flow\nВоздухозаборник Alien\nВыхлоп X-flow\nВыхлоп Alien", "OK", "Назад");
			}
			
			if(listitem == 8)//x roof
			{
				new vehicleid = GetPlayerVehicleID(playerid);
				new cartype = GetVehicleModel(vehicleid);
				
				if(cartype == 562)AddVehicleComponent(vehicleid,1035);
				if(cartype == 560)AddVehicleComponent(vehicleid,1033);
				if(cartype == 565)AddVehicleComponent(vehicleid,1052);
				if(cartype == 559)AddVehicleComponent(vehicleid,1068);
				if(cartype == 561)AddVehicleComponent(vehicleid,1061);
				if(cartype == 558)AddVehicleComponent(vehicleid,1091);

				PlayerPlaySound(playerid,1133,0.0,0.0,0.0);
				ShowPlayerDialog(playerid, 12, DIALOG_STYLE_LIST, "Тюнинг Wheel Arch Angels", "Передний бампер X-flow\nПередний бампер Alien\nЗадний бампер X-Flow\nЗадний бампер Alien\nСпойлер X-Flow \nСпойлер Alien \nБоковая юбка X-Flow \nБоковая юбка Alien\nВоздухозаборник X-Flow\nВоздухозаборник Alien\nВыхлоп X-flow\nВыхлоп Alien", "OK", "Назад");
			}
			
			if(listitem == 9)//alien roof
			{
				new vehicleid = GetPlayerVehicleID(playerid);
				new cartype = GetVehicleModel(vehicleid);
				
				if(cartype == 562)AddVehicleComponent(vehicleid,1038);
				if(cartype == 560)AddVehicleComponent(vehicleid,1032);
				if(cartype == 565)AddVehicleComponent(vehicleid,1054);
				if(cartype == 559)AddVehicleComponent(vehicleid,1067);
				if(cartype == 561)AddVehicleComponent(vehicleid,1055);
				if(cartype == 558)AddVehicleComponent(vehicleid,1088);
				
				PlayerPlaySound(playerid,1133,0.0,0.0,0.0);
				ShowPlayerDialog(playerid, 12, DIALOG_STYLE_LIST, "Тюнинг Wheel Arch Angels", "Передний бампер X-flow\nПередний бампер Alien\nЗадний бампер X-Flow\nЗадний бампер Alien\nСпойлер X-Flow \nСпойлер Alien \nБоковая юбка X-Flow \nБоковая юбка Alien\nВоздухозаборник X-Flow\nВоздухозаборник Alien\nВыхлоп X-flow\nВыхлоп Alien", "OK", "Назад");
			}
			if(listitem == 10)//x echaust
			{
				new vehicleid = GetPlayerVehicleID(playerid);
				new cartype = GetVehicleModel(vehicleid);
				
				if(cartype == 562)AddVehicleComponent(vehicleid,1037);
				if(cartype == 560)AddVehicleComponent(vehicleid,1029);
				if(cartype == 565)AddVehicleComponent(vehicleid,1045);
				if(cartype == 559)AddVehicleComponent(vehicleid,1066);
				if(cartype == 561)AddVehicleComponent(vehicleid,1059);
				if(cartype == 558)AddVehicleComponent(vehicleid,1089);

				PlayerPlaySound(playerid,1133,0.0,0.0,0.0);
				ShowPlayerDialog(playerid, 12, DIALOG_STYLE_LIST, "Тюнинг Wheel Arch Angels", "Передний бампер X-flow\nПередний бампер Alien\nЗадний бампер X-Flow\nЗадний бампер Alien\nСпойлер X-Flow \nСпойлер Alien \nБоковая юбка X-Flow \nБоковая юбка Alien\nВоздухозаборник X-Flow\nВоздухозаборник Alien\nВыхлоп X-flow\nВыхлоп Alien", "OK", "Назад");
			}
			if(listitem == 11)//alien echaust
			{
				new vehicleid = GetPlayerVehicleID(playerid);
				new cartype = GetVehicleModel(vehicleid);
				
				if(cartype == 562)AddVehicleComponent(vehicleid,1034);
				if(cartype == 560)AddVehicleComponent(vehicleid,1028);
				if(cartype == 565)AddVehicleComponent(vehicleid,1046);
				if(cartype == 559)AddVehicleComponent(vehicleid,1065);
				if(cartype == 561)AddVehicleComponent(vehicleid,1064);
				if(cartype == 558)AddVehicleComponent(vehicleid,1092);

				PlayerPlaySound(playerid,1133,0.0,0.0,0.0);
				ShowPlayerDialog(playerid, 12, DIALOG_STYLE_LIST, "Тюнинг Wheel Arch Angels", "Передний бампер X-flow\nПередний бампер Alien\nЗадний бампер X-Flow\nЗадний бампер Alien\nСпойлер X-Flow \nСпойлер Alien \nБоковая юбка X-Flow \nБоковая юбка Alien\nВоздухозаборник X-Flow\nВоздухозаборник Alien\nВыхлоп X-flow\nВыхлоп Alien", "OK", "Назад");
			}
		}
		else ShowPlayerDialog(playerid, 4, DIALOG_STYLE_LIST, "Тюнинг меню", "Диски \nГидравлика \nАрхангел Тюнинг \nЦвет \nВинилы ", "Выбрать", "Назад");
		return 1;
	}

	if(dialogid == 10)//skins
	{
		if(response)
		{
			if(strval(inputtext) >= 0 && strval(inputtext) <= 300)
			{
				SetPlayerSkin(playerid,strval(inputtext));
				PlayerPlaySound(playerid,1150,0.0,0.0,0.0);
			}
		}
		else ShowPlayerDialog(playerid, 10, DIALOG_STYLE_INPUT, "{33FF00}Смена скина", "{FF3300}Введите id", "OK", "назад");
	}
	if(dialogid == 5)
	{
		if(response)
		{
			if(listitem == 0)
			{
				if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)SetVehiclePos(GetPlayerVehicleID(playerid), -325.1331,1533.0276,75.3594);
				else SetPlayerPos(playerid, -325.1331,1533.0276,75.3594);
				SendClientMessage(playerid, 0xFF0000AA,"[ZiDrift]: Вы телепортированы на {FF3300}Ухо");
				return 1;
			}
			if(listitem == 1)
			{
				if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)SetVehiclePos(GetPlayerVehicleID(playerid), -1584.14, 292.61, 7.19);
				else SetPlayerPos(playerid, -1584.14, 292.61, 7.19);
				SendClientMessage(playerid, 0xFF0000AA,"[ZiDrift]: Вы телепортированы в {FF3300}Доки СФ");
				return 1;
			}
			if(listitem == 2)
			{
				if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)SetVehiclePos(GetPlayerVehicleID(playerid), -2403.39, -595.89, 132.25);
				else SetPlayerPos(playerid, -2403.39, -595.89, 132.25);
				SendClientMessage(playerid, 0xFF0000AA,"[ZiDrift]: Вы телепортированы на {FF3300}Холм СФ");
				return 1;
			}

			if(listitem == 3)
			{
				if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)SetVehiclePos(GetPlayerVehicleID(playerid), 1583.4438476563,-2376.037109375,15.782542228699);
				else SetPlayerPos(playerid, 1583.4438476563,-2376.037109375,15.782542228699);
				SendClientMessage(playerid, 0xFF0000AA,"[ZiDrift]: Вы телепортированы в {FF3300}Аэропорт ЛС");
				return 1;
			}

			if(listitem == 4)
			{
				if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)SetVehiclePos(GetPlayerVehicleID(playerid),-884.28814697266, 550.00549316406, 5.3881149291992);
				else SetPlayerPos(playerid, -884.28814697266, 550.00549316406, 5.3881149291992);
				SendClientMessage(playerid, 0xFF0000AA,"[ZiDrift]: Вы телепортированы на {FF3300}Дрифт островок");
				return 1;
			}

			if(listitem == 5)
			{
				if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)SetVehiclePos(GetPlayerVehicleID(playerid), -113.16453552,583.32196045,3.14548969);
				else SetPlayerPos(playerid, -113.16453552,583.32196045,3.14548969);
				SendClientMessage(playerid, 0xFF0000AA,"[ZiDrift]: Вы телепортированы в {FF3300}Форт карсон");
				return 1;
			}
			if(listitem == 6)
			{
				if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)SetVehiclePos(GetPlayerVehicleID(playerid), 1574.58410645,713.25219727,10.66216087);
				else SetPlayerPos(playerid, 1574.58410645,713.25219727,10.66216087);
				SendClientMessage(playerid, 0xFF0000AA,"[ZiDrift]: Вы телепортированы на {FF3300}Симметрию");
				return 1;
			}
			if(listitem == 7)
			{
				if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)SetVehiclePos(GetPlayerVehicleID(playerid), 1685.10925293,944.96972656,10.53941059);
				else SetPlayerPos(playerid, 1685.10925293,944.96972656,10.53941059);
				SendClientMessage(playerid, 0xFF0000AA,"[ZiDrift]: Вы телепортированы на {FF3300}Склад ЛВ");
				return 1;
			}
			if(listitem == 8)
			{
				if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)SetVehiclePos(GetPlayerVehicleID(playerid), -2852.31640625, 1455.2442626953, 3.0227150917053);
				else SetPlayerPos(playerid, -2852.31640625, 1455.2442626953, 3.0227150917053);
				SendClientMessage(playerid, 0xFF0000AA,"[ZiDrift]: Вы телепортированы на {FF3300}Парковку СФ");
				return 1;
			}
			if(listitem == 9)
			{
				if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)SetVehiclePos(GetPlayerVehicleID(playerid), 2071.83, 2384.84, 49.86);
				else SetPlayerPos(playerid, 2071.83, 2384.84, 49.86);
				SendClientMessage(playerid, 0xFF0000AA,"[ZiDrift]: Вы телепортированы на {FF3300}Парковку ЛВ");
				return 1;
			}
			if(listitem == 10)
			{
				if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)SetVehiclePos(GetPlayerVehicleID(playerid), -1668, -240,14.010653495789);
				else SetPlayerPos(playerid, -1668, -240, 15.0);
				SendClientMessage(playerid, 0xFF0000AA,"[ZiDrift]: Вы телепортированы на {FF3300}Драг 1");
				return 1;
			}

			if(listitem == 11)
			{
				if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)SetVehiclePos(GetPlayerVehicleID(playerid), -1195.292114,16.669136,14.148437);
				else SetPlayerPos(playerid, -1195.292114,16.669136,14.148437);
				SendClientMessage(playerid, 0xFF0000AA,"[ZiDrift]: Вы телепортированы на {FF3300}Драг 2");
				return 1;
			}
			if(listitem == 13)
			{
				if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)SetVehiclePos(GetPlayerVehicleID(playerid), -2335.4683, -1620.7100, 483.4157);
				else SetPlayerPos(playerid,-2335.4683, -1620.7100, 483.4157);
				SendClientMessage(playerid, 0xFF0000AA,"[ZiDrift]: Вы телепортированы на {FF3300}Ралли");
				return 1;
			}
			if(listitem == 16)
			{
				if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)SetVehiclePos(GetPlayerVehicleID(playerid), -2415.1167,331.7777,34.9755);
				else SetPlayerPos(playerid,-2415.1167,331.7777,34.9755);
				SendClientMessage(playerid, 0xFF0000AA,"[ZiDrift]: Вы телепортированы к {FF3300}Шикарному отелю");
				return 1;
			}
			if(listitem == 12)
			{
				if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)SetVehiclePos(GetPlayerVehicleID(playerid), -1897.1633,-1150.4993,38.4863);
				else SetPlayerPos(playerid,-1897.1633,-1150.4993,38.4863);
				SendClientMessage(playerid, 0xFF0000AA,"[ZiDrift]: Вы телепортированы на {FF3300}Драг 3");
				return 1;
			}
			if(listitem == 14)
			{
				if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)SetVehiclePos(GetPlayerVehicleID(playerid), 2500.4712,-1678.1825,13.3651);
				else SetPlayerPos(playerid,2500.4712,-1678.1825,13.3651);
				SendClientMessage(playerid, 0xFF0000AA,"[ZiDrift]: Вы телепортированы на {FF3300}Spawn");
				return 1;
			}
			if(listitem == 15)
			{
				if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)SetVehiclePos(GetPlayerVehicleID(playerid), 1605.3007,-1694.9355,180.5703);
				else SetPlayerPos(playerid,1605.3007,-1694.9355,180.5703);
				SendClientMessage(playerid, 0xFF0000AA,"[ZiDrift]: Вы телепортированы на {FF3300}Прыжки с парашютом");
				return 1;
			}
		}
	}
	else if(dialogid == RADIO)
	{
		if(response)
		{
			if(listitem == 0)// (1)
			{
				PlayAudioStreamForPlayer(playerid,"http://radio.zaycev.fm:9002/ZaycevFM(128).m3u");
			}
			if(listitem == 1)// (2)
			{
				PlayAudioStreamForPlayer(playerid,"http://noisefm.ru:8000/play.m3u");
			}
			if(listitem == 2)// (3)
			{
				PlayAudioStreamForPlayer(playerid,"http://online.radiorecord.ru:8101/rr_128");
			}
			if(listitem == 3)// (6)
			{
				PlayAudioStreamForPlayer(playerid,"http://europaplus.hostingradio.ru:8014/europaplus256.mp3.m3u");
			}
			if(listitem == 4)// (7)
			{
				StopAudioStreamForPlayer(playerid);
			}
		}
	}
	if(dialogid == 794)
	{
		if(response)
		{
			switch(listitem)
			{
			case 0:
				{
					SetPlayerColor(playerid,0xAA3333AA);
					SendClientMessage(playerid, COLOR_GREEN, "[ZiDrift]: Активирован красный цвет");
				}
			case 1:
				{
					SetPlayerColor(playerid,0xAFAFAFAA);
					SendClientMessage(playerid, COLOR_GREEN, "[ZiDrift]: Активирован серый цвет");
				}
			case 2:
				{
					SetPlayerColor(playerid,0x008000AA);
					SendClientMessage(playerid, COLOR_GREEN, "[ZiDrift]: Активирован зеленый цвет");
				}
			case 3:
				{
					SetPlayerColor(playerid,0xFF80FFAA);
					SendClientMessage(playerid, COLOR_GREEN, "[ZiDrift]: Активирован розовый цвет");
				}
			case 4:
				{
					SetPlayerColor(playerid,0x00FF40AA);
					SendClientMessage(playerid, COLOR_GREEN, "[ZiDrift]: Активирован цвет лайма");
				}
			case 5:
				{
					SetPlayerColor(playerid,0x0000FFAA);
					SendClientMessage(playerid, COLOR_GREEN, "[ZiDrift]: Активирован синий цвет");
				}
			case 6:
				{
					SetPlayerColor(playerid,0xFFFF00AA);
					SendClientMessage(playerid, COLOR_GREEN, "[ZiDrift]: Активирован желтый цвет");
				}
			case 7:
				{
					SetPlayerColor(playerid,0x00FFFFAA);
					SendClientMessage(playerid, COLOR_GREEN, "[ZiDrift]: Активирован голубой цвет");
				}
			case 8:
				{
					SetPlayerColor(playerid,0xFF8000AA);
					SendClientMessage(playerid, COLOR_GREEN, "[ZiDrift]: Активирован оранжевый цвет");
				}
			case 9:
				{
					SetPlayerColor(playerid,0xFF00FFAA);
					SendClientMessage(playerid, COLOR_GREEN, "[ZiDrift]: Активирован цвет 'Магента'");
				}
			case 10:
				{
					SetPlayerColor(playerid,0xF96C77AA);
					SendClientMessage(playerid, COLOR_GREEN, "[ZiDrift]: Активирован томатный цвет");
				}
			case 11:
				{
					SetPlayerColor(playerid,0x400080AA);
					SendClientMessage(playerid, COLOR_GREEN, "[ZiDrift]: Активирован цвет 'Индиго'");
				}
			case 12:
				{
					SetPlayerColor(playerid,0x808000AA);
					SendClientMessage(playerid, COLOR_GREEN, "[ZiDrift]: Активирован золотой цвет");
				}
			case 13:
				{
					SetPlayerColor(playerid,0x808040AA);
					SendClientMessage(playerid, COLOR_GREEN, "[ZiDrift]: Активирован оливковый цвет");
				}
			case 14:
				{
					SetPlayerColor(playerid,0x809E21AA);
					SendClientMessage(playerid, COLOR_GREEN, "[ZiDrift]: Активирован желто-зеленый цвет");
				}
			case 15:
				{
					SetPlayerColor(playerid,0x804040AA);
					SendClientMessage(playerid, COLOR_GREEN, "[ZiDrift]: Активирован коричневый цвет");
				}
			case 16:
				{
					SetPlayerColor(playerid,0xAD163DAA);
					SendClientMessage(playerid, COLOR_GREEN, "[ZiDrift]: Активирован коралловый цвет");
				}
			case 17:
				{
					SetPlayerColor(playerid,0xFF4500AA);
					SendClientMessage(playerid, COLOR_GREEN, "[ZiDrift]: Активирован красно-оранжевый цвет");
				}
			case 18:
				{
					SetPlayerColor(playerid,0xFFFFFF00);
					SendClientMessage(playerid, COLOR_GREEN, "[ZiDrift]: Активирован режим невидимости");
				}
			}
		}
	}
	return 0;
}

public Check()
{
	for(new i=0;i<MAX_PLAYERS;i++)
	if(IsPlayerConnected(i))
	{
		m[i]=0;
		if (m[i] > 0)
		{
			h[i]++; m[0] = 0;
			if(h[i] > 23) h[0] = 0;
		}
	}
}

public Countdown()
{
	for(new i=0;i<MAX_PLAYERS;i++)
	if(IsPlayerConnected(i))
	{
		if(countdown[i]>0)
		{
			countdown[i]-=1;
			new str[6];
			format(str,6,"...%d",countdown[i]);
			GameTextForPlayer(i,str,950,4);
			PlayerPlaySound(i,1056,0.0,0.0,0.0);
			if(countdown[i]<4)TogglePlayerControllable(i,0);
		}
		if(countdown[i]==0)
		{
			TogglePlayerControllable(i,1);
			GameTextForPlayer(i,"~r~ZiDrift",500,4);
			PlayerPlaySound(i,1057,0.0,0.0,0.0);
			countdown[i]=-1;
		}
	}
}


dcmd_dt(playerid, params[])
{
	new str[64];
	if (!strlen(params)) return SendClientMessage(playerid, 0xFF0000AA, "[ZiDrift]: /dt [мир]"); //Grey colour
	if (strval(params) < 0) return SendClientMessage(playerid, 0xFF0000AA, "[ZiDrift]: Число должно быть больше нуля"); //Grey colour
	new ii = strval(params);
	SetPlayerVirtualWorld(playerid,ii);
	format(str,64,"[ZiDrift]: Ваш мир изменён на %d",ii);
	SendClientMessage(playerid, 0x00FF00AA,str); //Grey colour
	if(ii!=0)return SendClientMessage(playerid, 0x00FF00AA, "[ZiDrift]: Вы в режиме дрифт тренировки"); //Grey colour
	SendClientMessage(playerid, 0x00FF00AA, "[ZiDrift]: Режим дрифт тренировки выключен"); //Grey colour
	return 1;
}

stock GetSpeedKM(playerid)
{
	new
Float:PosX,
Float:PosY,
Float:PosZ,
Float:PlayerSpeedDistance;

	GetVehicleVelocity(GetPlayerVehicleID(playerid), PosX, PosY, PosZ);
	PlayerSpeedDistance = floatmul(floatsqroot(floatadd(floatadd(floatpower(PosX, 2), floatpower(PosY, 2)),  floatpower(PosZ, 2))), 170.0);
	new spe = floatround(PlayerSpeedDistance * 1);
	return spe;
}

stock strrest(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}
	new offset = index;
	new result[128];
	while ((index < length) && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}

stock strtok(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}

	new offset = index;
	new result[20];
	while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}
public settime(playerid)
{
	new string[256],year,month,day,hours,minutes,seconds;
	getdate(year, month, day), gettime(hours, minutes, seconds);
	format(string, sizeof string, "%s%d:%s%d:%s%d", (hours < 10) ? ("0") : (""), hours, (minutes < 10) ? ("0") : (""), minutes, (seconds < 10) ? ("0") : (""), seconds);
	TextDrawSetString(Times, string);
}
public Reklama()
{
	switch(random(7))
	{
	case 0: SendClientMessageToAll(COLOR_GREEN,"Администрация сервера желает вам приятной игры!");
	case 1: SendClientMessageToAll(COLOR_GREEN,"Для вызова меню нажмите ALT (пешком) или 2 (В транспорте)");
	case 2: SendClientMessageToAll(COLOR_GREEN,"Чтобы узнать, какие сейчас админы в сети - введите /admins");
	case 3: SendClientMessageToAll(COLOR_GREEN,"Для вызова помощи введите /help");
	case 4: SendClientMessageToAll(COLOR_GREEN,"Наша группа ВК vk.com/zidrift ");
	case 5: SendClientMessageToAll(COLOR_GREEN,"Наш IP: 127.0.0.1:7777");
	case 6: SendClientMessageToAll(COLOR_GREEN,"Дешевый донат! Подробности в группе ВК.");
	}
}
