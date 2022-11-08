//---------------------------------------------------
//         *****!Do not edit this file!*****
//---------------------------------------------------
//   ___  ___  _  __  __  __  __
//  | _ \|_  )(_)|  \/  ||  \/  |
//  |  _/ / /  _ | |\/| || |\/| |
//  |_|__/___|(_)|_|  |_||_|  |_|
//   / __| ___  __| | ___
//  | (__ / _ \/ _` |/ -_)
//  _\___|\___/\__,_|\___|     _     _           _
//  \ \ / /__ _  _ _ (_) __ _ | |__ | | ___  ___(_)
//   \ V // _` || '_|| |/ _` || '_ \| |/ -_)(_-< _
//    \_/ \__,_||_|  |_|\__,_||_.__/|_|\___|/__/(_)
//---------------------------------------------------
// Purpose: Here, we declare and set up almost
// every variable used throughout the P2:MM codebase.
//---------------------------------------------------

//---------------
// Classes
//---------------
class GlobalSpawnClass {
    useautospawn = false // Try To Make All Spawns Global
    usesetspawn = false // Use Set Spawnpoint

    // Set SpawnPoint
    setspawn = class {
        position = Vector(0,0,0)
        radius = 0
    }

    // Red's Default Spawn Parameters
    red = class {
        spawnpoint = Vector(0,0,0)
        rotation = Vector(0,0,0)
        velocity = Vector(0,0,0)
    }
    // Blue's Default Spawn Parameters
    blue = class {
        spawnpoint = Vector(0,0,0)
        rotation = Vector(0,0,0)
        velocity = Vector(0,0,0)
    }
}

//---------------
// Constants
//---------------
// enum is weird in VScript
const TEAM_SINGLEPLAYER = 0
const TEAM_SPECTATOR = 1
const TEAM_RED = 2
const TEAM_BLUE = 3

//---------------
// Booleans
//---------------
AllowColorIndicator <- true // By default unless specified in mapsupport
AllowNametags <- true // By default unless specified in mapsupport
CanCheckAngle <- false
CanHook <- false
CheatsOn <- false
CoordsAlternate <- false

DevModeConfig <- Config_DevMode

DoneCacheing <- false
DoneWaiting <- false
fogs <- false
GlobalOverridePluginGrabController <- true // By default unless specified in mapsupport
HasSpawned <- false

IsOnSingleplayerMaps <- false
if (GetMapName().len() >= 7 && GetMapName().slice(0, 7) != "mp_coop") {
    IsOnSingleplayerMaps = true
}

MadeSpawnClass <- false
OrangeCacheFailed <- false
Player2Joined <- false
PostMapSpawnDone <- false
PermaPotato <- false
StartDevModeCheck <- false
usefogcontroller <- false

//---------------
// Ints/Floats
//---------------
amtoffsetclr <- 0
cacheoriginalplayerposition <- 0
EntityCap <- 2000
EntityCapLeeway <- 20
FailsafeEntityCap <- 2010
looptime <- 0.1 // Amount of time in seconds to call Loop() consecutively
PlayerID <- 0
PreviousNametagItter <- 0
PreviousTime1Sec <- 0
PreviousTime5Sec <- 0

if (Config_RandomPortalSize) {
    randomportalsize <- 34
    randomportalsizeh <- 34
}

TickSpeed <- 0.00
TotalRemovedEnts <- 0

