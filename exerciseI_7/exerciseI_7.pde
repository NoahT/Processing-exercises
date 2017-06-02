import java.util.Random;
int x,
y,
size;
Random random;
Walker w1;
void setup() {
  size(700, 700);
  size = 2;
  x = (width / 2) - (size / 2);
  y = (height / 2) - (size / 2);
  random = new Random();
  w1 = new Walker();
  background(255);
}

void draw() {
  frameRate(60);
  w1.step();
  
  noStroke();
  fill(0);
  rect(w1.getX(), w1.getY(), size, size);
  
}

class Walker {
  float x,
  y,
  stepX,
  stepY,
  moveX,
  moveY,
  inc;
  
  Walker() {
    this.x = (width / 2) - (size / 2);
    this.y = (height / 2) - (size / 2);
    this.stepX = random(10000);
    this.stepY = random(10000);
    this.inc = .01;
  }
  
  void step() {
    this.moveX = map(noise(stepX), 0, 1, -1, 1);
    this.moveY = map(noise(stepY), 0, 1, -1, 1);
    
    this.x += this.moveX;
    this.y += this.moveY;
    
    this.stepX += this.inc;
    this.stepY += this.inc;
  }
  
  float getX() {
    return this.x;
  }
  
  float getY() {
    return this.y;
  }
}