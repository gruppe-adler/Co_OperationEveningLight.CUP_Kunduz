params ["_unit"];


private _house = (getPos _unit) nearObjects ["Land_jbad_House2_basehide", 20];

if (count _house > 0) then { _house = _house#0; } else { objNull };

if (isNull _house) exitWith { hint "panic"; };


[{
    params ["_args", "_handle"];
    _args params ["_unit", "_house"];

    if (!captive _unit) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    private _yell = random 2 > 1;

    if ((_house animationphase "rug_rot") == 0) then {
        if (_yell) then {
            private _sound = selectRandom ["yell1_muffled", "yell2_muffled"];
            [_unit, [_sound, 150, 1, true]] remoteexec ["say3d", 0];
        };
    } else {
        if (_yell) then {
            private _sound = selectRandom ["yell1_unmuffled", "yell2_unmuffled"];
            [_unit, [_sound, 150, 1, true]] remoteexec ["say3d", 0];
        };
    };
    
}, 1, [_unit, _house]] call CBA_fnc_addPerFramehandler;
