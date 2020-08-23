# Description

Robot is a adventure-game,
where you lead your controled body through different very exiting rooms up to the bad king.
For your way, you need the right keys for the dors,
you need to destroy your enemies (the robots) and you have to solve some problems.

(Project copied from [here](http://www.az2000.de/projects/robot2/). From 2006.)

# Idea

The idea based on the very old, famous, same-named [DOS-game Robot](http://www.tom-games.de/robot/).
The gameplay is the same, but the original game is much more complex,
the graphics are better and the world is bigger.
The project Robot 2 is a port of my old
[Visual Basic project Robot 1](http://www.az2000.de/projects/robot/) (from around 1999),
one of my very first games.
Robot 2 was coded in Object Pascal for Free Pascal with [Lazarus](https://www.lazarus-ide.org/).
You can desribe Lazarus as a plattform-independend, open-source and free alternative to Delphi.
Take a look at it, it is very nice.

# Versions

The beta version (all version less than 2.0) was coded for beginning programmers.
I wanted to show how you can code a complex game like this with very basic programming technics.
After a little tutorial in Delphi or Lazarus,
everyone should be able to read and understand the whole source code.
See also my
[coding for absolute dummies tutorial](http://www.az2000.de/docs/coding_for_dummies/)
(german only at the moment)
for more information.
The Super Special Laura Edition (1.6) (renamed to 'Hopper')
is a special version for Laura and contains some modifications of the look onto the game...
Version 1.7 now contains a complete new world with new mysteries and an ingame-leveleditor.

# Leveleditor

All beta versions after 1.7 contains an ingame-leveleditor.
The control is easy:
Go into the editor mode (menu).
All game-objects are listed in your knapsack.
Simply select an object and place it in the present room by left-clicking at the wanted position.
You can also select the objects in the knapsack by clicking on them.
With a right-click, you can remove an object.
With Ctrl+Arrowkey, you can switch to other rooms.
Don't forget to come back to the room where your body is,
because else, you can't resume playing on exiting the editor mode.

# Control of your body

The movement is controlled by the arrow-keys.
You can catch things laying around by simple go to them.
They will be put into your knapsack.
Select the thing in your knapsack you want to use with spacebar.
You can use them by pressing enter.
There are corrosive liquids filled in bottles laying around.
You can remove walls with it (only the bright walls).
Every door needs a key to enter it.
The are 3 diamonds laying somewhere around.
You need them to defeat the bad king.
You have to put them near of the diamond-places (go there and select it in your knapsack).
You can save the game with the clocks laying around.
...

# Events

You can change any event of some game-object or everything else by simply change the dependent source code.
You don't need any programming experience, it is very easy.
Open the Lazarus project-file (robot.lpi) with Lazarus (download it here)
and look at the code of umainform.pas.
Perhaps the most interesting functions for you are MoveToPlace and UseKnapsackSelection.
If you make any change and think it will be interesting for others, simply mail me.

