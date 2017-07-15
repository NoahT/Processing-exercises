import shiffman.box2d.*;

import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;

Box2DProcessing box2D;

Baseplate baseplate; //NOSTALGIA :(
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
  
  ArrayList<Vec2> points = new ArrayList<Vec2>();
  float xGap = 25,
  yBase = 0,
  angle = 0,
  angleVelocity = radians(.45),
  amplitude = 2500;
  
  for(int index = 0; index < width / xGap; index++) {
    points.add(new Vec2(index * xGap, yBase + (sin(angle) * amplitude)));
    angle += angleVelocity;
  }
  
  baseplate = new Baseplate(color(0), points);
  
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
  Box2DMover mover = new Box2DMover(map(random(1), 0, 1, 16, 16), map(random(1), 0, 1, 16, 16), mouseX, mouseY, color(random(255), random(255), random(255)), false);
  movers.add(mover);
  if(movers.size() >= MAX_INDEX)
    movers.remove(0);
}

void mouseDragged() {
  Box2DMover mover = new Box2DMover(map(random(1), 0, 1, 16, 16), map(random(1), 0, 1, 16, 16), mouseX, mouseY, color(random(255), random(255), random(255)), false);
  movers.add(mover);
  if(movers.size() >= MAX_INDEX) {
    movers.get(0).removeBody();
    movers.remove(0);
  }
}