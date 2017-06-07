Car car;

void setup() {
  size(500, 500);
  frameRate(60);
  
  car = new Car(); //PVector size, PVector location, PVector velocity, PVector acceleration, color strokeColor, float maxAcceleration, float limitVelocity
  car.size = new PVector(10, 20);
  car.position = new PVector((width / 2) - (car.size.x / 2), (height / 2) - (car.size.y / 2));
  car.velocity = new PVector(0, 0);
  car.acceleration = new PVector(0, 0);
  car.strokeColor = color(0);
  car.maxAcceleration = 1;
  car.maxVelocity = 5;
  car.turnSpeed = 5;
  car.throttleSpeed = .1;
  
}

void draw() {
  background(255);
  if(keyPressed)
    car.turnRegister(key);
  else
    car.setVelocity(new PVector(0, 0));
  car.stepAll();
  car.sketch();
}