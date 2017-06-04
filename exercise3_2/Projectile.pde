class Projectile extends Mover {
  float rotation,
  rotationalVelocity;
  
  Projectile() {
    super();
    this.rotation = 0;
    this.rotationalVelocity = 0;
  }
  
  Projectile(PVector size, PVector location, PVector velocity, PVector acceleration, color strokeColor, float maxAcceleration, float limitVelocity, float rotation, float rotationalVelocity) {
    super(size, location, velocity, acceleration, strokeColor, maxAcceleration, limitVelocity);
    this.rotation = radians(rotation);
    this.rotationalVelocity = rotationalVelocity;
  }
  
  float getRadians() {
    return this.rotation;
  }
  
  float getDegrees() {
    return degrees(this.rotation);
  }
  
  void applyRotation() {
    this.rotation += rotationalVelocity;
  }
  
  void stepAll() {
    this.applyRotation();
    super.stepAll();
  }
  
  void sketch() {
    pushMatrix(); //from here on out, lets use the matrix stack for coordinate systems
    translate(super.location.x, super.location.y);
    rotate(this.rotation);
    
    noFill();
    stroke(this.strokeColor);
    
    this.stepAll();
    rectMode(CENTER);
    rect(0, 0, this.size.x, this.size.y);
    popMatrix();
  }
}