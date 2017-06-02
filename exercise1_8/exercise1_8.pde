class Mover {
  PVector size,
  location,
  velocity,
  acceleration;
  color strokeColor;
  float maxAcceleration,
  limitVelocity;
  
  Mover(PVector size, PVector location, PVector velocity, PVector acceleration, color strokeColor, float maxAcceleration, float limitVelocity) {
    this.size = size;
    this.location = location;
    this.velocity = velocity;
    this.acceleration = acceleration;
    this.strokeColor = strokeColor;
    this.maxAcceleration = maxAcceleration;
    this.limitVelocity = limitVelocity;
  }
  
  Mover() {
  }
  
  void limit() {
    if(Math.abs(this.velocity.x) > limitVelocity)
      this.velocity.x = (this.velocity.x / Math.abs(this.velocity.x)) * limitVelocity;
    if(Math.abs(this.velocity.y) > limitVelocity)
      this.velocity.y = (this.velocity.y / Math.abs(this.velocity.y)) * limitVelocity;
  }
  
  void checkBounds(PVector lower, PVector upper) {
    if(this.location.x - (this.size.x / 2) < lower.x
      || this.location.x + (this.size.x / 2) > upper.x)
      this.velocity.x *= -1;
    if(this.location.y - (this.size.y / 2) < lower.y
      || this.location.y + (this.size.y / 2) > upper.y)
      this.velocity.y *= -1;
  }
  
  void accelerate() {
    this.velocity.add(this.acceleration);
  }
  
  void step() {
    this.location.add(this.velocity);
  }
  
  void sketch() {
    noFill();
    stroke(this.strokeColor);
    rectMode(CENTER);
    rect(this.location.x, this.location.y, this.size.x, this.size.y);
  }
}

Mover mover;
PVector mouse,
dir;

void setup() {
  size(1000, 1000);
  frameRate(30);
  
  mouse = new PVector();
  dir = new PVector();
  
  mover = new Mover();
  mover.size = new PVector(20, 20);
  mover.location = new PVector(width / 2, height / 2);
  mover.velocity = new PVector(0, 0);
  mover.acceleration = new PVector(0, 0);
  mover.maxAcceleration = .05;
  mover.limitVelocity = 5;
}

void draw() {
  background(255);
  
  mouse.set(mouseX, mouseY);
  dir = PVector.sub(mouse, mover.location); //distance
  
  mover.limit();
  mover.acceleration.set(1 / dir.x, 1 / dir.y);
  mover.acceleration.normalize();
  mover.acceleration.mult(mover.maxAcceleration);
  
  println(mover.acceleration.x + "\t" + mover.acceleration.y);
  
  mover.accelerate();
  mover.step();
  mover.sketch();
  
}