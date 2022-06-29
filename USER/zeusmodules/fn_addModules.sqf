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

["Evening Light - Reinf", "Reinforcements North Technical", {
     params ["_position", "_object"];

     
     ["Technical"] remoteExec ["grad_zeusmodules_fnc_reinf_n", 2];
     
}] call zen_custom_modules_fnc_register;

["Evening Light - Reinf", "Reinforcements North Cloaked", {
     params ["_position", "_object"];

     
     ["Cloaked"] remoteExec ["grad_zeusmodules_fnc_reinf_n", 2];
     
}] call zen_custom_modules_fnc_register;