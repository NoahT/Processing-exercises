PImage[] images;
PVector gravity;
ParticleSystem particles;

void setup() {
  fullScreen();
  frameRate(60);
  background(0);
  
  gravity = new PVector(0, .98);
  images = new PImage[2];
  images[0] = loadImage("hotdog.png");
  images[1] = loadImage("trollface.png");
  
  particles = new ParticleSystem(new PVector(mouseX, mouseY));
}

void draw() {
  background(0);
  particles.origin.set(mouseX, mouseY);
  //image(image, (width / 2) - (image.width / 2), height * .1);
  particles.applyForce(gravity);
  particles.sketch();
}

void mouseClicked() {
  Particle particle = new Particle(images[(int)random(images.length)]);
  particle.size = new PVector(10, 10);
  particle.velocity = new PVector(map(randomGaussian(), -1, 1, -10, 10), map(random(1), 0, 1, -10, 0));
  particle.position.set(particles.origin);
  particle.strokeColor = color(random(255), random(255), random(255), 255);
  particle.mass = 10;
  particle.angle = 0;
  particle.angularVelocity = map(random(1), 0, 1, -radians(15), radians(15));
  particle.lifeTime = (int) map(random(1), 0, 1, 450, 500);
  
  particles.addParticle(particle);
}