ParticleSystem system;
PVector gravity,
wind;

void setup() {
  fullScreen();
  frameRate(30);
  background(0);
  
  this.system = new ParticleSystem(new PVector(mouseX, mouseY));
  this.gravity = new PVector(0, 9.8);
  this.wind = new PVector(10, 0);
}

void draw() {
  background(0);
  
  system.origin.set(mouseX, mouseY);
  
  system.applyForce(gravity);
  
  for(int index = 0; index < system.particles.size(); index++) {
    if(system.particles.get(index).lifeTime <= 0) {
      system.particles.get(index).kill();
    }
    system.particles.get(index).lifeTime--;
  }
  
  system.clean();
  Particle particle = new Particle();
  particle.size = new PVector(10, 10);
  particle.velocity = new PVector(map(random(1), 0, 1, -10, 10), map(random(1), 0, 1, -10, 0));
  particle.position.set(system.origin);
  particle.strokeColor = color(random(255), random(255), random(255), 255);
  particle.mass = 50;
  particle.angle = 0;
  particle.angularVelocity = map(random(1), 0, 1, -radians(15), radians(15));
  particle.lifeTime = (int) map(random(1), 0, 1, 150, 200);
  this.system.addParticle(particle);
  if(keyPressed && key == ' ') {
    system.applyForce(wind);
  }
  
  system.sketch();
  
}