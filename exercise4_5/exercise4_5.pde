ArrayList<ParticleSystem> systems;

void setup() {
  fullScreen();
  frameRate(60);
  background(0);
  
  systems = new ArrayList<ParticleSystem>();
}

void draw() {
  background(0);
  
  for(int index = 0; index < systems.size(); index++) {
    systems.get(index).clean();
    systems.get(index).sketch();
    systems.get(index).removeLife();
  }
}

void mouseClicked() {
  ParticleSystem system = new ParticleSystem(new PVector(mouseX, mouseY));
  
  for(int index = 0; index < (int) random(15) + 10; index++) {
    Particle particle = new Particle();
    particle.size = new PVector(10, 10);
    particle.velocity = new PVector(map(random(1), 0, 1, -10, 10), map(random(1), 0, 1, -10, 10));
    particle.position.set(system.origin);
    particle.strokeColor = color(random(255), random(255), random(255), 255);
    particle.mass = 50;
    particle.angle = 0;
    particle.angularVelocity = map(random(1), 0, 1, -radians(15), radians(15));
    particle.lifeTime = (int) map(random(1), 0, 1, 150, 200);
    
    system.addParticle(particle);
  }
  
  systems.add(system);
}