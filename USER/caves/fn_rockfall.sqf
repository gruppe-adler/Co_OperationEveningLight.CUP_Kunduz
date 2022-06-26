/*

    [fallingRock1] execVM "USER\caves\rockfall.sqf";

*/


private _rocks = [
    fallingRock1,
    fallingRock2,
    fallingRock3
];


private _firstRock = _rocks#0;

[getPos _firstRock, _firstRock, 3, 2] remoteExec ["GRAD_caves_fnc_rockshower", 0];

sleep 3;

{

    private _rock = _x;
    private _vecDir = vectorDir _rock;
    private _vecUp = vectorUp _rock;
    private _pos = getPosASL _rock;

    private _pen = "Land_PencilRed_F" createVehicle [0,0,0];
    // hideObject _pen;
    _pen setPosASL [_pos#0, _pos#1, (_pos#2) - 1];
    _rock attachTo [_pen, [0,0,_forEachIndex]];

} forEach _rocks;



_firstRock addEventHandler ["Explosion", {
    params ["_vehicle", "_damage", "_source"];

    systemChat "Explosion";

    _vehicle removeEventHandler _this;
}];

/*
[
    {
        params ["_rock", "_pen"];
        private _height = (getPosASL _rock) # 2;
        _height < 290.187
    },
    {
        params ["_rock", "_pen"];
    },
    [_localRock, _pen]
] call CBA_fnc_waitUntilAndExecute;
*/