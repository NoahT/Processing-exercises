class Box2DMouseJoint {
  Box2DMover mover1,
  mover2;
  MouseJointDef mjd;
  MouseJoint mj;
  
  Box2DMouseJoint() {
  }
  
  Box2DMouseJoint(Body mover1, Body mover2, PVector target) {
    this.mjd = new MouseJointDef();
    this.mjd.bodyA = mover1;
    this.mjd.bodyB = mover2;
    
    this.mj = (MouseJoint) box2D.world.createJoint(mjd);
    this.mj.setTarget(box2D.coordPixelsToWorld(target.x, target.y));
  }
  
  void setDampingRatio(float dampingRatio) { //0 to 1
    this.mj.setDampingRatio(dampingRatio);
  }
  
  void setFrequencyHz(float frequencyHz) {
    this.mj.setFrequency(frequencyHz);
  }
  
  void setMaxForce(float maxForce) {
    this.mj.setMaxForce(maxForce);
  }
  
  void setTarget(PVector target) {
    this.mj.setTarget(box2D.coordPixelsToWorld(target.x, target.y));
  }
}