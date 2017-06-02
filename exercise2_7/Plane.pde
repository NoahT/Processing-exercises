class Plane extends Mover {
  float liftCoefficient,
  dragCoefficient;
  
  Plane(PVector size, PVector location, PVector velocity, PVector acceleration, color strokeColor, float maxAcceleration, float limitVelocity, float liftCoefficient, float dragCoefficient) {
    super(size, location, velocity, acceleration, strokeColor, maxAcceleration, limitVelocity);
    this.liftCoefficient = liftCoefficient;
    this.dragCoefficient = dragCoefficient;
  }
  
  Plane() {
    this.liftCoefficient = 0;
    this.dragCoefficient = 0;
  }
  
  PVector getDragForce() {
    PVector dragForce = super.velocity.get();
    float speed = super.velocity.get().mag();
    
    dragForce.normalize();
    dragForce.mult(-1 * this.dragCoefficient * speed * speed);
    return dragForce;
  }
  
  PVector getLiftForce() {
    PVector liftForce = this.getDragForce();
    
    liftForce.set(-1 * liftForce.y, liftForce.x);
    liftForce.mult(this.liftCoefficient);
    return liftForce;
  }
  
  void applyDrag() {
    this.applyForce(this.getDragForce()); //f = ma, so a = f / m (bigger mass, smaller accel.)
  }
  
  void applyLift() {
    this.applyForce(this.getLiftForce());
  }
  
  void stepAll() {
    this.applyDrag();
    this.applyLift();
    super.stepAll();
  }
}