class Balloon {
  PVector size,
  position,
  velocity,
  acceleration;
  color strokeColor,
  fillColor;
  float strokeWeight,
  maxVelocity;
  
  Balloon(PVector size, PVector position, PVector velocity, PVector acceleration, color strokeColor, color fillColor, float strokeWeight, float maxVelocity) {
    this.size = size;
    this.position = position;
    this.velocity = velocity;
    this.acceleration = acceleration;
    this.strokeColor = strokeColor;
    this.fillColor = fillColor;
    this.strokeWeight = strokeWeight;
    this.maxVelocity = maxVelocity;
  }
  
  Balloon() {
    this.size = new PVector(0, 0);
    this.position = new PVector(0, 0);
    this.velocity = new PVector(0, 0);
    this.acceleration = new PVector(0, 0);
    this.strokeColor = color(0, 0, 0, 1);
    this.fillColor = color(0, 0, 0, 1);
    this.strokeWeight = 0;
  }
  
  void limitVelocity() {
    if(Math.abs(this.velocity.x) > maxVelocity)
      this.velocity.x = (this.velocity.x / Math.abs(this.velocity.x)) * maxVelocity;
    if(Math.abs(this.velocity.y) > maxVelocity)
      this.velocity.y = (this.velocity.y / Math.abs(this.velocity.y)) * maxVelocity;
  }
  
  void checkBounds(float x1, float y1, float x2, float y2) {    
    if(this.position.x < x1) {
      this.position.x = x1;
      this.velocity.x *= -1;
    }
    if(this.position.x + this.size.x > x2) {
      this.position.x = x2 - this.size.x;
      this.velocity.x *= -1;
    }
    if(this.position.y < y1) {
      this.position.y = y1;
      this.velocity.y *= -1;
    }
    if(this.position.y + this.size.y > y2) {
      this.position.y = y2 - this.size.y;
      this.velocity.y *= -1;
    }
  }
  
  void checkBounds(PVector lower, PVector upper) {
    this.checkBounds(lower.x, lower.y, upper.x, upper.y);
  }
  
  void addForce(PVector force) {
    this.acceleration.add(force);
  }
  
  void stepVelocity() {
    this.velocity.add(this.acceleration);
  }
  
  void stepPosition() {
    this.position.add(this.velocity);
  }
  
  void stepAll() {
    this.stepVelocity();
    this.limitVelocity();
    this.stepPosition();
  }
  
  void sketch() {
    fill(this.strokeColor);
    stroke(this.strokeColor);
    strokeWeight(this.strokeWeight);
    rect(this.position.x, this.position.y, this.size.x, this.size.y);
  }
  
  
}

Balloon balloon;

void setup() {
  size(200, 600);
  background(255);
  balloon = new Balloon();
  balloon.size.set(10, 10);
  balloon.position.set((width / 2) - (balloon.size.x / 2), (height * .9) - (balloon.size.y / 2));
  balloon.acceleration.add(0, -.025);
  balloon.strokeColor = color(100, 100, 255);
  balloon.strokeWeight = 2;
  balloon.maxVelocity = 1.5;
}

void draw() {
  background(255);
  balloon.stepAll();
  balloon.checkBounds(0, 0, 200, 600);
  balloon.sketch();
}

void keyPressed() {
  if(keyCode == LEFT)
    balloon.acceleration.add(-.01, 0);
  else if(keyCode == RIGHT)
    balloon.acceleration.add(.01, 0);
}