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
velocity;

void setup() {
  size(400, 400, P3D);
}

void draw() {
  background(255);
  translate(width / 2, height / 2, 0);
  rotateX(map(((float) mouseY / height), 0, 1, radians(75), radians(-75)));
  rotateY(map(((float) mouseX / width), 0, 1, radians(-75), radians(75)));
  rectMode(CENTER);
  
  //lens
  fill(0);
  rect(0, 0, 20, 20);
  
  //barrel
  stroke(0);
  fill(200);
  translate(0, 0, -8);
  box(25, 25, 15);
  
  //base
  translate(0, 0, -19);
  box(80, 50, 20);
  
  //flash
  fill(0);
  translate(-30, -20, 11);
  rect(0, 0, 10, 5);
  
  //button
  translate(55, -6, -11);
  box(10, 3, 10);
  
}