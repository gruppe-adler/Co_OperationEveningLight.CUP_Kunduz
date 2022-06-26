/*

    [fallingRock1] execVM "USER\caves\rockfall.sqf";

*/


private _rocks = [
    fallingRock1,
    fallingRock2,
    fallingRock3
];


private _firstRock = _rocks#0;

[getPos _firstRock, _firstRock, 3, 2] execVM "USER\caves\rockshower.sqf";

if (player distance _firstRock < 50) then {
    [2] spawn BIS_fnc_earthquake;
};

sleep 3;

{

    private _localRock = (typeOf _x) createVehicleLocal [0,0,0];
    private _vecDir = vectorDir _x;
    private _vecUp = vectorUp _x;
    private _pos = getPosASL _x;
    _localRock setPosASL _pos;
    _localRock setDir (getDir _x);
    _localRock setVectorDirAndUp [_vecDir, _vecUp];

    private _pen = "Land_PencilRed_F" createVehicleLocal [0,0,0];
    // hideObject _pen;
    _pen setPosASL [_pos#0, _pos#1, (_pos#2) - 1];
    _localRock attachTo [_pen, [0,0,_forEachIndex]];

} forEach _rocks;



private _source01 = "#particlesource" createVehicleLocal (position _firstRock);
_source01 setParticleClass "BombDust";
_source01 attachTo [_firstRock, [0,0,0]];

private _source02 = "#particlesource" createVehicleLocal (position _firstRock);
_source02 setParticleClass "MineCircleDust";
_source02 attachTo [_firstRock, [0,0,0]];

_firstRock say3D "rocksFalling_4";

sleep 1;

deleteVehicle _source01;
deleteVehicle _source02;

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