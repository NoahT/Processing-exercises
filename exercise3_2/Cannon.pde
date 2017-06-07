class Cannon extends Mover {
  float rotation,
  maxProjectileThrust;
  ArrayList<Projectile> projectiles;
  
  Cannon() {
    super();
    this.rotation = 0;
    this.maxProjectileThrust = 0;
    this.projectiles = new ArrayList<Projectile>();
  }
  
  Cannon(PVector size, PVector location, PVector velocity, PVector acceleration, color strokeColor, float maxAcceleration, float limitVelocity, float maxProjectileThrust) {
    super(size, location, velocity, acceleration, strokeColor, maxAcceleration, limitVelocity);
    this.rotation = 0;
    this.maxProjectileThrust = maxProjectileThrust;
    this.projectiles = new ArrayList<Projectile>();
  }
  
  float getDegrees() {
    return degrees(this.rotation);
  }
  
  float getRadians() {
    return this.rotation;
  }
  
  void setDegrees(float degrees) {
    this.rotation = radians(degrees);
  }
  
  void setRadians(float radians) {
    this.rotation = radians;
  }
  
  void rotateCannon() {
    rotate(this.rotation);
  }
  
  void resetRotation() {
    rotate(-this.rotation);
  }
  
  void followMouse() { //fix muddled cluster for future
  
  /*
  float xDifference = mouseX - (super.location.x - (super.size.x / 2)),
  yDifference = mouseY - (super.location.y + (super.size.y / 2)),
  distance = sqrt((xDifference * xDifference) + (yDifference * yDifference)),
  radians = atan(yDifference / xDifference) - (.5 * PI);
  if(xDifference < 0)
    if(yDifference > 0) //(-, +)
      radians += (PI);
    else //(-, -)
      radians -= (1 * PI);
  this.setRadians(radians);
  println(radians);
  */
  }
  
  void fire() {
    float xDifference = mouseX - (super.location.x - (super.size.x / 2)),
    yDifference = mouseY - (super.location.y + (super.size.y / 2)),
    distance = sqrt((xDifference * xDifference) + (yDifference * yDifference)),
    xThrust = map(random(maxProjectileThrust), 0, maxProjectileThrust, -maxProjectileThrust, maxProjectileThrust),
    yThrust = map(random(maxProjectileThrust), 0, maxProjectileThrust, 0, maxProjectileThrust);
  
    Projectile projectile = new Projectile(); //PVector size, PVector location, PVector velocity, PVector acceleration, color strokeColor, float maxAcceleration, float limitVelocity
    projectile.size = new PVector(random(10) + 5, random(10) + 5); //i promise i will go back to mapping
    projectile.location = new PVector(super.location.x, super.location.y);
    projectile.velocity = new PVector(0, 0);
    projectile.acceleration = new PVector(0, 0);
    projectile.strokeColor = color(random(255), random(255), random(255));
    projectile.maxAcceleration = 20;
    projectile.limitVelocity = this.maxProjectileThrust;
    projectile.rotation = radians(random(360));
    projectile.rotationalVelocity = map(random(1), 0, 1, -5, 5);
    
    PVector thrust = new PVector(xThrust, -yThrust);
    projectile.applyForce(thrust);
    
    this.projectiles.add(projectile);
  }
  
  void sketch() { //processing has crap rotation system
    
    super.sketch();
    for(int index = 0; index < this.projectiles.size(); index++) {
      this.projectiles.get(index).applyForce(gravity);
      this.projectiles.get(index).stepAll();
      this.projectiles.get(index).sketch();
    }
    
    /*
    translate(super.location.x - (super.size.x / 2), super.location.y - (super.size.y / 2));
    this.rotateCannon();
    
    noFill();
    stroke(this.strokeColor);
    this.stepAll();
    rect(0, 0, super.size.x, super.size.y);
    
    translate(-(super.location.x + (super.size.x / 2)), -(super.location.y + (super.size.y / 2)));
    
    this.resetRotation();
    
    for(int index = 0; index < this.projectiles.size(); index++) {
      this.projectiles.get(index).stepAll();
      rect(this.projectiles.get(index).location.x, this.projectiles.get(index).location.y, this.projectiles.get(index).size.x, this.projectiles.get(index).size.y);
    }
    */
  }
}