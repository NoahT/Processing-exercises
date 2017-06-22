Pendulum pendulum;

void setup() {
  fullScreen();
  frameRate(60);
  background(255);
  
  this.pendulum = new Pendulum(new PVector(width / 2, height * .1), 500);
  
}

void draw() {
  background(255);
  this.pendulum.move(); 
}