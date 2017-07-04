class Spring { //fspring = -k * x
  PVector position;
  float minLength,
  maxLength,
  currentLength,
  springCoeff,
  angle;
  Mover mover;
  
  
  void Spring() {
    this.position = new PVector(0, 0);
    this.minLength = 0;
    this.maxLength = 0;
    this.currentLength = 0;
    this.springCoeff = 0;
    this.angle = 0;
    this.mover = new Mover();
  }
  
  void Spring(PVector position, float minLength, float maxLength, float currentLength, float springCoeff, Mover mover) {
    this.position = position;
    this.minLength = minLength;
    this.maxLength = maxLength;
    this.currentLength = this.minLength;
    this.springCoeff = springCoeff;
    this.mover = mover;
  }
  
  PVector getEndPoint() { //gets the endpoint location relative to other endpoint position of spring
    float x = cos(this.angle) * this.currentLength,
    y = sin(this.angle) * this.currentLength;
    return this.position.add(x, y);
  }
  
  void sketch() {
    this.mover.stepAll();
    
    noFill();
    stroke(this.mover.strokeColor);
    line(this.position.x, this.position.y, this.getEndPoint().x, this.getEndPoint().y);
    
    
    
    
  }
}