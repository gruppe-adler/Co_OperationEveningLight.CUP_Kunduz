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

              _x addCuratorEditableObjects [[_object], true];
          } forEach units _group;
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

          _curator addCuratorEditableObjects [[_object], true];

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
