Cannon cannon;
PVector gravity;

void setup() {
  size(500, 500);
  frameRate(60);
  
  gravity = new PVector(0, .098);
  
  cannon = new Cannon(); //PVector size, PVector location, PVector velocity, PVector acceleration, color strokeColor, float maxAcceleration, float limitVelocity
  cannon.size = new PVector(10, 10);
  cannon.location = new PVector(width / 2 - (cannon.size.x / 2), height - cannon.size.y);
  cannon.velocity = new PVector(0, 0);
  cannon.acceleration = new PVector(0, 0);
  cannon.strokeColor = color(0);
  cannon.maxAcceleration = 0;
  cannon.limitVelocity = 0; //stay in place]
  cannon.maxProjectileThrust = 20;
}

void draw() {
  background(255);
  cannon.followMouse();
  //cannon.setRadians((1.5 * PI));
  cannon.sketch();
}

void keyPressed() {
  if(keyCode == ENTER)
    cannon.fire();
}