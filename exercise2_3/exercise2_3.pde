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
  
  void applyForce(PVector force) {
    PVector forceCopy = force.get();
    forceCopy.div(this.mass); //f = ma, so a = f / m
    println(forceCopy.x + "\t" + forceCopy.y);
    this.acceleration.add(forceCopy);
  }
  
  void limit() {
    if(Math.abs(this.velocity.x) > limitVelocity)
      this.velocity.x = (this.velocity.x / Math.abs(this.velocity.x)) * limitVelocity;
    if(Math.abs(this.velocity.y) > limitVelocity)
      this.velocity.y = (this.velocity.y / Math.abs(this.velocity.y)) * limitVelocity;
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
    this.limit();
    this.stepPosition();
  }
  
  void sketch() {
    noFill();
    stroke(this.strokeColor);
    this.stepAll();
    rect(this.location.x, this.location.y, this.size.x, this.size.y);
  }
  
  void applyForceBoundRight(float x1, float y1, float x2, float y2, float forceMag) {
    float distance;
    if(this.location.x < x1) {
      this.location.x = x1;
      this.velocity.x = 0;
      this.acceleration.x = 0; //hacky, might come back later to make better
    }else if(this.location.x + this.size.x > x2) {
      distance = x2 - this.location.x;
      this.applyForce(new PVector(forceMag * distance, 0));
    }
    if(this.location.y < y1) {
      this.location.y = y1;
      this.velocity.y *= -1;
    }else if(this.location.y + this.size.y > y2) {
      this.location.y = y2 - this.size.y;
      this.velocity.y *= -1;
    }
    /*
    if(this.location.y < y1) {
      distance = y1 - this.location.x;
      this.applyForce(new PVector(forceMag / distance, 0));
    }else if(this.location.y + this.size.y > y2) {
      distance = y2 - this.location.x;
      this.applyForce(new PVector(forceMag / distance, 0));
    }
    */
  }
}

ArrayList<Mover> mover;
PVector wind;
int numberMover = 10;

void setup() {
  size(600, 300);
  
  wind = new PVector(.05, 0);
  
  mover = new ArrayList<Mover>();
  for(int index = 0; index < numberMover; index++) { //color strokeColor, float maxAcceleration, float limitVelocity
    Mover m = new Mover();
    
    float size = random(10) + 5;
    m.size.set(size, size);
    
    m.location.set(random(width - m.size.x), random(height - m.size.y));
    m.velocity.set(0, 0);
    m.acceleration.set(0, .098);
    
    m.strokeColor = color(0);
    
    m.maxAcceleration = .025;
    m.limitVelocity = 5;
    
    m.mass = m.MASS_UNIT * (m.size.x * m.size.y);
    
    mover.add(m);
  }
}

void draw() {
  background(255);
  for(int index = 0; index < mover.size(); index++) {
    mover.get(index).applyForce(wind);
    mover.get(index).sketch();
    mover.get(index).applyForceBoundRight(0, 0, 600, 300, .01);
  }
}