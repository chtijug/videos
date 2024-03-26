# How To Make PNG from SVG

## ImageMagick do not work

Using `convert` from ImageMagick do not work as it do not follow the link to embedded SVG 😕

## The Hard Way: Screenshot

1. Use any WebBrowser that can render the SVG
2. Make it fullscreen
3. Take a screenshot

> NOTE: the screen resolution have to mach the image to render

## The (Not So) Easy Way: Using Firefox's screenshot

1. start Firefox to show the SVG image (let's say `background_speaker_screen_16_9.svg` for example)
  ```shell
  $ cd /path/to/background/
  $ firefox file://$(pwd)/background_speaker_screen_16_9.svg
  ```
2. open the WebConsole (CTRL + SHIFT + k)

3. enter the following commands, each one take a screenshot and store it in the _Download_ folder
  ```javascript
  :screenshot --selector '#background' --dpr 1 --filename 'background_speaker_screen_16_9.png'
  :screenshot --selector '#background' --dpr 2 --filename 'background_speaker_screen_16_9@2X.png'
  ```

4. repeat the process for each image to render 😅
