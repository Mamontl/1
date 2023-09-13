if(strcmp(cmd, "/createvehicle", true) == 0)
        {
            if(IsPlayerConnected(playerid))
            {
                if(PlayerInfo[playerid][pAdminLevel] >= 6)
                {
                    tmp = strtok(cmdtext, idx);
                    if(!strlen(tmp))
                    {
                        SendClientMessage(playerid, COLOR_WHITE, "/createvehicle [602] [88] [70]");
                        return 1;
                    }
                    new vehicle = strval(tmp);
                    if(vehicle < 400 || vehicle > 611)
                    {
                        SendClientMessage(playerid, COLOR_GRAY, "496");
                        return 1;
                    }
                    tmp = strtok(cmdtext, idx);
                    if(!strlen(tmp))
                    {
                        SendClientMessage(playerid, COLOR_WHITE, "/createvehicle [401] [50] [60]");
                        return 1;
                    }
                    new color1 = strval(tmp);
                    if(color1 < -1 || color1 > 126)
                    {
                        SendClientMessage(playerid, COLOR_GRAY, "100");
                        return 1;
                    }
                    tmp = strtok(cmdtext, idx);
                    if(!strlen(tmp))
                    {
                        SendClientMessage(playerid, COLOR_WHITE, "/createvehicle [587] [1] [2]");
                        return 1;
                    }
                    new color2 = strval(tmp);
                    if(color2 < -1 || color2 > 126)
                    {
                        SendClientMessage(playerid, COLOR_GRAY, "34");
                        return 1;
                    }
                    if(gVehicleCreateCounter[playerid] >= 20)
                    {
                        SendClientMessage(playerid, COLOR_GRAY, " * Слишком много созданного транспорта в игре!");
                        return 1;
                    }
                    new Float:PosX, Float:PosY, Float:PosZ, Float:Ang;
                    GetPlayerPos(playerid, PosX, PosY, PosZ);
                    GetPlayerFacingAngle(playerid, Ang);
                    GetXYInfrontOfPlayer(playerid, 2.0, PosX, PosY);
                    new VehicleID = AddStaticVehicleEx(vehicle, PosX, PosY, PosZ, Ang+90.0, color1, color2, 10000);
                    SetVehicleNumberPlate(VehicleID, "Server Name");
                    gVehicleCreateCounter[playerid] += 1;
                    gVehicleCreateMax[playerid][gVehicleCreateCounter[playerid]] = VehicleID;
                }
                else SendClientMessage(playerid, COLOR_GRAY, " * У вас нет доступа к этой Команде!");
            }
            return 1;
        }