//Let's start separating classes into independent files.

ArrayList<Mover> moverList;
PVector gravity;
Liquid pocket;
int numberMover = 10;

void setup() {
  size(600, 600);
  frameRate(60);
  
  moverList = new ArrayList<Mover>();
  gravity = new PVector(0, .98);
  
  for(int index = 0; index < 10; index++) {
    Mover mover = new Mover(); //PVector size, PVector location, PVector velocity, PVector acceleration, color strokeColor, float maxAcceleration, float limitVelocity
    mover.size = new PVector((index * 10) + 10, 10);
    mover.location = new PVector(random(width - mover.size.x), 50);
    mover.velocity = new PVector(0, 0);
    mover.acceleration = new PVector(0, 0);
    mover.strokeColor = color(0);
    mover.maxAcceleration = .1;
    mover.limitVelocity = 5;
    
    mover.applyForce(gravity);
    
    moverList.add(mover);
  }
  
  pocket = new Liquid(); //PVector size, PVector frictionDirection, float frictionCoefficient, color strokeColor, color fillColor
  pocket.size = new PVector(width - 1, height - 1);
  pocket.position = new PVector(0, 0);
  pocket.frictionCoefficient = 1;
  pocket.strokeColor = color(0);
  pocket.fillColor = color(200, 200, 255, 150);
  
}

void draw() {
  background(255);
  
  for(int index = 0; index < moverList.size(); index++) {
    moverList.get(index).applyForce(gravity);
    if(pocket.moverIntersects(moverList.get(index))) {
      pocket.applyDrag(moverList.get(index));
    }
    println(moverList.get(index).acceleration.y);
    moverList.get(index).stepAll();
    moverList.get(index).checkBounds(0, 0, 600, 600);
    moverList.get(index).sketch();
  }
  pocket.sketch();
}