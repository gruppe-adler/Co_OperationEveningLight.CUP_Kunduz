params ["_carpet"];

if (isServer) then {
    private _helper = "Land_PenBlack_F" createVehicle [0,0,0];

    _helper attachTo [_carpet, [0,0,0]];

    _helper setVariable ["EL_rug", _carpet, true];

    [_helper] remoteExec ["grad_captive_fnc_moveCarpetAction", 0, true];

};

