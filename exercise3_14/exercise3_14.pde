Mover mover,
incline;
PVector gravityForce,
netForce;

void setup() {
  fullScreen();
  frameRate(60);
  background(255);
  
  mover = new Mover();
  mover.size = new PVector(50, 25);
  mover.position = new PVector((width / 2) - (mover.size.x / 2), (height * .25) - (mover.size.y / 2));
  mover.angle = radians(-15);
  mover.strokeColor = color(0);
  mover.maxAcceleration = -1;
  mover.maxVelocity = -1;
  
  incline = new Mover();
  incline.size = new PVector(1000, 5);
  incline.position = new PVector(width * .3, height * .4);
  incline.angle = radians(-15);
  incline.strokeColor = color(0);
  
  gravityForce = new PVector(0, 9.8);
  netForce = new PVector(gravityForce.mag() * cos(mover.angle) * sin(mover.angle), gravityForce.mag() * sin(mover.angle) * sin(mover.angle)); //normal force balances perpendicular force of gravity to incline, so parallel part is net
}

void draw() {
  background(255);
  mover.applyForce(netForce);
  mover.sketch();
  incline.sketch();
}