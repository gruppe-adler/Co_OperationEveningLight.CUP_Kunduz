params ["_vehicle"];

removeAllWeapons _vehicle;
removeAllItems _vehicle;
removeAllAssignedItems _vehicle;
removeUniform _vehicle;
removeVest _vehicle;
removeBackpack _vehicle;
removeHeadgear _vehicle;
removeGoggles _vehicle;



_vehicle addMagazineGlobal ["rhsusf_100Rnd_762x51_m62_tracer", 20];
_vehicle addMagazineGlobal ["rhsusf_200Rnd_556x45_M855_mixed_soft_pouch_coyote", 20];
_vehicle addMagazineGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Ranger_Tracer_Red", 50];

_vehicle addMagazineGlobal ["rhs_ec75_mag", 10];


_vehicle addMagazineGlobal ["HandGrenade", 10];
_vehicle addMagazineGlobal ["SmokeShell", 10];
_vehicle addMagazineGlobal ["SmokeShellGreen", 10];
_vehicle addMagazineGlobal ["SmokeShellRed", 10];


_vehicle addMagazineGlobal ["1Rnd_Smoke_Grenade_shell", 10];
_vehicle addMagazineGlobal ["1Rnd_SmokeBlue_Grenade_shell", 10];
_vehicle addMagazineGlobal ["1Rnd_SmokeRed_Grenade_shell", 10];
