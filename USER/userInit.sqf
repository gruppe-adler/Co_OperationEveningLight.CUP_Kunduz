/*
*   Wird zum Missionsstart auf Server und Clients ausgeführt.
*   Funktioniert wie die init.sqf.
*/

setApertureNew [2.6, 5, 10, 1];


["CAManBase", "init", {
    
    private _unit = (_this select 0);
    
    if (side _unit == east) then {
        _unit addGoggles "CUP_Beard_Black";
    };

}] call CBA_fnc_addClassEventHandler;
