class Box2DMover {
  PVector size;
  
  color baseColor;
  
  Body body;
  BodyDef bodyDef;
  
  Box2DMover() { //this is much cleaner
    this(new PVector(0, 0), new PVector(0, 0), color(0), false);
  }
  
  Box2DMover(PVector size) {
    this(size, new PVector(0, 0), color(0), false);
  }
  
  Box2DMover(PVector size, PVector location, boolean anchored) {
    this(size, location, color(0), anchored);
  }
  
  Box2DMover(PVector size, PVector location, color baseColor, boolean anchored) {
    this.size = size;
    this.baseColor = baseColor;
    
    this.bodyDef = new BodyDef();
    bodyDef.type = (anchored ? BodyType.STATIC : BodyType.DYNAMIC);
    bodyDef.position.set(box2D.coordPixelsToWorld(location.x, location.y));
    bodyDef.fixedRotation = true;
    
    this.body = box2D.createBody(bodyDef);
    
    PolygonShape polygonShape = new PolygonShape();
    polygonShape.setAsBox(box2D.scalarPixelsToWorld(this.size.x / 2), box2D.scalarPixelsToWorld(this.size.y / 2));
    
    FixtureDef fixtureDef = new FixtureDef();
    fixtureDef.shape = polygonShape;
    fixtureDef.density = 1;
    fixtureDef.friction = .5;
    fixtureDef.restitution = .5;
    
    body.createFixture(fixtureDef);
  }
  
  void sketch() {
    Vec2 position = box2D.getBodyPixelCoord(this.body);
    float angle = body.getAngle();
    
    pushMatrix();
    translate(position.x, position.y);
    rotate(-angle); //counter clockwise in box2D
    
    fill(this.baseColor);
    stroke(this.baseColor);
    
    rectMode(CENTER);
    
    rect(0, 0, this.size.x, this.size.y);
    popMatrix();
  }
  
  void removeBody() {
    box2D.destroyBody(this.body);
  }
  
}