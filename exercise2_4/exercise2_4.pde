class Mover {
  final float MASS_UNIT = 1; //unit for measurement
  PVector size,
  location,
  velocity,
  acceleration;
  //ArrayList<PVector> forces; @todo
  color strokeColor;
  float maxAcceleration,
  limitVelocity,
  mass,
  density;
  
  Mover(PVector size, PVector location, PVector velocity, PVector acceleration, color strokeColor, float maxAcceleration, float limitVelocity) {
    this.size = size;
    this.location = location;
    this.velocity = velocity;
    this.acceleration = acceleration;
    this.strokeColor = strokeColor;
    this.maxAcceleration = maxAcceleration;
    this.limitVelocity = limitVelocity;
    this.mass = this.MASS_UNIT * this.size.x * this.size.y; //for simplicity
  }
  
  Mover() {
    this.size = new PVector(0, 0);
    this.location = new PVector(0, 0);
    this.velocity = new PVector(0, 0);
    this.acceleration = new PVector(0, 0);
    this.strokeColor = color(0, 0, 0, 1);
    this.maxAcceleration = 0;
    this.limitVelocity = 0;
    this.mass = 0;
    this.density = 0; //todo
  }
  
  void setMass() {
    if(this.mass == 0)
      this.mass = (this.size == null ? 1 : (this.MASS_UNIT * this.size.x * this.size.y));
  }
  
  void applyForce(PVector force) {
    PVector forceCopy = force.get();
    
    this.setMass();
      
    forceCopy.div(this.mass); //f = ma, so a = f / m
    this.acceleration.add(forceCopy);
  }
  
  void limitVelocity() {
    if(Math.abs(this.velocity.x) > limitVelocity)
      this.velocity.x = (this.velocity.x / Math.abs(this.velocity.x)) * limitVelocity;
    if(Math.abs(this.velocity.y) > limitVelocity)
      this.velocity.y = (this.velocity.y / Math.abs(this.velocity.y)) * limitVelocity;
  }
  
  void limitAcceleration() {
    if(Math.abs(this.acceleration.x) > this.maxAcceleration)
      this.acceleration.x = (this.acceleration.x / Math.abs(this.acceleration.x)) * this.maxAcceleration;
    if(Math.abs(this.acceleration.y) > this.maxAcceleration)
      this.acceleration.y = (this.acceleration.y / Math.abs(this.acceleration.y)) * this.maxAcceleration;
  }
  
  void checkBounds(float x1, float y1, float x2, float y2) {    
    if(this.location.x < x1) {
      this.location.x = x1;
      this.velocity.x *= -1;
    }else if(this.location.x + this.size.x > x2) {
      this.location.x = x2 - this.size.x;
      this.velocity.x *= -1;
    }
    if(this.location.y < y1) {
      this.location.y = y1;
      this.velocity.y *= -1;
    }else if(this.location.y + this.size.y > y2) {
      this.location.y = y2 - this.size.y;
      this.velocity.y *= -1;
    }
  }
  
  void checkBounds(PVector lower, PVector upper) {
    this.checkBounds(lower.x, lower.y, upper.x, upper.y);
  }
  
  void stepVelocity() {
    this.velocity.add(this.acceleration);
  }
  
  void stepPosition() {
    this.location.add(this.velocity);
  }
  
  void stepAll() {
    this.stepVelocity();
    this.limitVelocity();
    this.limitAcceleration();
    this.stepPosition();
  }
  
  void sketch() {
    noFill();
    stroke(this.strokeColor);
    this.stepAll();
    rect(this.location.x, this.location.y, this.size.x, this.size.y);
  }
}

class FrictionPocket {
  PVector size,
  position;
  float frictionCoefficient;
  color strokeColor,
  fillColor;
  
  FrictionPocket(PVector size, PVector position, float frictionCoefficient, color strokeColor, color fillColor) {
    this.size = size;
    this.position = position;
    this.frictionCoefficient = frictionCoefficient;
    this.strokeColor = strokeColor;
    this.fillColor = fillColor;
  }
  
