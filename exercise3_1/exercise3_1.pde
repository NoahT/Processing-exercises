Mover ball1, ball2;
float radius,
rotation;

void setup() {
  size(500, 500);
  frameRate(60);
  
  rotation = 0;
  
  radius = 50;
  
  translate(width / 2, height / 2);
  ball1 = new Mover(); //PVector size, PVector location, PVector velocity, PVector acceleration, color strokeColor, float maxAcceleration, float limitVelocity
  ball1.size = new PVector(10, 10);
  ball1.location = new PVector(-(ball1.size.x / 2) - radius, -(ball1.size.y / 2));
  ball1.velocity = new PVector(0, 0);
  ball1.acceleration = new PVector(0, 0);
  ball1.strokeColor = color(0);
  ball1.maxAcceleration = 0;
  ball1.limitVelocity = 0;
  
  ball2 = new Mover(); //PVector size, PVector location, PVector velocity, PVector acceleration, color strokeColor, float maxAcceleration, float limitVelocity
  ball2.size = new PVector(10, 10);
  ball2.location = new PVector(-(ball1.size.x / 2) + radius, -(ball1.size.y / 2));
  ball2.velocity = new PVector(0, 0);
  ball2.acceleration = new PVector(0, 0);
  ball2.strokeColor = color(0);
  ball2.maxAcceleration = 0;
  ball2.limitVelocity = 0;
  
}

void draw() {
  background(255);
  strokeWeight(2);
  //ball1.location.set(
  translate(width / 2, height / 2);
  ball1.location.set(radius * cos(radians(rotation)), radius * sin(radians(rotation)));
  ball2.location.set(-radius * cos(radians(rotation)), -radius * sin(radians(rotation)));
  ball1.sketch();
  ball2.sketch();
  strokeWeight(1);
  line(ball1.location.x + (ball1.size.x / 2), ball1.location.y + (ball1.size.y / 2), ball2.location.x + (ball2.size.x / 2), ball2.location.y + (ball2.size.y / 2));
  rotation += 2;
}