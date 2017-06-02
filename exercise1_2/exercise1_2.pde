import java.util.Random;
Vector2D position;
int size;
Random random;
Walker w1;

class Vector2D {
  float x,
  y;
  
  Vector2D(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void add(Vector2D vector2D) {
    this.x += vector2D.x;
    this.y += vector2D.y;
  }
  
  float getMagnitude() {
    return (float) Math.sqrt(Math.pow(x, 2) + Math.pow(y, 2));
  }
  
}

void setup() {
  size(700, 700);
  size = 2;
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
  float inc;
  Vector2D position,
  step,
  move;
  
  Walker() {
    this.position = new Vector2D((width / 2) - (size / 2), (height / 2) - (size / 2));
    this.step = new Vector2D(random(10000), random(10000));
    this.move = new Vector2D(0, 0);
    this.inc = .01;
  }
  
  void step() {
    this.move.x = map(noise(step.x), 0, 1, -1, 1);
    this.move.y = map(noise(step.y), 0, 1, -1, 1);
    
    this.position.add(this.move);
    
    this.step.x += this.inc;
    this.step.y += this.inc;
  }
  
  float getX() {
    return this.position.x;
  }
  
  float getY() {
    return this.position.y;
  }
}