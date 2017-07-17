import shiffman.box2d.*;

import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;

Box2DProcessing box2D;

Baseplate baseplate; //NOSTALGIA :(
ArrayList<Box2DMover> movers;
int MAX_INDEX = 1000;

Box2DMover carBody,
wheel1,
wheel2;
Box2DHinge h1,
h2;

void setup() {
  fullScreen();
  smooth();
  frameRate(120);
  background(0);
  
  //initialize box2d world
  box2D = new Box2DProcessing(this);
  box2D.createWorld();
  //set custom gravity
  box2D.setGravity(0, -10);
  
  ArrayList<Vec2> points = new ArrayList<Vec2>();
  float xGap = 25,
  yBase = height * .8,
  angle = 0,
  angleVelocity = 0,
  amplitude = 0;
  
  for(int index = 0; index < width / xGap; index++) {
    points.add(new Vec2(index * xGap, yBase + (sin(angle) * amplitude)));
    angle += angleVelocity;
  }
  
  baseplate = new Baseplate(color(255), points);
  movers = new ArrayList<Box2DMover>();
  
  wheel1 = new Box2DMover(50, 50, (width / 2) - 125, (height * .8) - 50, color(255), false);
  wheel2 = new Box2DMover(50, 50, (width / 2) + 125, (height * .8) - 50, color(255), false);
  carBody = new Box2DMover(300, 10, (width / 2), (height * .8) - 75, color(255), false);
  
  h1 = new Box2DHinge(wheel1, carBody, wheel1.body.getPosition());
  h2 = new Box2DHinge(wheel2, carBody, wheel2.body.getPosition());
  
  h1.setMotorSpeed(PI * 4);
  h2.setMotorSpeed(PI * 4);
  h1.setMaxMotorTorque(5000);
  h2.setMaxMotorTorque(5000);
  h1.setMotorOn(true);
  h2.setMotorOn(true);
}

void draw() {
  background(0);

  box2D.step();
  
  baseplate.sketch();
  
  for(int index = 0; index < movers.size(); index++) {
    movers.get(index).sketch();
  }
  
  carBody.sketch();
  wheel1.sketch();
  wheel2.sketch();
}

void mouseDragged() {//map(random(1), 0, 1, 8, 64)
  Box2DMover mover = new Box2DMover(20, 20, mouseX, mouseY, color(random(255), random(255), random(255), 255 / 2), false);
  movers.add(mover);
  if(movers.size() >= MAX_INDEX) {
    movers.get(0).removeBody();
    movers.remove(0);
  }
}