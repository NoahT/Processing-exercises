class Mover {
  PVector size,
  location,
  velocity,
  acceleration;
  color strokeColor;
  float maxAcceleration;
  
  Mover(PVector size, PVector location, PVector velocity, PVector acceleration, color strokeColor, float maxAcceleration) {
    this.size = size;
    this.location = location;
    this.velocity = velocity;
    this.acceleration = acceleration;
    this.strokeColor = strokeColor;
    this.maxAcceleration = maxAcceleration;
  }
  
  Mover() {
  }
  
  void checkBounds(PVector lower, PVector upper) {
    if(this.location.x - (this.size.x / 2) < lower.x
      || this.location.x + (this.size.x / 2) > upper.x)
      this.velocity.x *= -1;
    if(this.location.y - (this.size.y / 2) < lower.y
      || this.location.y + (this.size.y / 2) > upper.y)
      this.velocity.y *= -1;
  }
  
  void changeAcceleration(float timeX, float timeY) {
    if(this.acceleration == null)
      this.acceleration = new PVector();
    this.acceleration.x = map(noise(timeX), 0, 1, -maxAcceleration, maxAcceleration);
    this.acceleration.y = map(noise(timeY), 0, 1, -maxAcceleration, maxAcceleration);
  }
  
  void accelerate() {
    this.velocity.add(this.acceleration);
  }
  
  void step() {
    this.location.add(this.velocity);
  }
  
  void sketch() {
    noFill();
    stroke(this.strokeColor);
    rect(this.location.x, this.location.y, this.size.x, this.size.y);
  }
}

Mover mover;
float maxAcceleration,
timeX,
timeY;
PVector lowerBound,
upperBound;

void setup() {
  lowerBound = new PVector(0, 0);
  upperBound = new PVector(500, 500);
  size(500, 500);
  frameRate(30);
  timeX = random(10000);
  timeY = random(10000);
  //Let's stop doing this for instantiation
  //mover = new Mover(new PVector(20, 20), new PVector(width / 2, height / 2), new PVector(0, 0), new PVector(map(noise(0), 0, 1, -maxAcceleration, maxAcceleration), map(noise(0), 0, 1, -maxAcceleration, maxAcceleration)), color(0));
  //start doing this:
  mover = new Mover();
  mover.size = new PVector(20, 20);
  mover.location = new PVector(width / 2, height / 2);
  mover.velocity = new PVector(0, 0);
  mover.maxAcceleration = .05;
}

void draw() {
  background(255);
  mover.checkBounds(lowerBound, upperBound);
  mover.changeAcceleration(timeX, timeY);
  timeX += .01;
  timeY += .01;
  mover.accelerate();
  mover.step();
  mover.sketch();
  println(mover.acceleration.x + "\t" + mover.acceleration.y);
}