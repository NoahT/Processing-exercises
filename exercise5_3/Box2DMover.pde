class Box2DMover {
  float width,
  height;
  
  color baseColor;
  
  Body body;
  
  Box2DMover() { //this is much cleaner
    this(0, 0, 0, 0, color(0), false);
  }
  
  Box2DMover(float width, float height) {
    this(width, height, 0, 0, color(0), false);
  }
  
  Box2DMover(float width, float height, float xPosition, float yPosition, boolean anchored) {
    this(width, height, xPosition, yPosition, color(0), anchored);
  }
  
  Box2DMover(float width, float height, float xPosition, float yPosition, color baseColor, boolean anchored) {
    this.width = width;
    this.height = height;
    this.baseColor = baseColor;
    
    BodyDef bodyDef = new BodyDef();
    bodyDef.type = (anchored ? BodyType.STATIC : BodyType.DYNAMIC);
    bodyDef.position.set(box2D.coordPixelsToWorld(xPosition, yPosition));
    
    this.body = box2D.createBody(bodyDef);
    
    PolygonShape polygonShape = new PolygonShape();
    polygonShape.setAsBox(box2D.scalarPixelsToWorld(this.width / 2), box2D.scalarPixelsToWorld(this.height / 2));
    
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
    
    rect(0, 0, this.width, this.height);
    popMatrix();
  }
  
  void removeBody() {
    box2D.destroyBody(this.body);
  }
  
}