class Particle extends Mover {
  ArrayList<PVector> locationHistory;
  
  Particle(PVector size, PVector location, PVector velocity, PVector acceleration, color strokeColor, float maxAcceleration, float limitVelocity) {
    super(size, location, velocity, acceleration, strokeColor, maxAcceleration, limitVelocity);
    this.locationHistory = new ArrayList<PVector>();
  }
  
  Particle() {
    super();
    this.locationHistory = new ArrayList<PVector>();
  }
  
  void attract(Mover mover, float gravity) {
    //f = G(m1m2)(r>)/r*r
    
    PVector force = PVector.sub(mover.location, super.location);
    float distance = constrain(force.mag(), 5, 1000);
    force.normalize();//.normalize();
    force.mult(gravity * (super.mass * mover.mass));
    force.div(distance);
    println(force.x + "\t" + force.y);
    super.applyForce(force);
  }
  
  void addLocation() {
    this.locationHistory.add(super.location.get());
  }
  
  void drawLocation(int cap) {
    noFill();
    stroke(super.strokeColor);
    strokeWeight(2);
    //for(int index = 0; index < this.locationHistory.size() - 1; index++) {
    int index = (this.locationHistory.size() >= cap) ? this.locationHistory.size() - cap : 0;
    for(; index < this.locationHistory.size() - 1; index++) {
      line(this.locationHistory.get(index).x, this.locationHistory.get(index).y, this.locationHistory.get(index + 1).x, this.locationHistory.get(index + 1).y);
    }
  }
}