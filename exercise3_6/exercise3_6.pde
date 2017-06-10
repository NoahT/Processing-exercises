float angle,
aVelocity,
amplitude,
yOscillation;

Mover object;
Tether tether;

void setup() {
  size(750, 750);
  frameRate(60);
  
  angle = 0;
  aVelocity = .05;
  amplitude = 250;
  yOscillation = amplitude * sin(angle);
  
  object = new Mover(); //PVector size, PVector position, PVector velocity, PVector acceleration, color strokeColor, float maxAcceleration, float maxVelocity
  object.size = new PVector(20, 20);
  object.position = new PVector((width / 2) - (object.size.x / 2), (height / 2) - (object.size.y / 2));
  object.velocity = new PVector(0, 0);
  object.acceleration = new PVector(0, 0);
  object.strokeColor = color(0);
  object.maxAcceleration = 5;
  object.maxVelocity = 5;
  
  tether = new Tether(new PVector((width / 2) - (object.size.x / 2), 0), object.position.add(object.size.x / 2, object.size.y / 2));
}

void draw() {
  background(255);
  
  yOscillation = amplitude * sin(angle);
  angle += aVelocity;
  
  object.position.set((width / 2) - (object.size.x / 2), ((height / 2) - (object.size.y / 2)) + yOscillation);
  
  rectMode(CENTER);
  object.sketch();
  tether.sketch();
}