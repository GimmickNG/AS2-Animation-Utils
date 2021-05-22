# AS2 Animation Utils
A set of components for AS2 based animation effects. **Compatible with Ruffle!**

## Effects
Clip shake:
- Shakes the target clip. 
- Can be set to `_root` to shake the whole screen.
- If you're using a vCam, use its variable name.
  - Note: This has not been tested.
  
Nested clip pause/play:
- Pauses the target clip and all clips inside the target clip (e.g. to achieve a "stun" effect.)
- Can be set to `_root` to pause and play everything.

## Installation instructions:
- Download the [latest release](https://github.com/GimmickNG/AS2-Animation-Utils/releases/latest)
- Extract zip file into the Components folder (e.g. in `%localappdata%\Adobe\Flash CS6\en_US\Configuration\Components`)
- Restart Flash
- The components can be found under "Standard Components" (names listed on right-hand side):
  - AnimUtils: `org.gimmick.utils.AnimUtils`
  - ClipShake: `org.gimmick.utils.auto.ClipShake`
  - ClipPausePlay: `org.gimmick.utils.auto.ClipPausePlay`

## Usage
- Drag the AnimUtils component onto a separate layer in the first frame of your FLA. **Do not add any keyframes on that layer - the layer should only consist of frames.**
- Drag the ClipShake or ClipPausePlay component onto the frame where you want a shake to start or a clip to be paused and played. 
- Edit the components' parameters in the section `Component Parameters` of the `Properties` panel.
- You can duplicate the ClipShake and ClipPausePlay components for a complex animation effect.
  - This has not been extensively tested, but it works.

## Notes
You may see a warning when selecting the AnimUtils component in the library, or when placing it on the Stage for the first time.
This is due to a limitation of Flash which causes conflicts when using a singleton component; you can safely ignore this warning while editing the file.
If you see the notice when previewing the animation, you may have multiple AnimUtils components on the Stage, or you may have keyframes on the AnimUtils layer.

The most major limitation is that you **cannot use this in clean loops if you are targeting Ruffle (as of writing this).** What this means in practice is that you must have a menu screen, or your replay button must redirect to a frame where all the clips you want to pause/play are removed from the stage. See the [demo for more details.](https://www.newgrounds.com/projects/games/1662252/preview/filetype/0)
