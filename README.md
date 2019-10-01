[![Build Status](https://travis-ci.org/tekHudson/DruidBarClassic.svg?branch=master)](https://travis-ci.org/tekHudson/DruidBarClassic)

# Druid Bar Classic

Druid Bar is a movable mana bar that keeps track of your current mana, even in a shapeshifted form like bear or cat. remember that this addon is an estimation of your mana, and it could be slightly higher or lower depending on your level(Lower levels will have more problems since there is much less room for error with their smaller mana pools).

## Installation
* Download ZIP
* Extract into Interface/Addons/
  * Ensure to rename folder and remove "-master"
  * Should be `DruidBarClassic`
* Enjoy and keep WoW weird :D

## Slash Commands
There are 2 available /druidbar or /dbar and either may recieve a number of parameters:
- [on/off/toggle/vis/width/height/hide/lock/replace/player/text/message/status/debug/color]

### Explination of the parameters:

* on/off/toggle: This will toggle running of the addon. toggle switches between on and off.

* vis: This will enable or disable any and all graphical stuff. if you use with other addons like StatusBars or Linoleum, turn it off. If not, leave it on ^^

* width <#>: This will let you set the width of the bar. Default is 170px.

* height <#>: This will let you set the height of the bar. Default is 18px.

* percent: This toggles between 3 options: Showing Raw mana, showing %Mana, and showing both. Works for both the normal bar and Replace.

* hide: This will toggle on/off the hiding of the bar when in caster form.

* full: This will toggle on/off the hiding of the bar in animal forms when your mana is at 100%

* lock: This will toggle on/off locking the position of the bar.

* replace: This will replace the Player Frame's mana bar, splitting it into two when shifted.

* player: This will make the bar show up directly under the Player Frame. You know, where a lot of other addons like to place your Experience Bar.

* text: This will toggle between 3 options: No text, "Classic" text, or "Modern" Text. (Modern having a border, Classic having no border). This option carries over for both the normal bar and the replaced bar.

* status: This will list the status of all the toggles in your chat window. Simple, Easy, Effective.

* debug: dumps some junk into the chat frame to help me(and you) figure out why the bar is not subtracting the proper amount of mana.

* color: Changes the color of the mana bar by rgb vales. works like
	* /dbar color [r/g/b/a/#(0-1)] [#(0-1)] {#(0-1)}
	  * this way you can change a specific color at once (like /dbar color r 0.75)
	  * or all three at once (like /dbar color 1 0 0)

## Contact info:
In-game: Tek on Pagle

Discord: https://discord.gg/b5sPQnu