//---------------
// Arrays/Tables
//---------------
ConsoleAscii <- [
"\n",
"██████╗░░█████╗░██████╗░████████╗░█████╗░██╗░░░░░░░░░░██████╗░",
"██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗██║░░░░░░░░░░╚════██╗",
"██████╔╝██║░░██║██████╔╝░░░██║░░░███████║██║░░░░░░░░░░░░███╔═╝",
"██╔═══╝░██║░░██║██╔══██╗░░░██║░░░██╔══██║██║░░░░░░░░░░██╔══╝░░",
"██║░░░░░╚█████╔╝██║░░██║░░░██║░░░██║░░██║███████╗░░░░░███████╗",
"╚═╝░░░░░░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░╚═╝╚══════╝░░░░░╚══════╝",
"",
"░░░░░░███╗░░░███╗██████╗░░░░░███╗░░░███╗░█████╗░██████╗░░░░░░░",
"░░░░░░████╗░████║██╔══██╗░░░░████╗░████║██╔══██╗██╔══██╗░░░░░░",
"░░░░░░██╔████╔██║██████╔╝░░░░██╔████╔██║██║░░██║██║░░██║░░░░░░",
"░░░░░░██║╚██╔╝██║██╔═══╝░░░░░██║╚██╔╝██║██║░░██║██║░░██║░░░░░░",
"░░░░░░██║░╚═╝░██║██║░░░░░░░░░██║░╚═╝░██║╚█████╔╝██████╔╝░░░░░░",
"░░░░░░╚═╝░░░░░╚═╝╚═╝░░░░░░░░░╚═╝░░░░░╚═╝░╚════╝░╚═════╝░░░░░░░",
"\n"
]
CurrentlyDead <- []
entityclasses <- []
EventList <- []
ExpendableEntities <- [
    "logic_auto",
    "logic_autosave",
    "env_viewpunch",
    "env_shake",
    "info_particle_system",
    "env_fog_controller",
    "env_fade",
    "func_areaportal",
    "env_soundscape",
    "ambient_generic",
    "prop_physics_paintable",
    "prop_physics",
    "prop_physics_override",
    "prop_physics_multiplayer",
    "prop_detail",
    "prop_dynamic_ornament",
    "prop_dynamic_override",
    "func_illusionary",
    "func_brush",
    "prop_weighted_cube",
    "func_detail"
]
if (GetMapName() == "mp_coop_credits") {
    MPMCoopCreditNames <- [ // Add names to coop credits map (Max per entry is 128)
        "### ",
        "###Portal 2: Multiplayer Mod ~ Credits",
        "### ",
        "###--------------------------",
        "###P2:MM Head Creators",
        "###--------------------------",
        "Nanoman2525 | Mapping + Minor Launcher + Main Mod Developer/Maintainer + Hex Edits + Community Manager + Major VScript",
        "kyleraykbs | Major VScript + Launcher + Alpha-stage full Cooperative Support",
        "Bumpy | Script Theory",
        "Vista | Reverse Engineering, Plugin Developer",
        "Wolƒe Strider Shoσter | Alpha-stage full Singleplayer Support",
        "cabiste | Mod Launcher Code Refactor + Minor VScript",
        "###--------------------------",
        "###P2:MM Team Members",
        "###--------------------------",
        "sear | Speedrun Mode Ideas + Heavy Playtesting",
        "Jeffrey | Previous Code Cleanup",
        "wanderer | Dedicated Server Functionality",
        "tnp|\\n|thewoodster75 | Heavy Playtesting",
        "Orsell | Custom Content Functionality + VScript",
        "###--------------------------",
        "###P2:MM Contributers",
        "###--------------------------",
        "Dreadnox | Speedrun Mode Ideas",
        "Enator18 | Python Ideas"
        "Blub/Vecc | Alpha-stage P2:MM Code Commenting",
        "Darnias | Alpha-stage P2:MM Jumpstarter Code",
        "PieCreeper | Promotion of the mod",
        "Mystical Λce | Helping us obtain keys to port the mod to P2:CE",
        "###--------------------------",
        "###Special Thanks To:",
        "###--------------------------",
        "SuperSpeed",
        "ANotSoSpookySkeleton",
        "Panter",
        "ThePineapple",
        "Areng",
        "SuperSpeed",
        "Brawler",
        "X man",
        "###--------------------------",
        "###Valve: Credits",
        "###--------------------------"
    ]
}
// NativeCoopMaps <- class {
//     // MULTIPLAYER MAPS
//     ch0maps = ["mp_coop_start", "mp_coop_community_hub"]
//     ch1maps = ["mp_coop_doors", "mp_coop_race_2", "mp_coop_laser_2", "mp_coop_rat_maze", "mp_coop_laser_crusher", "mp_coop_teambts"]
//     ch2maps = ["mp_coop_fling_3", "mp_coop_infinifling_train", "mp_coop_come_along", "mp_coop_fling_1", "mp_coop_catapult_1", "mp_coop_multifling_1", "mp_coop_fling_crushers", "mp_coop_fan"]
//     ch3maps = ["mp_coop_wall_intro", "mp_coop_wall_2", "mp_coop_catapult_wall_intro", "mp_coop_wall_block", "mp_coop_catapult_2", "mp_coop_turret_walls", "mp_coop_turret_ball", "mp_coop_wall_5"]
//     ch4maps = ["mp_coop_tbeam_redirect", "mp_coop_tbeam_drill", "mp_coop_tbeam_catch_grind_1", "mp_coop_tbeam_laser_1", "mp_coop_tbeam_polarity", "mp_coop_tbeam_polarity2", "mp_coop_tbeam_polarity3", "mp_coop_tbeam_maze", "mp_coop_tbeam_end"]
//     ch5maps = ["mp_coop_paint_come_along", "mp_coop_paint_redirect", "mp_coop_paint_bridge", "mp_coop_paint_walljumps", "mp_coop_paint_speed_fling", "mp_coop_red_racer", "mp_coop_speed_catch", "mp_coop_longjump_intro"]
//     ch6maps = ["mp_coop_separation_1", "mp_coop_tripleaxis", "mp_coop_catapult_catch", "mp_coop_2paints_1bridge", "mp_coop_paint_conversion", "mp_coop_bridge_catch", "mp_coop_laser_tbeam", "mp_coop_paint_rat_maze", "mp_coop_paint_crazy_box"]
// }
// NativeSPMaps <- class {
//     // SINGLEPLAYER MAPS
//     ch0maps = ["e1912"]
//     ch1maps = ["sp_a1_intro1", "sp_a1_intro2", "sp_a1_intro3", "sp_a1_intro4", "sp_a1_intro5", "sp_a1_intro6", "sp_a1_intro7", "sp_a1_wakeup", "sp_a1_intro"]
//     ch2maps = ["sp_a2_laser_intro", "sp_a2_laser_stairs", "sp_a2_dual_lasers", "sp_a2_laser_over_goo", "sp_a2_catapult_intro", "sp_a2_trust_fling", "sp_a2_pit_flings", "sp_a2_fizzler_intro"]
//     ch3maps = ["sp_a2_sphere_peek", "sp_a2_ricochet", "sp_a2_bridge_intro", "sp_a2_bridge_the_gap", "sp_a2_turret_intro", "sp_a2_laser_relays", "sp_a2_laser_vs_turret", "sp_a2_pull_the_rug"]
//     ch4maps = ["sp_a2_column_blocker", "sp_a2_laser_chaining", "sp_a2_triple_laser", "sp_a2_bts1", "sp_a2_bts2"]
//     ch5maps = ["sp_a2_bts3", "sp_a2_bts4", "sp_a2_bts5", "sp_a2_bts6", "sp_a2_core"]
//     ch6maps = ["sp_a3_00", "sp_a3_01", "sp_a3_03", "sp_a3_jump_intro", "sp_a3_bomb_flings", "sp_a3_crazy_box", "sp_a3_transition01"]
//     ch7maps = ["sp_a3_speed_ramp", "sp_a3_speed_flings", "sp_a3_portal_intro", "sp_a3_end"]
//     ch8maps = ["sp_a4_intro", "sp_a4_tb_intro", "sp_a4_tb_trust_drop", "sp_a4_tb_wall_button", "sp_a4_tb_polarity", "sp_a4_tb_catch", "sp_a4_stop_the_box", "sp_a4_laser_catapult", "sp_a4_laser_platform", "sp_a4_speed_catch", "sp_a4_jump_polarity"]
//     ch9maps = ["sp_a4_finale1", "sp_a4_finale2", "sp_a4_finale3", "sp_a4_finale4"]
//     ch10maps = ["sp_a5_credits"]
// }
playerclasses <- []
PrecachedProps <- []

//---------------
// Others
//---------------
LastCoordGetPlayer <- null
OriginalAngle <- null
OriginalPosMain <- null
setspot <- Vector(0, 0, 250) //Vector(5107, 3566, -250)
