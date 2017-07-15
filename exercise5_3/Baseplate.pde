class Baseplate {
  color baseColor;
  
  Body body;
  ArrayList<Vec2> points;
  
  Baseplate() {
    this(color(0), new ArrayList<Vec2>());
  }
  
  Baseplate(color baseColor) {
    this(baseColor, new ArrayList<Vec2>());
  }
  
  Baseplate(color baseColor, ArrayList<Vec2> points) {
    this.baseColor = baseColor;
    this.points = points;
    
    Vec2[] vertices = new Vec2[this.points.size()];
    for(int index = 0; index < vertices.length; index++) {
      vertices[index] = box2D.coordPixelsToWorld(this.points.get(index));
    }
    
    ChainShape chainShape = new ChainShape();
    chainShape.createChain(vertices, vertices.length);
    
    FixtureDef fixtureDef = new FixtureDef();
    fixtureDef.shape = chainShape;
    fixtureDef.density = 1;
    fixtureDef.friction = 0;
    fixtureDef.restitution = 0;
    
    BodyDef bodyDef = new BodyDef();
    bodyDef.type = BodyType.STATIC;
    
    this.body = box2D.createBody(bodyDef);
    this.body.createFixture(fixtureDef);
  }
  
  void sketch() {
    stroke(this.baseColor);
    noFill(); //fix later
    
    beginShape();
    for(Vec2 vector: this.points) {
      vertex(vector.x, vector.y);
    }
    endShape();
  }
  
  void removeBody() {
    box2D.destroyBody(this.body);
  }
  
}