class Car extends Mover {
  float turnSpeed, //degree value for turning power
  //,
  rotation,
  throttleSpeed;
  char left,
  right,
  forward,
  backward;
  
  Car() {
    super();
    this.turnSpeed = 0;
    this.left = 'a';
    this.right = 'd';
    this.forward = 'w';
    this.backward = 's';
    this.rotation = 0;
  }
  
  Car(PVector size, PVector location, PVector velocity, PVector acceleration, color strokeColor, float maxAcceleration, float limitVelocity, float turnSpeed, float throttleSpeed) {
    super(size, location, velocity, acceleration, strokeColor, maxAcceleration, limitVelocity);
    this.turnSpeed = turnSpeed;
    this.left = 'a';
    this.right = 'd';
    this.forward = 'w';
    this.backward = 's';
    this.rotation = 0;
    this.throttleSpeed = throttleSpeed;
  }
  
  void turnLeft() {
    this.rotation -= turnSpeed;
    this.rotation %= 360;
  }
  
  void turnRight() {
    this.rotation += turnSpeed;
    this.rotation %= 360;
  }
  
  void moveForward() {
    super.velocity.x += this.throttleSpeed * sin(radians(this.rotation));
    super.velocity.y -= this.throttleSpeed * cos(radians(this.rotation));
  }
  
  void moveBackward() {
    super.velocity.x -= this.throttleSpeed * sin(radians(this.rotation));
    super.velocity.y += this.throttleSpeed * cos(radians(this.rotation));
  }
  
  void turnRegister(char key) {
    if(key == this.left)
      this.turnLeft();
    else if(key == this.right)
      this.turnRight();
    else if(key == this.forward)
      this.moveForward();
    else if(key == this.backward)
      this.moveBackward();
  }
  
  void sketch() {
    pushMatrix();
    translate(super.position.x, super.position.y);
    rotate(radians(this.rotation));
    noFill();
    stroke(this.strokeColor);
    this.stepAll();
    rect(-super.size.x / 2, -super.size.y / 2, this.size.x, this.size.y);
    popMatrix();
  }
  
}