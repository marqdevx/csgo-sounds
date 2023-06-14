#include <sourcemod>
#include <sdktools>

#pragma semicolon 1
#pragma newdecls required

#define VERSION "1.0.0"

public Plugin myinfo =
{
	name		= "CS:GO Sounds",
	author		= "marqdevx",
	description = "",
	version		= VERSION,
	url			= "https://github.com/marqdevx/sm-plugins"


}

public void
	OnPluginStart()
{
	RegAdminCmd("sm_dog", command_dog, ADMFLAG_GENERIC, "Play dog sound");
}

public void OnMapStart()
{
	// AddFileToDownloadsTable("ambient/ambient/creatures/dog_bark_close_01.wav");
	PrecacheSound("ambient/creatures/dog_bark_close_01.wav", true);
	PrecacheSound("ambient/creatures/dog_bark_close_02.wav", true);
	PrecacheSound("ambient/creatures/dog_bark_close_03.wav", true);
	PrecacheSound("ambient/creatures/dog_bark_close_04.wav", true);
	PrecacheSound("ambient/creatures/dog_bark_close_05.wav", true);
	PrecacheSound("ambient/creatures/dog_bark_close_06.wav", true);
	PrecacheSound("ambient/creatures/dog_bark_close_07.wav", true);
	/*
	ambient/creatures/chicken_panic_04.wav
    ambient/creatures/chicken_panic_03.wav
    ambient/creatures/chicken_panic_02.wav
    ambient/creatures/chicken_panic_01.wav
	*/
}

public void play_sound(int client, char file[12]){

}
public void play_dog(int client)
{
	char randomSound[128] = "";
	IntToString(GetRandomInt(1, 7), randomSound, 256);

	char soundFile[128] = "ambient/creatures/dog_bark_close_0";
	StrCat(soundFile, 256, randomSound);
	StrCat(soundFile, 256, ".wav");

	// PrintToChat(client, soundFile);
	EmitSoundToClient(client, soundFile);
	return;
}

public void play_chicken(int client)
{
	char randomSound[128] = "";
	IntToString(GetRandomInt(1, 4), randomSound, 256);

	char soundFile[128] = "ambient/creatures/chicken_panic_0";
	StrCat(soundFile, 256, randomSound);
	StrCat(soundFile, 256, ".wav");

	// PrintToChat(client, soundFile);
	EmitSoundToClient(client, "ambient/creatures/chicken_panic_01.wav");
	return;
}

public Action command_dog(int client, int args)
{
	play_dog(client);
	return Plugin_Handled;
}

// Custom chat commands with dot prefix
public void OnClientSayCommand_Post(int client, const char[] command, const char[] sArgs)
{
	/*if (!CheckCommandAccess(client, "sm_dog", ADMFLAG_GENERIC))
	{
		return;
	}*/

	if (StrEqual(sArgs, ".dog", false))
	{
		play_dog(client);
    }else 	if (StrEqual(sArgs, ".chicken", false))
	{
		play_chicken(client);
	}
}
