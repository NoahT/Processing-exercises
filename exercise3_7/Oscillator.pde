class Oscillator {
  PVector angle,
  velocity,
  amplitude,
  position;
  
  Oscillator() {
    this.angle = new PVector(0, 0);
    this.velocity = new PVector(.05, .5);
    this.amplitude = new PVector(100, 50);
    this.position = new PVector(0, 0);
  }
  
  void oscillate() {
    this.angle.add(velocity);
  }
  
  void stepPosition() {
    this.position.set(this.amplitude.x * sin(this.angle.x), this.amplitude.y * sin(this.angle.y));
  }
  
  void sketch() {
    noFill();
    stroke(255, 255, 255, 255);
    this.stepPosition();
    
    pushMatrix();
    translate(width / 2, height / 2);
    //line(0, 0, this.position.x, this.position.y);
    rectMode(CENTER);
    rect(this.position.x, this.position.y, 2, 2);
    popMatrix();
  }
}