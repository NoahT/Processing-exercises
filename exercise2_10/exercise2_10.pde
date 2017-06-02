ArrayList<Particle> particles;
float gravityConstant;

void setup() {
  //size(500, 500);
  
  fullScreen();
  frameRate(20);
  
  gravityConstant = .098;
  
  particles = new ArrayList<Particle>();
  for(int index = 0; index < 100; index++) {
    Particle particle = new Particle(); //PVector size, PVector location, PVector velocity, PVector acceleration, color strokeColor, float maxAcceleration, float limitVelocity
    particle.size = new PVector(2, 2);
    particle.setMass();
    particle.location = new PVector(random((width * .6) - particle.size.x) + width * .2, random((height * .6) - particle.size.y) + height * .2);
    particle.velocity = new PVector(0, 0);
    particle.acceleration = new PVector(0, 0);
    particle.strokeColor = color(random(255), random(255), random(255), 255);
    particle.maxAcceleration = 1;
    particle.limitVelocity = 5;
    
    particles.add(particle);
  }
}

void draw() {
  background(0);
  
  strokeWeight(2);
  for(int index = 0; index < particles.size(); index++) {
    particles.get(index).addLocation();
    for(int index2 = 0; index2 < particles.size(); index2++) {
      if(index == index2)
        continue;
      particles.get(index2).attract(particles.get(index), -gravityConstant * .25);
    }
    particles.get(index).attract(new PVector(mouseX, mouseY), gravityConstant * 3);
    particles.get(index).drawLocation(100);
    particles.get(index).stepAll();
    particles.get(index).sketch();
  }
}