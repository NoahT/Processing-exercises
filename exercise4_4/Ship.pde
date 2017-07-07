class Ship extends Mover {
  float rotation,
  rotationVelocity,
  thrustMagnitude;
  char left,
  right,
  forward;
  
  ParticleSystem thrustParticles;
  
  Ship() {
    super();
    this.rotation = 0;
    this.rotationVelocity = 0;
    this.thrustMagnitude = 0;
    this.thrustParticles = new ParticleSystem();
    
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
    
    Particle particle = new Particle();
    particle.size.set(2, 2);
    particle.position.set(super.position.x, super.position.y);
    particle.velocity.set(map(random(1), 0, 1, -1, 1), map(random(1), 0, 1, -1, 1)); //too lazy to figure out the math
    particle.strokeColor = color(0);
    particle.mass = 10;
    particle.angle = this.rotation;
    particle.angularVelocity = map(random(1), 0, 1, radians(-5), radians(5));
    particle.lifeTime = (int) map(random(1), 0, 1, 10, 20);
    this.thrustParticles.addParticle(particle);
    
    super.applyForce(thrust);
  }
  
  void move(char key) {
    if(key == this.left)
      turnLeft();
    if(key == this.right)
      turnRight();
    if(key == this.forward)
      this.thrust(this.thrustMagnitude);
  }
  
  void stepAll() {
    super.stepAll();
  }
  
  void sketch() {
    noFill();
    stroke(this.strokeColor);
    
    this.thrustParticles.clean();
    this.thrustParticles.sketch();
    this.thrustParticles.removeLife();
    
    this.stepAll();
    pushMatrix();
    translate(super.position.x, super.position.y);
    rotate(this.rotation);
    rectMode(CENTER);
    rect(0, 0, super.size.x, super.size.y);
    popMatrix();
  }
}