class Tether {
  PVector point1,
  point2;
  color strokeColor;
  
  Tether() {
    this.point1 = new PVector(0, 0);
    this.point2 = new PVector(0, 0);
    this.strokeColor = color(0, 0, 0, 255);
  }
  
  Tether(PVector point1, PVector point2, color strokeColor) {
    this.point1 = point1;
    this.point2 = point2;
    this.strokeColor = strokeColor;
  }
  
  Tether(PVector point1, PVector point2) {
    this(point1, point2, color(0));
  }
  
  void sketch() {
    strokeWeight(1);
    line(point1.x, point1.y, point2.x, point2.y);
  }
}