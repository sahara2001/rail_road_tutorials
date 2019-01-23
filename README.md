# rail_road_tutorials

This messy little demo might give you some idea about how gosu works.

### Personal Understanding

Gosu engine will loop and update each object in gosu framework after they are initialized. In each iteration (20 ms), gosu called `update` and `draw` method of objects in gosu in order to update status of objects and render them as graphics on your computer.

In this small game, only `WhackARuby` class is in gosu. Other classes such as Player class define two functions for rendering object and update object to get involved in the game (here they are named `draw`). In `draw` function, we use built in function in gosu image class to render player (member defined in Player class). `update` here is not implemented cuz I move its functionality to `update` function in `WhackARuby` class.