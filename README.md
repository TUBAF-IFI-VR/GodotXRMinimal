# Godot XR Example
This is a minimal setup for an XR app using the Godot engine. Only the core functionality of the engine has been used. It contains a simple scene and is prepared for 2 controllers with a teleport function attached to the right controller.

## Usage
Run the app directly via SteamVR or export (remote debug) it for a standalone HMD. In the latter case make sure to setup Android SDK and check the OpenXR vendor plugin for deployment. For usage on HTC Focus 3 you could disable the used rigid bodies and/or switch to Compatibility renderer to improve the low performance. The app should run smooth on Pico 4 (Ultra) devices.

Teleportation is enabled using the trigger on both controllers. The B/Y buttons allow switching of AR/VR mode.

## Asset License
All third party assets are licensed as CC0. Enclosed you will find the original source URLs:

* https://polyhaven.com/a/floor_tiles_02
* https://polyhaven.com/a/wood_table_001
