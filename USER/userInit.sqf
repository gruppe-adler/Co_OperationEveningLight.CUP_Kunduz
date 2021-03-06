/*
*   Wird zum Missionsstart auf Server und Clients ausgeführt.
*   Funktioniert wie die init.sqf.
*/


if (hasInterface) then {


    if (!weaponLowered player) then {
        player action ["WeaponOnBack", player];
    };


    ["ace_unconscious", {
        params ["_unit", "_state"];

        // execute only when event is fired locally
        if (player isEqualTo _unit) then {
            [{
                if (_state) then {
                    ["missionControl_curatorInfo", [_unit, "unconscious"]] call CBA_fnc_serverEvent;
                } else {
                    ["missionControl_curatorInfo", [_unit, "wokeup"]] call CBA_fnc_serverEvent;
                };
            },[_unit,_state], 1] call CBA_fnc_waitAndExecute;
        };
    }] call CBA_fnc_addEventHandler;
};


if (isServer) then {


    ["CAManBase", "init", {
        
        private _unit = (_this select 0);
        
        if (side _unit == east) then {
            _unit addGoggles "CUP_Beard_Black";
        };

        if ((side _unit) != west) then {
            [_unit] call grad_ambient_fnc_addApacheDestruction;
            [_unit, selectRandom ["Male01PER", "Male02PER", "Male03PER"]] remoteExec ["setSpeaker", 0, true];
        };    

    }, true, [], true] call CBA_fnc_addClassEventHandler;


    [{
        dayTime < 19.5
    },{
        setTimeMultiplier 1;
    }] call CBA_fnc_waitUntilAndExecute;

    [{
        dayTime > 19.5
    },{
        setTimeMultiplier 6;
        setApertureNew [2.6, 5, 10, 1];
    }] call CBA_fnc_waitUntilAndExecute;

    [{
        dayTime > 23.5
    },{
        setTimeMultiplier 1;
    }] call CBA_fnc_waitUntilAndExecute;


    ["missionControl_curatorInfo", {
        params ["_unit", "_type"];

        private _message = "";
        private _color = [0,0,0,1];

        switch (_type) do {
            case ("spectating"): {
                _message = format ["%1 choose spectator.", [_unit, false, true] call ace_common_fnc_getName];
                _color = [0.5,0.1,0.1,1];
            };
            case ("unconscious"): {
                _message = format ["%1 was knocked out.", [_unit, false, true] call ace_common_fnc_getName];
                _color = [0.5,0.1,0.1,1];
            };
            case ("respawned"): {
                _message = format ["%1 respawned.", [_unit, false, true] call ace_common_fnc_getName];
                _color = [0.1,0.5,0.1,1];
            };
            case ("wokeup"): {
                _message = format ["%1 woke up.", [_unit, false, true] call ace_common_fnc_getName];
                _color = [0.1,0.5,0.1,1];
            };
            case ("killed"): {
                _message = format ["%1 killed.", [_unit, false, true] call ace_common_fnc_getName];
                _color = [0.7,0.1,0.1,1];
            };
            default {};
        };

        // send message to all curators
        {
            private _playerAsZeus = getAssignedCuratorUnit _x;
            if (!isNull _playerAsZeus) then {
                [_message, _color] remoteExec ["missionControl_fnc_curatorShowFeedbackMessage", _playerAsZeus];
            };
        } forEach allCurators;
    }] call CBA_fnc_addEventHandler;


    {
        private _unit = _x;
        _unit addMPEventHandler ["MPKilled", {
        params ["_unit", "_killer", "_instigator", "_useEffects"];
            
            if (!isServer) exitWith {};

            ["missionControl_curatorInfo", [_unit, "killed"]] call CBA_fnc_serverEvent;
        }];

    } forEach (playableUnits + switchableUnits);
};