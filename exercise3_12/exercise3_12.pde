Pendulum pendulum;

void setup() {
  background(255);
  size(750, 750);
  frameRate(60);
  
  PVector origin = new PVector(width / 2, height * .25);
  float len = 100,
  maxForce = 500,
  angle = radians(0);
  
  Mover endObject = new Mover();
  //PVector size, PVector position, PVector velocity, PVector acceleration, color strokeColor, float maxAcceleration, float maxVelocity
  endObject.size = new PVector(20, 20);
  endObject.position = new PVector(0, 0);
  endObject.velocity = new PVector(0, 0);
  endObject.acceleration = new PVector(0, 0);
  endObject.strokeColor = color(0);
  endObject.maxAcceleration = 20;
  
  pendulum = new Pendulum(origin, endObject, len, angle, maxForce);
}

void draw() {
  background(255);
  pendulum.sketch();
  pendulum.setAngle(pendulum.getAngle() + radians(2.5));
 // println(degrees(pendulum.getAngle()));
}