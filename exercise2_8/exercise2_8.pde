ArrayList<Particle> particles;
ArrayList<Mover> attractors;
float gravityConstant;
ArrayList<PVector> locations;

void setup() {
  //size(1920, 1080);
  
  fullScreen();
  frameRate(30);
  
  gravityConstant = .0098;
  
  particles = new ArrayList<Particle>();
  for(int index = 0; index < 20; index++) {
    Particle particle = new Particle(); //PVector size, PVector location, PVector velocity, PVector acceleration, color strokeColor, float maxAcceleration, float limitVelocity
    particle.size = new PVector(1, 1);
    particle.setMass();
    particle.location = new PVector(random((width * .6) - particle.size.x) + width * .2, random((height * .6) - particle.size.y) + height * .2);
    particle.velocity = new PVector(0, 0);
    particle.acceleration = new PVector(0, 0);
    particle.strokeColor = color(random(255), random(255), random(255), 255);
    particle.maxAcceleration = 1;
    particle.limitVelocity = 5;
    
    particles.add(particle);
  }
  
  attractors = new ArrayList<Mover>();
  for(int index = 0; index < 2; index++) {
    Mover mover = new Mover();
    float size =  10;
    mover.size = new PVector(size, size);
    mover.setMass();
    mover.location = new PVector(random((width * .6) - mover.size.x) + width * .2, random((height * .6) - mover.size.y) + height * .2);
    mover.velocity = new PVector(0, 0);
    mover.acceleration = new PVector(0, 0);
    //mover.strokeColor = color(0, 0, 0, 0);
    mover.maxAcceleration = 0;
    mover.limitVelocity = 0;
    
    attractors.add(mover);
  }
}

void draw() {
  background(0);
  
  strokeWeight(2);
  for(int index = 0; index < particles.size(); index++) {
    particles.get(index).addLocation();
    particles.get(index).drawLocation(100);
    for(int index2 = 0; index2 < attractors.size(); index2++) {
      particles.get(index).attract(attractors.get(index2), gravityConstant);
    }
  particles.get(index).stepAll();
  particles.get(index).sketch();
  }
  strokeWeight(2);
  for(int index = 0; index < attractors.size(); index++) {
    attractors.get(index).sketch();
  }
}