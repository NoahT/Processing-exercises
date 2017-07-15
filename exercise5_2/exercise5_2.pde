import shiffman.box2d.*;

import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;

Box2DProcessing box2D;

Box2DMover baseplate; //NOSTALGIA :(
ArrayList<Box2DMover> movers;
int MAX_INDEX = 1000;

void setup() {
  fullScreen();
  smooth();
  
  //initialize box2d world
  box2D = new Box2DProcessing(this);
  box2D.createWorld();
  //set custom gravity
  box2D.setGravity(0, -10);
  
  baseplate = new Box2DMover(width, 10, width / 2, height - 5, color(15, 100, 5), true);
  
  movers = new ArrayList<Box2DMover>();
  
}

void draw() {
  background(255);

  box2D.step();
  
  baseplate.sketch();
  for(int index = 0; index < movers.size(); index++) {
    movers.get(index).sketch();
  }

}

void mouseClicked() {
  Box2DMover mover = new Box2DMover(map(random(1), 0, 1, 10, 50), map(random(1), 0, 1, 10, 50), mouseX, mouseY, color(random(255), random(255), random(255)), false);
  movers.add(mover);
  if(movers.size() >= MAX_INDEX)
    movers.remove(0);
}

void mouseDragged() {
  Box2DMover mover = new Box2DMover(map(random(1), 0, 1, 10, 50), map(random(1), 0, 1, 10, 50), mouseX, mouseY, color(random(255), random(255), random(255)), false);
  movers.add(mover);
  if(movers.size() >= MAX_INDEX) {
    movers.get(0).removeBody();
    movers.remove(0);
  }
}