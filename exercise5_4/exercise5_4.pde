import shiffman.box2d.*;

import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;

Box2DProcessing box2D;

Baseplate baseplate; //NOSTALGIA :(
ArrayList<Box2DMover> movers;
int MAX_INDEX = 1000;

Bridge bridge;

void setup() {
  fullScreen();
  smooth();
  
  //initialize box2d world
  box2D = new Box2DProcessing(this);
  box2D.createWorld();
  //set custom gravity
  box2D.setGravity(0, -10);
  
  ArrayList<Vec2> points = new ArrayList<Vec2>();
  float xGap = 25,
  yBase = height  * .8,
  angle = 0,
  angleVelocity = 0,
  amplitude = 0;
  
  for(int index = 0; index < width / xGap; index++) {
    points.add(new Vec2(index * xGap, yBase + (sin(angle) * amplitude)));
    angle += angleVelocity;
  }
  
  //baseplate = new Baseplate(color(0), points);
  
  movers = new ArrayList<Box2DMover>();
  
  bridge = new Bridge(new PVector(0, height * .25), 20, width / 20);
  
}

void draw() {
  background(255);

  box2D.step();
  
  //baseplate.sketch();
  for(int index = 0; index < movers.size(); index++) {
    movers.get(index).sketch();
  }
  
  bridge.sketch();

}

void mouseDragged() {
  Box2DMover mover = new Box2DMover(map(random(1), 0, 1, 8, 64), map(random(1), 0, 1, 8, 64), mouseX, mouseY, color(random(255), random(255), random(255)), false);
  movers.add(mover);
  if(movers.size() >= MAX_INDEX) {
    movers.get(0).removeBody();
    movers.remove(0);
  }
}