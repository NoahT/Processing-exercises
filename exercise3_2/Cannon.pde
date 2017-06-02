class Cannon extends Mover {
  float angle;
  Cannon() {
  }
  
  Cannon(PVector size, PVector location, PVector velocity, PVector acceleration, color strokeColor, float maxAcceleration, float limitVelocity) {
    super(size, location, velocity, acceleration, strokeColor, maxAcceleration, limitVelocity);
  }
  
  void shoot() {
  }
  
}