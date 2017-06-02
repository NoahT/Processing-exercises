class Vector2D {
  float x,
  y;
  
  Vector2D(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void limit(float max) {
    if(this.mag() > max) {
      this.normalize();
      this.mult(max);
    }
  }
  
  void add(Vector2D vector2D) {
    this.x += vector2D.x;
    this.y += vector2D.y;
  }
  
  void sub(Vector2D vector2D) {
    this.x -= vector2D.x;
    this.y -= vector2D.y;
  }
  
  float mag() {
    return (float) Math.sqrt((this.x * this.x) + (this.y * this.y));
  }
  
  Vector2D normalize() {
    return new Vector2D(this.x / this.mag(), this.y / this.mag());
  }
  
  void mult(float multiplier) {
    this.x *= multiplier;
    this.y *= multiplier;
  }
}

class Car {
  Vector2D size,
  position,
  velocity,
  acceleration;
  color strokeColor,
  fillColor;
  
  Car(Vector2D size, Vector2D position, Vector2D velocity, Vector2D acceleration, color strokeColor, color fillColor) {
    this.size = size;
    this.position = position;
    this.velocity = velocity;
    this.acceleration = acceleration;
    this.strokeColor = strokeColor;
    this.fillColor = fillColor;
  }
  
  void accelerate() {
    this.velocity.add(this.acceleration);
  }
  
  void deAccelerate() {
    this.velocity.sub(this.acceleration);
  }
  
  void move() {
    this.position.add(this.velocity);
  }
  
  void sketch() {
    stroke(this.strokeColor);
    fill(this.fillColor);
    rect(this.position.x, this.position.y, this.size.x, this.size.y);
  }
}

Car car;

void setup() {
  size(500, 500);
  frameRate(30);
  car = new Car(new Vector2D(15, 25), new Vector2D(width / 2, height * .8), new Vector2D(0, 0), new Vector2D(0, -.1), color(random(255), random(255), random(255)), color(0, 0, 0, 1));
}

void draw() {
  background(0);
  car.move();
  car.sketch();
}

void keyPressed() {
  switch(key) {
    case 'w':
    car.accelerate();
    break;
    case 's':
    car.deAccelerate();
    break;
  } 
}