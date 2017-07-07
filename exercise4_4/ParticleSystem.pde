class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  
  public ParticleSystem() {
    this(new PVector(0, 0));
  }
  
  public ParticleSystem(PVector origin) {
    this.particles = new ArrayList<Particle>();
    this.origin = origin;
  }
  
  void addParticle(Particle particle) {
    this.particles.add(particle);
  }
  
  void clean() {
    for(int index = 0; index < this.particles.size(); index++) {
      if(this.particles.get(index).isDead()) {
        this.particles.remove(index--);
      }
    }
  }
  
  void removeLife() {
    for(int index = 0; index < this.particles.size(); index++) {
      if(this.particles.get(index).lifeTime-- <= 0)
        this.particles.get(index).isDead = true;
    }
  }
  
  void applyForce(PVector force) {
    for(int index = 0; index < this.particles.size(); index++)
      this.particles.get(index).applyForce(force);
  }
  
  void sketch() {
    for(int index = 0; index < this.particles.size(); index++) {
      particles.get(index).sketch();
    }
  }
  
}