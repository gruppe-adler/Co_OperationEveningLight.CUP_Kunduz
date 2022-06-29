params ["_carpet"];


_carpet addAction
[
    "Move Rug",    // title
    {
        params ["_target", "_caller", "_actionId", "_arguments"]; // script

        _target setPos (_target getPos [1, [random 360]]);
        systemChat "nothing";

        _target setVariable ["EL_rugMoved", true, true];
    },
    nil,        // arguments
    1.5,        // priority
    true,       // showWindow
    true,       // hideOnUse
    "",         // shortcut
    "!(_target getVariable ['EL_rugMoved', false])",     // condition
    2.5,         // radius
    false,      // unconscious
    "",         // selection
    ""          // memoryPoint
];