class Wave {
  ArrayList<PVector> points;
  PVector startingVector;
  float size,
  amplitude,
  angle,
  angleVel,
  xIncrement;
  
  Wave() {
    this.points = new ArrayList<PVector>();
    this.startingVector = new PVector(0, 0);
    this.size = 2;
    this.amplitude = 50;
    this.angle = 0;
    this.angleVel = radians(1);
    this.xIncrement = 2;
  }
  
  Wave(float size, float amplitude, float angleVel, float xIncrement, PVector start) {
    this.points = new ArrayList<PVector>();
    this.startingVector = start;
    this.size = size;
    this.amplitude = amplitude;
    this.angleVel = angleVel;
    this.xIncrement = xIncrement;
  }
  
  void addPoint(float x, float y) {
    this.points.add(new PVector(x, y));
  }
  
  void addRelativePoint(float y) {
    if(this.points.size() == 0)
      return;
    PVector pVector = new PVector(this.points.get(this.points.size() - 1).x + this.xIncrement, y);
    this.points.add(pVector);
  }
  
  void addWavePoint() {
    if(this.points.size() == 0)
      this.points.add(this.startingVector);
    float y = map(sin(angle), -1, 1, -amplitude / 2, amplitude / 2);
    this.angle += this.angleVel;
    PVector pVector = new PVector(this.points.get(this.points.size() - 1).x + this.xIncrement, this.points.get(0).y + y);
    this.points.add(pVector);
    println(pVector.toString());
  }
  
  void sketch() {
    for(int index = 0; index < this.points.size(); index++) {
      stroke(0);
      fill(0);
      rectMode(CENTER);
      rect(this.points.get(index).x, this.points.get(index).y, this.size, this.size); 
    }
  }
}