class Hinge {
  PVector position;
  ArrayList<Spring> springs;
  float maxForce; //maybe in future when im not lazy
  
  void Hinge() {
    this.position = new PVector(0, 0);
    this.springs = new ArrayList<Spring>();
    this.maxForce = 0;
  }
  
  void Hinge(PVector position, float maxForce) {
    this.position = position;
    this.springs = new ArrayList<Spring>();
    this.maxForce = maxForce;
  }
  
  void setPosition(PVector position) {
    this.position = position;
  }
  
  void addSpring(Spring spring) {
    this.springs.add(spring);
  }
  
  void removeSpring(Spring spring) {
    for(int index = 0; index < this.springs.size(); index++) {
      if(this.springs.get(index) == spring) {
        this.springs.remove(index);
        break;
      }
    }
  }
  
}