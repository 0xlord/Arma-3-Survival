/* ----------------------------------------------------------------------------
Function: CBAP_fnc_simplifyAngle

Description:
    Returns an equivalent angle to the specified angle in the range 0 to 360.
    If the input angle is in the range 0 to 360, it will be returned unchanged.

Parameters:
    0: _angle : <NUMBER> - The degree of the angle you want to simplify

Returns:
    NUMBER - Simplified angle

Examples:
   (begin example)
   _angle = [912] call CBAP_fnc_simplifyAngle;
   (end)

Author:
    SilentSpike 2015-27-07
	Modified by: Ansible2 // Cipher
---------------------------------------------------------------------------- */
params ["_angle"];

// Return simplified angle
((_angle % 360) + 360) % 360