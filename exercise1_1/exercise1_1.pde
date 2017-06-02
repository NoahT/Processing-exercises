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

Vector2D position,
velocity,
acceleration;

void setup() {
  size(500, 500);
  position = new Vector2D(width / 2, height * .1);
  velocity = new Vector2D(0, 0);
  acceleration = new Vector2D(0, .098);
  background(255);
  fill(0);
  stroke(0);
}

void draw() {
  background(255);
  velocity.add(acceleration);
  position.add(velocity);
  
  rect(position.x, position.y, 5, 5);
}