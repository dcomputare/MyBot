    // Record destruction in killlog
    // argument0: The owner of the destroyed building
    // argument1: The killer
    // argument2: The healer, or -1 for no assist
    // argument3: The source of the damage (e.g. WEAPON_SCATTERGUN)
      
        with (KillLog) {
            map = ds_map_create();
            var killer;
            killer = string_copy(argument1.name, 1, 20);
            if (argument2 != -1)
                killer += " + " + string_copy(argument2.name, 1, 20);
            ds_map_add(map, "name1", killer);
            ds_map_add(map, "team1", argument1.team);           
            ds_map_add(map, "name2", "Autogun (" + string_copy(argument0.name, 1, 20) + ")");
            ds_map_add(map, "team2", argument0.team);
            
            if (argument0 == global.myself || argument1 == global.myself || argument2 == global.myself) 
                ds_map_add(map, "inthis", true);
            else ds_map_add(map, "inthis", false);
            ds_map_add(map, "string", "");
            
            switch(argument3) {
                case WEAPON_NEEDLEGUN:
                    ds_map_add(map, "weapon", NeedleKL);
                    break;
                case WEAPON_RIFLE:
                    ds_map_add(map, "weapon", RifleKL);
                    break;
                case WEAPON_RIFLE_CHARGED:
                    ds_map_add(map, "weapon", RifleChargedKL);
                    break;
                case WEAPON_MINEGUN:
                    ds_map_add(map, "weapon", MineKL);
                    break;
                case WEAPON_MINIGUN:
                    ds_map_add(map, "weapon", MinigunKL);
                    break;
                case WEAPON_FLAMETHROWER:
                    ds_map_add(map, "weapon", FlameKL);
                    break;
                case WEAPON_SCATTERGUN:
                    ds_map_add(map, "weapon", ScatterKL);
                    break;
                case WEAPON_SHOTGUN:
                    ds_map_add(map, "weapon", ShotgunKL);
                    break;
                case WEAPON_QROCKETLAUNCHER:
                    ds_map_add(map, "weapon", QRlauncherS);
                    break;
                case WEAPON_ROCKETLAUNCHER:
                    ds_map_add(map, "weapon", RocketKL);
                    break;
                case WEAPON_REVOLVER:
                    ds_map_add(map, "weapon", RevolverKL);
                    break;
                case WEAPON_SENTRYTURRET:
                    ds_map_add(map, "weapon", TurretKL);
                    break;
                case WEAPON_BLADE:
                    ds_map_add(map, "weapon", BladeKL);
                    break;
                case WEAPON_BUBBLE:
                    ds_map_add(map, "weapon", BubbleKL);
                    break;
                case WEAPON_REFLECTED_ROCKET:
                    ds_map_add(map, "weapon", RocketReflectKL);
                    break;
                case WEAPON_REFLECTED_STICKY:
                    ds_map_add(map, "weapon", MineReflectKL);
                    break; 
                case WEAPON_BACKSTAB:                   
                case WEAPON_KNIFE:
                    ds_map_add(map, "weapon", KnifeKL);
                    break;  
                case WEAPON_FLARE:
                    ds_map_add(map, "weapon", FlareKL);
                    break;
                case WEAPON_REFLECTED_FLARE:
                    ds_map_add(map, "weapon", FlareReflectKL);
                    break;            
                case FINISHED_OFF:
                case FINISHED_OFF_GIB:
                    ds_map_add(map, "weapon", DeadKL);
                    ds_map_replace(map, "string", "finished off ");
                    break;
                case BID_FAREWELL:
                    ds_map_add(map, "weapon", DeadKL);
                    ds_map_replace(map, "string", string_copy(argument0.name, 1, 20) + " bid farewell, cruel world!");
                    ds_map_replace(map, "name2", "");
                    ds_map_replace(map, "team2", 0);
                    break;
                case GENERATOR_EXPLOSION:
                    ds_map_add(map, "weapon", ExplodeKL);

                default:
                    ds_map_add(map, "weapon", DeadKL);
                    break;            
            }
            
            ds_list_add(kills, map);
            
            if (ds_list_size(kills) > 5) {
                ds_map_destroy(ds_list_find_value(kills, 0));
                ds_list_delete(kills, 0);
            }
            
            alarm[0] = 30*5;
        }
