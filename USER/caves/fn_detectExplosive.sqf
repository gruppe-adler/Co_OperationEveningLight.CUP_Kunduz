if (isServer) then {

    ["ace_explosives_detonate", {
        params ["_unit", "_item1", "_item2"];

        // falling rock handling
        private _rock = missionNamespace getVariable ["fallingRock1", objNull];
        if (!isNull _rock) then {
            if (!(_rock getVariable ["EL_rockDropped", false])) then {
                if (_item1 distance _rock < 10) then {
                    call grad_caves_fnc_rockDestruction;
                };
            };
        };

        // house door destruction handling
        private _nearestBuilding = nearestBuilding _unit;
        private _selections = selectionNames _nearestBuilding;
        private _distanceCache = 999;
        private _doorIndex = -1;
        
        {
            private _selection = _x;

            // find out distance vom explosive to door, save shortest
            if (["door", _selection] call BIS_fnc_inString) then {
                private _distance = (_nearestBuilding modelToWorld (_nearestBuilding selectionPosition _selection)) distance _item1;
                if (_distance < _distanceCache) then {
                    _distanceCache = _distance;
                    _doorIndex = _doorIndex + 1;

                    diag_log format ["distance explosive to door %1 of building %2", _distanceCache, _nearestBuilding];
                };
            };
        } forEach _selections;

        if (_doorIndex > -1) then {
           // _nearestBuilding animateSource [format ["Door_%1_locked_source", _door], (1 - (_structure animationSourcePhase (format ["Door_%1_locked_source", _door])))];
            // _nearestBuilding animateSource [format ["Door_%1_noSound_source", _doorIndex], 1];

            _nearestBuilding setVariable [format ["bis_disabled_Door_%1", _doorIndex], 0, true];
            
            // _nearestBuilding animateSource [format ["Door_%1_sound_source", _doorIndex], 1];
            _nearestBuilding animateSource [format ["Door_%1_noSound_source", _doorIndex], 1, true];
        };

    }] call CBA_fnc_addEventHandler;

};
