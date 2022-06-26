/*
    
    [fallingRock1, 3, 2] execVM "USER\caves\rockshower.sqf";

*/


params ["_pos", ["_obj", objNull], ["_lifetime", 10], ["_showerTime", 2], ["_camShake", [0,0,0]], ["_dropInterval", 0.04]];

_PS = "#particlesource" createVehicleLocal _pos;
_PS setPos _pos;
// _PS setParticleCircle [1, [0, 0, 0]];
_PS setParticleRandom [
    /*0*/ 0,
    /*1*/ [2, 2, 0],
    /*2*/ [0.25, 0.25, 0],
    /*3*/ 0,
    /*4*/ 1,
    /*5*/ [0, 0, 0, 0],
    /*6*/ 0,
    /*7*/ 0
];
_PS setParticleParams [
    /*0*/  ["\A3\Rocks_F_Exp\Cliff\Cliff_wall_round_F.p3d", 8, 3, 1],
    /*1*/  "",
    /*2*/  "SpaceObject",
    /*3*/  1,
    /*4*/  _lifetime,
    /*5*/  [0, 0, 0],
    /*6*/  [0, 0, -2],
    /*7*/  1,
    /*8*/  10,
    /*9*/  1,
    /*10*/ 0.2,
    /*11*/ [0.006, 0.006],
    /*12*/ [[1, 1, 1 ,1], [1, 1, 1, 1], [1, 1, 1, 1]],
    /*13*/ [0, 1],
    /*14*/ 1, 
    /*15*/ 0,
    /*16*/ "",
    /*17*/ "",
    /*18*/ _obj,
    /*19*/ 0,
    /*20*/ true,
    /*21*/ 0.1
];
_PS setDropInterval _dropInterval;

if (_camShake isNotEqualTo [0,0,0]) then {
    enableCamShake true;
    addCamShake _camShake;
};

[
    {
        params ["_source"];
        deleteVehicle _source;
    },
    [_PS],
    _showerTime
] call CBA_fnc_waitAndExecute;