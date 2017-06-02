class Vector3D {
  float x,
  y,
  z;
  
  Vector3D(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  void add(Vector3D vector3D) {
    this.x += vector3D.x;
    this.y += vector3D.y;
    this.z += vector3D.z;
  }
  
  void add(float x, float y, float z) {
    this.x += x;
    this.y += y;
    this.z += z;
  }
  
  float getMagnitude() {
    return (float) Math.sqrt(Math.pow(x, 2) + Math.pow(y, 2) + Math.pow(z, 2));
  }
  
}

class Particle {
  float size;
  Vector3D position,
  velocity;
  
  Particle(float size, Vector3D position, Vector3D velocity) {
    this.size = size;
    this.position = position;
    this.velocity = velocity;
  }
  
  void step() {
    this.position.x += (this.velocity.x / frameRate);
    this.position.y += (this.velocity.y / frameRate);
    this.position.z += (this.velocity.z / frameRate);
  }
  
  void checkBounds(Vector3D size) {
    if(this.position.x - (this.size / 2) < -(size.x / 2)
    || this.position.x + (this.size / 2) > (size.x / 2))
      this.velocity.x *= -1;
    if(this.position.y - (this.size / 2) < -(size.y / 2)
    || this.position.y + (this.size / 2) > (size.y / 2))
      this.velocity.y *= -1;
    if(this.position.z - (this.size / 2) < -(size.z / 2)
    || this.position.z + (this.size / 2) > (size.z / 2))
      this.velocity.z *= -1;
  }
}


import java.util.Random;
ArrayList<Particle> particles;
int numberParticles;
Vector3D boxSize,
translatePosition;
float particleSize,
particleSpeed;

void setup() {
  size(400, 400, P3D);
  frameRate(30);
  boxSize = new Vector3D(200, 200, 200);
  
  translatePosition = new Vector3D(0, 0, 0);
  translatePosition.add(new Vector3D(width / 2, height / 2, 0));
  translate(translatePosition.x, translatePosition.y, translatePosition.z);
  
  Random random = new Random();
  particleSize = 10;
  particleSpeed = 50;
  numberParticles = 20;
  particles = new ArrayList<Particle>();
  for(int index = 0; index < numberParticles; index++) {
    particles.add(new Particle((float) random.nextGaussian() * particleSize,
    new Vector3D(0, 0, 0),
    new Vector3D((float) random.nextGaussian() * particleSpeed, (float) random.nextGaussian() * particleSpeed, (float) random.nextGaussian() * particleSpeed)));
  }
  
  noFill();
  stroke(0);
}

void draw() {
  background(255);
  
  translate(translatePosition.x, translatePosition.y, translatePosition.z);
  rotateX(map(((float) mouseY / height), 0, 1, radians(100), radians(-100)));
  rotateY(map(((float) mouseX / width), 0, 1, radians(-100), radians(100)));
  
  box(boxSize.x, boxSize.y, boxSize.z);
  for(int index = 0; index < particles.size(); index++) {
    particles.get(index).checkBounds(boxSize);
    particles.get(index).step();
    translate(particles.get(index).position.x, particles.get(index).position.y, particles.get(index).position.z);
    sphere(particles.get(index).size);
    translate(-particles.get(index).position.x, -particles.get(index).position.y, -particles.get(index).position.z);
  }
}