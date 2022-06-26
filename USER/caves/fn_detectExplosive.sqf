if (isServer) then {

    ["ace_explosives_detonate", {
        params ["_unit", "_item1", "_item2"];

        private _rock = missionNamespace getVariable ["fallingRock1", objNull];
        if (isNull _rock) exitWith {}; // if rock gets deleted
        
        if (!(_rock getVariable ["EL_rockDropped", false])) exitWith {};

        if (_item1 distance _rock < 10) then {
            call grad_caves_fnc_rockDestruction;
        };
    }] call CBA_fnc_addEventHandler;

};
