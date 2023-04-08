
for "_i" from 1 to 27 do {  
  
	private _position = getMarkerPos ("mrk_river_" + str _i); 
	_position set [2, 3.2];

	private _risenRiver = createVehicle ["HAG_Pond_Big_01", [0,0,0], [], 0, "NONE"]; 
	
	_risenRiver setVectorUp [0,0,1];
	_risenRiver setPosWorld _position;
	
};
