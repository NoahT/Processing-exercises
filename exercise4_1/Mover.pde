class Mover {
  final float MASS_UNIT = 1; //unit for measurement
  PVector size,
  position,
  velocity,
  acceleration;
  color strokeColor;
  float maxAcceleration,
  maxVelocity,
  mass,
  angle, //measured in radians
  angularVelocity,
  angularAcceleration;
  
  Mover() { //this is much cleaner
    this.size = new PVector(0, 0);
    this.position = new PVector(0, 0);
    this.velocity = new PVector(0, 0);
    this.acceleration = new PVector(0, 0);
    this.strokeColor = color(0, 0, 0, 1);
    this.maxAcceleration = -1;
    this.maxVelocity = -1;
    this.mass = 0;
    this.angle = 0;
    this.angularVelocity = 0;
    this.angularAcceleration = 0;
  }
  
  void setAngle(float angle) {
    this.angle = angle;
  }
  
  void setAngularVelocity(float angularVelocity) {
    this.angularVelocity = angularVelocity;
  }
  
  void setAngularAcceleration(float angularAcceleration) {
    this.angularAcceleration = angularAcceleration;
  }
  
  void setMass() {
    if(this.mass == 0)
      this.mass = (this.size == null ? 1 : (this.MASS_UNIT * this.size.x * this.size.y));
  }
  
  void applyForce(PVector force) {
    PVector forceCopy = force.get();
    
    this.setMass();
      
    forceCopy.div(this.mass); //f = ma, so a = f / m
    this.acceleration.add(forceCopy);
  }
  
  void maxVelocity() {
    if(Math.abs(this.velocity.x) > this.maxVelocity
    && this.maxVelocity >= 0)
      this.velocity.x = (this.velocity.x / Math.abs(this.velocity.x)) * maxVelocity;
    if(Math.abs(this.velocity.y) > this.maxVelocity
    && this.maxVelocity >= 0)
      this.velocity.y = (this.velocity.y / Math.abs(this.velocity.y)) * maxVelocity;
  }
  
  void limitAcceleration() {
    if(Math.abs(this.acceleration.x) > this.maxAcceleration
    && this.maxAcceleration >= 0)
      this.acceleration.x = (this.acceleration.x / Math.abs(this.acceleration.x)) * this.maxAcceleration;
    if(Math.abs(this.acceleration.y) > this.maxAcceleration
    && this.maxAcceleration >= 0)
      this.acceleration.y = (this.acceleration.y / Math.abs(this.acceleration.y)) * this.maxAcceleration;
  }
  
  void checkBounds(float x1, float y1, float x2, float y2) {    
    if(this.position.x < x1) {
      this.position.x = x1;
      this.velocity.x *= -1;
    }else if(this.position.x + this.size.x > x2) {
      this.position.x = x2 - this.size.x;
      this.velocity.x *= -1;
    }
    if(this.position.y < y1) {
      this.position.y = y1;
      this.velocity.y *= -1;
    }else if(this.position.y + this.size.y > y2) {
      this.position.y = y2 - this.size.y;
      this.velocity.y *= -1;
    }
  }
  
  void checkBoundsSwap(float x1, float y1, float x2, float y2) {    
    if(this.position.x < x1) {
      this.position.x = x2 - this.size.x;
    }else if(this.position.x + this.size.x > x2) {
      this.position.x = x1;
    }
    if(this.position.y < y1) {
      this.position.y = y2 - this.size.y;
    }else if(this.position.y + this.size.y > y2) {
      this.position.y = y1;
    }
  }
  
  void checkBounds(PVector lower, PVector upper) {
    this.checkBounds(lower.x, lower.y, upper.x, upper.y);
  }
  
  void stepVelocity() {
    this.velocity.add(this.acceleration);
  }
  
  void setVelocity(PVector velocity) {
    this.velocity.set(velocity);
  }
  
  void stepPosition() {
    this.position.add(this.velocity);
  }
  
  void stepAll() {
    this.stepVelocity();
    this.maxVelocity();
    this.limitAcceleration();
    this.stepPosition();
    this.acceleration.mult(0);
  }
  
  void sketch() {
    fill(0);//noFill();
    stroke(this.strokeColor);
    this.stepAll();
    pushMatrix();
    translate(this.position.x, this.position.y);
    rotate(this.angle);
    rect(0, 0, this.size.x, this.size.y);
    popMatrix();
  }
}