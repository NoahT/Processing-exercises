class Bridge {
  ArrayList<Box2DMover> bridgePoints;
  
  Bridge(PVector start, int numSegments) {
    this(start, 5, 20);
  }
  
  Bridge(PVector start, float gapSize, int numSegments) {
    this.bridgePoints = new ArrayList<Box2DMover>();
    
    this.bridgePoints.add(new Box2DMover(10, 10, start.x, start.y, color(0), true));
    
    for(int index = 1; index < numSegments; index++) {
      
      if(index == numSegments - 1)
        this.bridgePoints.add(new Box2DMover(10, 10, start.x + (gapSize * index), start.y, color(0), true));
      else
        this.bridgePoints.add(new Box2DMover(10, 10, start.x + (gapSize * index), start.y, color(0), false));
      
      DistanceJointDef djd = new DistanceJointDef();
      djd.bodyA = this.bridgePoints.get(index - 1).body;
      djd.bodyB = this.bridgePoints.get(index).body;
      
      djd.length = box2D.scalarPixelsToWorld(1);
      //djd.dampingRatio = 0;
      //djd.frequencyHz = 1;
      DistanceJoint dj = (DistanceJoint) box2D.world.createJoint(djd);
    }
    
  }
  
  void sketch() {
    for(Box2DMover mover : this.bridgePoints) {
      mover.sketch();
    }
  }
  
}