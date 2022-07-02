[] spawn {
  waitUntil {!isNull player};
  waitUntil {  time > 3 };

  {
    private _curator = _x;
    
      _curator addEventHandler ["CuratorGroupPlaced", {
          params ["", "_group"];

          { 
              _x setSkill ["aimingAccuracy", 0.3];
              _x setSkill ["aimingShake", 0.2]; 
              _x setSkill ["aimingSpeed", 0.9]; 
              _x setSkill ["endurance", 0.6]; 
              _x setSkill ["spotDistance", 1]; 
              _x setSkill ["spotTime", 0.9]; 
              _x setSkill ["courage", 1]; 
              _x setSkill ["reloadSpeed", 1]; 
              _x setSkill ["commanding", 1];
              _x setSkill ["general", 1];

              _x addGoggles "CUP_Beard_Black";
          } forEach units _group;

          ["GRAD_missionControl_setServerAsOwner", [_group]] call CBA_fnc_serverEvent;
      }];

      _curator addEventHandler ["CuratorObjectPlaced", {
          params ["", "_object"];
          
          _object setSkill ["aimingAccuracy", 0.3];
          _object setSkill ["aimingShake", 0.2]; 
          _object setSkill ["aimingSpeed", 0.9]; 
          _object setSkill ["endurance", 0.6]; 
          _object setSkill ["spotDistance", 1]; 
          _object setSkill ["spotTime", 0.9]; 
          _object setSkill ["courage", 1]; 
          _object setSkill ["reloadSpeed", 1]; 
          _object setSkill ["commanding", 1];
          _object setSkill ["general", 1];

          if (_object isKindOf "CAManBase") then {
             if (count units _object == 1) then {
                 ["GRAD_missionControl_setServerAsOwner", [group _object]] call CBA_fnc_serverEvent;
             };
          } else {
             if (count crew _object > 1) then {
                 ["GRAD_missionControl_setServerAsOwner", [group (crew _object select 0)]] call CBA_fnc_serverEvent;
             };
         };

      }];

  } forEach allCurators;
};

["Evening Light - Enemies Cloaked", "Reinforcements North Squad", {
     params ["_position", "_object"];
     
     ["squad", true, "north"] remoteExec ["grad_zeusmodules_fnc_reinforcements", 2];
     
}] call zen_custom_modules_fnc_register;

["Evening Light - Enemies Open", "Reinforcements North Squad", {
     params ["_position", "_object"];
     
     ["squad", false, "north"] remoteExec ["grad_zeusmodules_fnc_reinforcements", 2];
     
}] call zen_custom_modules_fnc_register;


["Evening Light - Enemies Cloaked", "Reinforcements North Fireteam", {
     params ["_position", "_object"];
     
     ["fireteam", true, "north"] remoteExec ["grad_zeusmodules_fnc_reinforcements", 2];
     
}] call zen_custom_modules_fnc_register;

["Evening Light - Enemies Open", "Reinforcements North Fireteam", {
     params ["_position", "_object"];
     
     ["fireteam", false, "north"] remoteExec ["grad_zeusmodules_fnc_reinforcements", 2];
     
}] call zen_custom_modules_fnc_register;


["Evening Light - Enemies Cloaked", "Reinforcements North specialteam", {
     params ["_position", "_object"];
     
     ["specialteam", true, "north"] remoteExec ["grad_zeusmodules_fnc_reinforcements", 2];
     
}] call zen_custom_modules_fnc_register;

["Evening Light - Enemies Open", "Reinforcements North specialteam", {
     params ["_position", "_object"];
     
     ["specialteam", false, "north"] remoteExec ["grad_zeusmodules_fnc_reinforcements", 2];
     
}] call zen_custom_modules_fnc_register;


["Evening Light - Enemies Cloaked", "Reinforcements North heavy", {
     params ["_position", "_object"];
     
     ["heavy", true, "north"] remoteExec ["grad_zeusmodules_fnc_reinforcements", 2];
     
}] call zen_custom_modules_fnc_register;

["Evening Light - Enemies Open", "Reinforcements North heavy", {
     params ["_position", "_object"];
     
     ["heavy", false, "north"] remoteExec ["grad_zeusmodules_fnc_reinforcements", 2];
     
}] call zen_custom_modules_fnc_register;



["Evening Light - Captive", "Start Screaming", {
     params ["_position", "_object"];
     
     call grad_captive_fnc_yellStuff;
     
}] call zen_custom_modules_fnc_register;

["Evening Light - Captive", "Stop Screaming", {
     params ["_position", "_object"];
     
     if (!isNull captive_compound2) then {
          captive_compound2 setVariable ['EL_yelling', true, true];
     };
     
}] call zen_custom_modules_fnc_register;



     ["Evening Light - Ambient", "Music Radio",
    {
      // Get all the passed parameters
      params ["_position", "_object"];
      _position = ASLToAGL _position;

      private _radio = (selectRandom ["land_gm_euro_furniture_radio_01", "jbad_radio_b", "Land_FMradio_F"]) createVehicle [0,0,0];
      _radio setPos _position;

      private _source = createSoundSource [selectRandom ["music1", "music2", "arabicmusic1", "arabicmusic2"], _position, [], 0];
      [_source, _radio, false] call grad_ambient_fnc_soundSourceHelper;
      
      {
        _x addCuratorEditableObjects [[_radio], false];
      } forEach allCurators;

    }] call zen_custom_modules_fnc_register;



["Evening Light - Ambient", "Suicide Car Spawn",
    {
      params ["_position", "_object"];
      _position = ASLToAGL _position;

      [_position] remoteExec ["grad_ambient_fnc_suicideCar", 2];

    }] call zen_custom_modules_fnc_register;