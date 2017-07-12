BreakableMover breakableMover;

void setup() {
  fullScreen();
  frameRate(60);
  background(0);
  
  breakableMover = new BreakableMover(100);
  breakableMover.size = new PVector(50, 50);
  breakableMover.position = new PVector((width / 2) - (breakableMover.size.x / 2), (height / 2) - (breakableMover.size.y / 2));
  breakableMover.velocity = new PVector(0, 0);
  breakableMover.acceleration = new PVector(0, 0);
  breakableMover.strokeColor = color(255);
  breakableMover.maxAcceleration = -1;
  breakableMover.maxVelocity = -1;
  breakableMover.mass = 50;
  breakableMover.angle = 0;
  breakableMover.angularVelocity = 0;
  breakableMover.angularAcceleration = 0;
}

void draw() {
  background(0);
  
  breakableMover.sketch();
}

void mouseClicked() {
  breakableMover.shatter();
}