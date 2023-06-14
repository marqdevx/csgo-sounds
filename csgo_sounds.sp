#include <sourcemod>
#include <sdktools>

#pragma semicolon 1
#pragma newdecls required

#define VERSION "1.0.0"

public Plugin myinfo = {
    name = "CS:GO Sounds",
    author = "marqdevx",
    description = "",
    version = VERSION,
    url = "https://github.com/marqdevx/sm-plugins"}

public void OnPluginStart(){
    RegAdminCmd("sm_dog", command_dog, ADMFLAG_GENERIC, "Play dog sound");
}

public void OnMapStart() 
{ 
    //AddFileToDownloadsTable("ambient/ambient/creatures/dog_bark_close_01.wav");  
    PrecacheSound("ambient/creatures/dog_bark_close_01.wav", true);  
}

public void play_dog(int client){
    //PrintToChat(client, "Playing dog sound");
    EmitSoundToClient(client, "ambient/creatures/dog_bark_close_01.wav");  
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
	}
}
