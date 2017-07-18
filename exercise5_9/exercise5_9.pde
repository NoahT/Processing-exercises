import shiffman.box2d.*;

import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;

Box2DProcessing box2D;

Baseplate baseplate; //NOSTALGIA :(

ArrayList<Box2DMover> movers;

Box2DMover mover;
Box2DMouseJoint mouseJoint;
float zoom = 0;

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
  float xGap = 50,
  yBase = height * .8,
  angle = 0,
  angleVelocity = radians(5),
  amplitude = 100;
  
  for(int index = 0; index < (width * .6) / xGap; index++) {
    points.add(new Vec2((width * .2) + (index * xGap), yBase + (sin(angle) * amplitude)));
    angle += angleVelocity;
  }
  
  baseplate = new Baseplate(color(255), points);
  
  movers = new ArrayList<Box2DMover>();
  
  mover = new Box2DMover(new PVector(200, 200), new PVector(width * .5, height * .5), color(random(255), random(255), random(255), 255 * .8), false);
  mover.bodyDef.type = BodyType.KINEMATIC;
  
  //mouseJoint = new Box2DMouseJoint(box2D.getGroundBody(), mover.body, new PVector(mouseX, mouseY));
  //mouseJoint.setMaxForce(25000);
  //mouseJoint.setFrequencyHz(10);
  //mouseJoint.setDampingRatio(2);
}

void draw() {
  background(0);
  mouseJoint.setTarget(new PVector(mouseX, mouseY));
  
  box2D.step();
  baseplate.sketch();
  mover.sketch();
  
  for(int index = 0; index < movers.size(); index++) {
    movers.get(index).sketch();
  }
  
  Vec2 pos = this.mover.body.getWorldCenter();
  this.mover.body.setLinearVelocity(box2D.coordPixelsToWorld(mouseX, mouseY).sub(pos));
  
}

void keyPressed() {//map(random(1), 0, 1, 8, 64)
  Box2DMover mover = new Box2DMover(new PVector(20, 20), new PVector(width / 2, height / 2), color(random(255), random(255), random(255), 255 / 2), false);
  mover.body.setLinearVelocity(new Vec2(map(random(1), 0, 1, -50, 50), map(random(1), 0, 1, 50, 100)));
  movers.add(mover);
}