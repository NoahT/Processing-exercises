class Oscillator {
  PVector angle,
  velocity,
  acceleration,
  amplitude,
  position;
  
  Oscillator() {
    this.angle = new PVector(0, 0);
    this.velocity = new PVector(random(-.05, .05), random(-.05, .05));
    this.acceleration = new PVector(random(-.00025, .00025), random(-.00025, .00025));
    this.amplitude = new PVector(map(random(1), 0, 1, width * .05, width * .5), map(random(1), 0, 1, height * .05, height * .5));
    this.position = new PVector(0, 0);
  }
  
  void oscillate() {
    this.angle.add(velocity);
  }
  
  void accelerate() {
    this.velocity.add(acceleration);
  }
  
  void stepPosition() {
    this.position.set(this.amplitude.x * sin(this.angle.x), this.amplitude.y * sin(this.angle.y));
  }
  
  void sketch() {
    noFill();
    stroke(255, 255, 255, 255);
    
    pushMatrix();
    translate(width / 2, height / 2);
    line(0, 0, this.position.x, this.position.y);
    rectMode(CENTER);
    rect(this.position.x, this.position.y, 2, 2);
    popMatrix();
  }
}