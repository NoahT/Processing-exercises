class ParticleSystem {
  ArrayList<Particle> particles;
  public ParticleSystem() {
    this.particles = new ArrayList<Particle>();
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