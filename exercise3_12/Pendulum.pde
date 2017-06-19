class Pendulum { //throw your chains across the room and hold on for dear life.
  PVector origin,
  endPoint;
  Mover endPointObject;
  float len,
  angle,
  maxForce; //maximum tension the string can hold
  
  Pendulum() {
    this.origin = new PVector(0, 0);
    this.len = 0;
    this.angle = 0;
    this.setEndPoint();
    this.endPointObject = new Mover();
    this.maxForce = 0;
  }
  
  Pendulum(PVector origin, Mover endPointObject, float len, float maxForce) {
    this.origin = origin;
    this.len = len;
    this.angle = 0;
    this.endPointObject = endPointObject;
    this.setEndPoint();
    this.maxForce = maxForce;
  }
  
  Pendulum(PVector origin, Mover endPointObject, float len, float angle, float maxForce) {
    this.origin = origin;
    this.len = len;
    this.angle = angle;
    this.endPointObject = endPointObject;
    this.setEndPoint();
    this.maxForce = maxForce;
  }
  
  PVector getOrigin() {
    return this.origin;
  }
  
  void setOrigin(PVector origin) {
    this.origin = origin;
    this.setEndPoint();
  }
  
  PVector getEndPoint() {
    return this.endPoint;
  }
  
  Mover getEndPointObject() {
    return this.endPointObject;
  }
  
  void setEndPoint() { //each new call to a setter that changes an instance variable requests a call to set the endpoint
    float x = this.len * cos(this.angle),
    y = this.len * sin(this.angle);
    
    if(this.endPoint == null)
      this.endPoint = new PVector(this.origin.x + x, this.origin.y + y);
    else
      this.endPoint = this.origin.add(x, y);
    println(x + "\t" + y);
    this.endPointObject.position.set(this.endPoint);
  }
  
  float getLength() {
    return this.len;
  }
  
  void setLength(float len) {
    this.len = len;
    this.setEndPoint();
  }
  
  float getAngle() {
    return this.angle;
  }
  
  void setAngle(float angle) {
    this.angle = angle;
    this.setEndPoint();
  }
  
  float getMaxForce() {
    return this.maxForce;
  }
  
  void setMaxForce(float maxForce) {
    this.maxForce = maxForce;
  }
  
  void addPendulumForces() {
  }
  
  void sketch() {
    noFill();
    stroke(0);
    line(this.origin.x, this.origin.y, this.endPointObject.position.x, this.endPointObject.position.y);
    rectMode(CENTER);
    this.endPointObject.sketch();
  }
  
  
}