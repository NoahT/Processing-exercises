class Pendulum { //throw your chains across the room and hold on for dear life.
  PVector origin;
  Mover endPointObject;
  float len,
  angle,
  tensionForce; //maximum tension the string can hold
  
  Pendulum() {
    this.origin = new PVector(0, 0);
    this.len = 0;
    this.angle = 0;
    this.setEndPoint();
    this.endPointObject = new Mover();
    this.tensionForce = 0;
  }
  
  Pendulum(PVector origin, Mover endPointObject, float len, float tensionForce) {
    this.origin = origin;
    this.len = len;
    this.angle = 0;
    this.endPointObject = endPointObject;
    this.setEndPoint();
    this.tensionForce = tensionForce;
  }
  
  Pendulum(PVector origin, Mover endPointObject, float len, float angle, float tensionForce) {
    this.origin = origin;
    this.len = len;
    this.angle = angle;
    this.endPointObject = endPointObject;
    this.setEndPoint();
    this.tensionForce = tensionForce;
  }
  
  PVector getOrigin() {
    return this.origin;
  }
  
  void setOrigin(PVector origin) {
    this.origin = origin;
    this.setEndPoint();
  }
  
  PVector getEndPoint() {
    return this.endPointObject.position;
  }
  
  Mover getEndPointObject() {
    return this.endPointObject;
  }
  
  void setEndPoint() { //each new call to a setter that changes an instance variable requests a call to set the endpoint
    float x = this.len * cos(this.angle),
    y = this.len * sin(this.angle);
    
    this.endPointObject.position.set(this.origin.x + x, this.origin.y + y);
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
  
  boolean tensionForceExceeded(PVector netObjectForce) {
    float theta = radians(90) - this.angle,
    netForcePerpendicular = netObjectForce.mag() * cos(theta);
  }
  
  float gettensionForce() {
    return this.tensionForce;
  }
  
  void settensionForce(float tensionForce) {
    this.tensionForce = tensionForce;
  }
  
  void addPendulumForces() {
    float theta = radians(90) - this.angle, //measure from vertical to tether
    tensionForceX = this.tensionForce * sin(theta),
    tensionForceY = this.tensionForce * cos(theta),
    
    
    PVector netForce = new PVector(0, 0);
    
  }
  
  void sketch() {
    noFill();
    stroke(0);
    line(this.origin.x, this.origin.y, this.endPointObject.position.x, this.endPointObject.position.y);
    rectMode(CENTER);
    this.endPointObject.sketch();
  }
  
  
}