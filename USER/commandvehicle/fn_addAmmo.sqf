params ["_vehicle"];

removeAllWeapons _vehicle;
removeAllItems _vehicle;
removeAllAssignedItems _vehicle;
removeUniform _vehicle;
removeVest _vehicle;
removeBackpack _vehicle;
removeHeadgear _vehicle;
removeGoggles _vehicle;



_vehicle addMagazineCargoGlobal ["rhsusf_100Rnd_762x51_m62_tracer", 20];
_vehicle addMagazineCargoGlobal ["rhsusf_200Rnd_556x45_M855_mixed_soft_pouch_coyote", 20];
_vehicle addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Ranger_Tracer_Red", 50];

_vehicle addMagazineCargoGlobal ["rhs_ec75_mag", 10];


_vehicle addMagazineCargoGlobal ["HandGrenade", 10];
_vehicle addMagazineCargoGlobal ["SmokeShell", 10];
_vehicle addMagazineCargoGlobal ["SmokeShellGreen", 10];
_vehicle addMagazineCargoGlobal ["SmokeShellRed", 10];


_vehicle addMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell", 10];
_vehicle addMagazineCargoGlobal ["1Rnd_SmokeBlue_Grenade_shell", 10];
_vehicle addMagazineCargoGlobal ["1Rnd_SmokeRed_Grenade_shell", 10];
