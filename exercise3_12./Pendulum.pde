class Pendulum {
  PVector location,
  origin;
  float radius,
  angle,
  aVelocity,
  aAcceleration,
  damping;
  
  Pendulum(PVector origin, float radius) {
    this.origin = origin;
    this.radius = radius;
    this.angle = 0;
    this.aVelocity = 0;
    this.aAcceleration = 0;
    this.damping = .999;
    this.location = new PVector(this.radius * cos(this.angle), this.radius * sin(this.angle));
    this.location.add(origin);
  }
  
  void move() {
    this.update();
    this.display();
  }
  
  void update() {
    float gravity = .4;
    this.aAcceleration = (1 * gravity / this.radius) * cos(this.angle);
    
    this.aVelocity += this.aAcceleration;
    this.angle += this.aVelocity;
    
    this.aVelocity *= this.damping;
  }
  
  void display() {
    this.location.set(this.radius * cos(this.angle), this.radius * sin(this.angle));
    this.location.add(origin);
    
    stroke(0);
    fill(0);
    
    line(this.origin.x, this.origin.y, this.location.x, this.location.y);
    
    rectMode(CENTER);
    rect(this.location.x, this.location.y, 40, 40);
  }
}