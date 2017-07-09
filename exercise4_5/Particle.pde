class Particle extends Mover {
  boolean isDead;
  int lifeTime;
  Particle() {
    super();
    this.isDead = false;
    this.lifeTime = 0;
  }
  
  void kill() {
    this.isDead = true;
  }
  
  boolean isDead() {
    return this.isDead;
  }
}