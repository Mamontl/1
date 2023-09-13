 if(strcmp(cmd, "/removevehicle", true) == 0)
        {
            if(IsPlayerConnected(playerid))
            {
                if(PlayerInfo[playerid][pAdminLevel] >= 6)
                {
                    if(gVehicleCreateCounter[playerid] != 0)
                    {
                        DestroyVehicle(gVehicleCreateMax[playerid][gVehicleCreateCounter[playerid]]);
                        gVehicleCreateCounter[playerid] -= 1;
                    }
                    else SendClientMessage(playerid, COLOR_GRAY, " * Весь созданный транспорт удалён!");
                }
                else SendClientMessage(playerid, COLOR_GRAY, " * У вас нет доступа к этой Команде!");
            }
            return 1;