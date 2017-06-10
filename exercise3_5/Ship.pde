class Ship extends Mover {
  float rotation,
  rotationVelocity,
  thrustMagnitude;
  char left,
  right,
  forward;
  
  Ship() {
    super();
    this.rotation = 0;
    this.rotationVelocity = 0;
    this.thrustMagnitude = 0;
    
    this.left = 'a';
    this.right = 'd';
    this.forward = 'w';
  }
  
  Ship(PVector size, PVector position, PVector velocity, PVector acceleration, color strokeColor, float maxAcceleration, float maxVelocity, float rotation, float rotationVelocity, float thrustMagnitude) {
    super(size, position, velocity, acceleration, strokeColor, maxAcceleration, maxVelocity);
    this.rotation = rotation;
    this.rotationVelocity = rotationVelocity;
    this.thrustMagnitude = thrustMagnitude;
    
    this.left = 'a';
    this.right = 'd';
    this.forward = 'w';
  }
  
  void setRotation(float rotation) { //degrees
    this.rotation = radians(rotation);
  }
  
  float getRadians() {
    return this.rotation;
  }
  
  float getDegrees() {
    return degrees(this.rotation);
  }
  
  void setRotationVelocity(float rotationVelocity) { //degrees
    this.rotationVelocity = radians(rotationVelocity);
  }
  
  float getRotationVelocityRadians() {
    return this.rotationVelocity;
  }
  
  float getRotationVelocityDegrees() {
    return degrees(this.rotationVelocity);
  }
  
  void turnLeft() {
    this.rotation -= this.rotationVelocity;
  }
  
  void turnRight() {
    this.rotation += this.rotationVelocity;
  }
  
  void thrust(float thrustMagnitude) {
    PVector thrust = new PVector(thrustMagnitude * sin(this.rotation), -thrustMagnitude * cos(this.rotation));
    
    super.applyForce(thrust);
  }
  
  void move(char key) {
    if(key == this.left)
      turnLeft();
    else if(key == this.right)
      turnRight();
    else if(key == this.forward)
      this.thrust(this.thrustMagnitude);
  }
  
  void stepAll() {
    super.stepAll();
  }
  
  void sketch() {
    noFill();
    stroke(this.strokeColor);
    
    this.stepAll();
    pushMatrix();
    translate(super.position.x, super.position.y);
    rotate(this.rotation);
    rectMode(CENTER);
    rect(0, 0, super.size.x, super.size.y);
    popMatrix();
  }
}