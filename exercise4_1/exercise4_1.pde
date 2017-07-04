ParticleSystem system;
PVector gravity,
wind;
Particle particle;

void setup() {
  fullScreen();
  background(255);
  
  this.system = new ParticleSystem();
  this.gravity = new PVector(0, 9.8);
  this.wind = new PVector(10, 0);
}

void draw() {
  background(255);
  
  system.applyForce(this.gravity);
  
  for(int index = 0; index < system.particles.size(); index++) {
    if(system.particles.get(index).lifeTime <= 0) {
      system.particles.get(index).kill();
    }
    //system.particles.get(index).lifeTime--;
  }
  
  system.clean();
  particle = new Particle();
  particle.size = new PVector(5, 5);
  particle.velocity = new PVector(map(random(1), 0, 1, -10, 10), map(random(1), 0, 1, 0, -20));
  particle.position = new PVector(width / 2 - (particle.size.x / 2), height * .5);
  particle.strokeColor = color(0);
  particle.mass = 50;
  particle.angle = 0;
  particle.lifeTime = (int) map(random(1), 0, 1, 5, 10);
  this.system.addParticle(particle);
  if(keyPressed && key == ' ') {
    system.applyForce(wind);
  }
  
  system.applyForce(gravity);
  system.sketch();
  
}