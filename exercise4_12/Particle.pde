class Particle extends Mover {
  boolean isDead;
  int lifeTime;
  PImage image;
  
  Particle() {
    this(null);
  }
  
  Particle(PImage image) {
    super();
    this.isDead = false;
    this.lifeTime = 0;
    this.image = image;
  }
  
  void kill() {
    this.isDead = true;
  }
  
  boolean isDead() {
    return this.isDead;
  }
  
  void sketch() {
    noFill();
    stroke(this.strokeColor);
    this.stepAll();
    pushMatrix();
    translate(super.position.x, super.position.y);
    rotate(this.angle);
    rectMode(CENTER);
    if(this.image != null) {
      imageMode(CENTER);
      image(this.image, 0, 0);
    }else
      rect(0, 0, this.size.x, this.size.y);
    popMatrix();
  }
}