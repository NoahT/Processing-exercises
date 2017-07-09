class BreakableMover extends Mover {
  ParticleSystem particles;
  float particleSize;
  boolean broken;
  
  BreakableMover() {
    this(0);
  }
  
  BreakableMover(float particleSize) {
    super();
    this.particles = new ParticleSystem();
    this.broken = false;
    this.particleSize = particleSize;
  }
  
  void shatter() {
    if(this.broken)
      return;
      
    this.particles.origin.set(super.position.x + (super.size.x / 2), super.position.y + (super.size.y / 2));
    
    float iterations = super.getArea() / this.particleSize;
    println(iterations);
    for(int index = 0; index < iterations; index++) {
      Particle particle = new Particle();
      particle.size = new PVector(this.particleSize, this.particleSize);
      particle.velocity = new PVector(map(random(1), 0, 1, -10, 10), map(random(1), 0, 1, -10, 10));
      particle.position.set(this.particles.origin);
      particle.strokeColor = color(random(255), random(255), random(255), 255);
      particle.mass = 0;
      particle.angle = 0;
      particle.angularVelocity = map(random(1), 0, 1, -radians(15), radians(15));
      particle.lifeTime = (int) map(random(1), 0, 1, 150, 200);
      
      this.particles.addParticle(particle);
    }
    
    this.broken = true;
  }
  
  void sketch() {
    if(this.broken)
      this.particles.sketch();
    else
      super.sketch();
  }
  
}