Ship ship;

void setup() {
  size(750, 750);
  frameRate(60);
  
  ship = new Ship();//PVector size, PVector position, PVector velocity, PVector acceleration, color strokeColor, float maxAcceleration, float maxVelocity, float rotation, float rotationVelocity, float thrustMagnitude
  ship.size = new PVector(10, 20);
  ship.position = new PVector((width / 2) - (ship.size.x / 2), (height / 2) - (ship.size.y / 2));
  ship.velocity = new PVector(0, 0);
  ship.acceleration = new PVector(0, 0);
  ship.strokeColor = color(0);
  ship.maxAcceleration = 5;
  ship.maxVelocity = 5;
  ship.rotation = 0; //(PI / 2);
  ship.rotationVelocity = radians(10);
  ship.thrustMagnitude = 10;
  
}

void draw() {
  background(255);
  if(keyPressed)
    ship.move(key);
  ship.stepAll();
  ship.sketch();
}