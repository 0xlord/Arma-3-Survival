#include "..\..\Headers\descriptionEXT\GUI\musicManagerCommonDefines.hpp"
/* ----------------------------------------------------------------------------
Function: BLWK_fnc_musicManagerOnLoad_addAndRemoveButtons

Description:
	Adds button pressed events to the add and remove from current playlist buttons.

Parameters:
	0: _addButtonControl : <CONTROL> - The control for the add to playlist button
	1: _removeButtonControl : <CONTROL> - The control for the remove from playlist button

Returns:
	NOTHING

Examples:
    (begin example)
		[_addToButtonControl,_removeFromButtonControl] call BLWK_fnc_musicManagerOnLoad_addAndRemoveButtons;
    (end)

Author(s):
	Ansible2 // Cipher
---------------------------------------------------------------------------- */
disableSerialization;
scriptName "BLWK_fnc_musicManagerOnLoad_addAndRemoveButtons";

params ["_addButtonControl","_removeButtonControl"];

_addButtonControl ctrlAddEventHandler ["ButtonClick", {
	private _selectedTrackIndexes = uiNamespace getVariable ["BLWK_musicManager_selectedAvailableTrackIndexes",[]];

	if (_selectedTrackIndexes isEqualTo []) then {
		["You need to have a selection made from the available songs list"] call KISKA_fnc_errorNotification;

	} else {
		private _availableMusicListControl = uiNamespace getVariable "BLWK_musicManager_control_availableSongsList";
		
		_selectedTrackIndexes apply {
			private _songClassName = _availableMusicListControl lnbData [_x,0];
			[TO_STRING(BLWK_PUB_CURRENT_PLAYLIST),_songClassName] remoteExecCall ["KISKA_fnc_pushBackToArray",0,true];
		};

	};

}];

_removeButtonControl ctrlAddEventHandler ["ButtonClick", {
	private _selectedTrackIndexes = uiNamespace getVariable ["BLWK_musicManager_selectedCurrentTrackIndexes",[]];
	if (_selectedTrackIndexes isEqualTo []) then {
		["You need to have a selection made from the Current Playlist"] call KISKA_fnc_errorNotification;

	} else {
		_selectedTrackIndexes apply {
			[TO_STRING(BLWK_PUB_CURRENT_PLAYLIST),_selectedIndex] remoteExecCall ["KISKA_fnc_deleteAtArray",0,true];
		};

	};
}];


nil