  FrictionPocket() {
    this.size = new PVector(0, 0);
    this.frictionCoefficient = 1;
    this.strokeColor = color(0, 0, 0, 1);
    this.fillColor = color(0, 0, 0, 1);
  }
  
  void sketch() {
    stroke(this.strokeColor);
    fill(this.fillColor);
    rect(this.position.x, this.position.y, this.size.x, this.size.y);
  }
  
  boolean pointIntersects(float px, float py, float x2, float y2, float x3, float y3) {
    return (x2 <= px
            && px <= x3
            && y2 <= py
            && py <= x3);
  }
  
  boolean pointIntersects(PVector point, PVector lower, PVector upper) {
    return this.pointIntersects(point.x, point.y, lower.x, lower.y, upper.x, upper.y);
  }
  
  boolean moverIntersects(Mover mover) {
    float lowerX = this.position.x,
    lowerY = this.position.y,
    upperX = lowerX + this.size.x,
    upperY = lowerY + this.size.y;
    
    return (this.pointIntersects(mover.location.x, mover.location.y, lowerX, lowerY, upperX, upperY)
            || this.pointIntersects(mover.location.x + mover.size.x, mover.location.y, lowerX, lowerY, upperX, upperY)
            || this.pointIntersects(mover.location.x, mover.location.y + mover.size.y, lowerX, lowerY, upperX, upperY)
            || this.pointIntersects(mover.location.x + mover.size.x, mover.location.y + mover.size.y, lowerX, lowerY, upperX, upperY));
  }
  
  void applyFrictionForce(Mover mover) {
    PVector frictionForce = mover.velocity.get();
    frictionForce.normalize();
    frictionForce.mult(-1 * (1 - this.frictionCoefficient));
    mover.applyForce(frictionForce);
  }
}

ArrayList<Mover> moverList;
FrictionPocket pocket;
PVector wind,
time;
int numberMover = 10;
float inc,
windMax;

void setup() {
  size(600, 600);
  frameRate(60);
  
  wind = new PVector(0.05, 0);
  windMax = .05;
  time = new PVector(random(10000), random(10000));
  inc = .025;
  
  moverList = new ArrayList<Mover>();
  
  for(int index = 0; index < 5; index++) {
    Mover mover = new Mover(); //PVector size, PVector location, PVector velocity, PVector acceleration, color strokeColor, float maxAcceleration, float limitVelocity
    mover.size = new PVector(10, 10);
    mover.location = new PVector(random(width - mover.size.x), random(height - mover.size.y));
    mover.velocity = new PVector(0, 0);
    mover.acceleration = new PVector(0, 0);
    mover.strokeColor = color(0);
    mover.maxAcceleration = .1;
    mover.limitVelocity = 5;
    
    moverList.add(mover);
  }
  
  pocket = new FrictionPocket(); //PVector size, PVector frictionDirection, float frictionCoefficient, color strokeColor, color fillColor
  pocket.size = new PVector(200, 200);
  pocket.position = new PVector(0, 0);
  pocket.frictionCoefficient = .05;
  pocket.strokeColor = color(0);
  pocket.fillColor = color(255, 255, 255, 100);
  
  
}

void draw() {
  background(255);
  
  wind.x = map(noise(time.x), 0, 1, -windMax, windMax);
  wind.y = map(noise(time.y), 0, 1, -windMax, windMax);
  time.add(inc, inc);
  
  
  for(int index = 0; index < moverList.size(); index++) {
    moverList.get(index).applyForce(wind);
    moverList.get(index).stepAll();
    moverList.get(index).checkBounds(0, 0, 600, 600);
    moverList.get(index).sketch();
    if(pocket.moverIntersects(moverList.get(index))) {
      println("Intersect: (" + moverList.get(index).location.x + ", " + moverList.get(index).location.y + ")");
      pocket.applyFrictionForce(moverList.get(index));
    }
  }
  pocket.sketch();
}