class Liquid {
  PVector size,
  position;
  float frictionCoefficient;
  color strokeColor,
  fillColor;
  
  Liquid(PVector size, PVector position, float frictionCoefficient, color strokeColor, color fillColor) {
    this.size = size;
    this.position = position;
    this.frictionCoefficient = frictionCoefficient;
    this.strokeColor = strokeColor;
    this.fillColor = fillColor;
  }
  
  Liquid() {
    this.size = new PVector(0, 0);
    this.frictionCoefficient = 1;
    this.strokeColor = color(0, 0, 0, 1);
    this.fillColor = color(0, 0, 0, 1);
  }
  
  void sketch() {
    stroke(this.strokeColor);
    fill(this.fillColor);
    rect(this.position.x, this.position.y, this.size.x, this.size.y);
  }
  
  boolean pointIntersects(float px, float py, float x2, float y2, float x3, float y3) {
    return (x2 <= px
            && px <= x3
            && y2 <= py
            && py <= x3);
  }
  
  boolean pointIntersects(PVector point, PVector lower, PVector upper) {
    return this.pointIntersects(point.x, point.y, lower.x, lower.y, upper.x, upper.y);
  }
  
  boolean moverIntersects(Mover mover) {
    float lowerX = this.position.x,
    lowerY = this.position.y,
    upperX = lowerX + this.size.x,
    upperY = lowerY + this.size.y;
    
    return (this.pointIntersects(mover.location.x, mover.location.y, lowerX, lowerY, upperX, upperY)
            || this.pointIntersects(mover.location.x + mover.size.x, mover.location.y, lowerX, lowerY, upperX, upperY)
            || this.pointIntersects(mover.location.x, mover.location.y + mover.size.y, lowerX, lowerY, upperX, upperY)
            || this.pointIntersects(mover.location.x + mover.size.x, mover.location.y + mover.size.y, lowerX, lowerY, upperX, upperY));
  }
  
  float getFrontSideLength(Mover mover) { //assuming no rotation, and apply drag in direction of greatest speed (x/y)
    float x1 = mover.location.x,
    y1 = mover.location.y,
    x2 = x1 + mover.size.x,
    y2 = y1 + mover.size.y,
    // x1,y1  x2,y1
    // x1,y2  x2,y2
    side1 = new PVector(x2 - x1, 0).mag(),
    side2 = new PVector(0, y2 - y1).mag();
    
    if(Math.abs(mover.velocity.x) > Math.abs(mover.velocity.y))
      return side2;
    return side1;
    
    
  }
  
  void applyDrag(Mover mover) {
    PVector dragForce = mover.velocity.get();
    float speed = mover.velocity.get().mag();
    
    dragForce.normalize();
    dragForce.mult(-1 * this.frictionCoefficient * speed * speed * this.getFrontSideLength(mover));
    mover.applyForce(dragForce); //f = ma, so a = f / m (bigger mass, smaller accel.)
  }
}