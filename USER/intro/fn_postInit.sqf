
if (isServer && isMultiplayer) then {

    [{
        
        [] call grad_intro_fnc_introServer;

    }, [], 10] call CBA_fnc_waitAndExecute;

};


if (hasInterface && isMultiplayer) then {
    "introBlackLoading" cutText ["", "BLACK", 999999];
};