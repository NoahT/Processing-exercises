Plane plane;
PVector gravity,
thrust;
ArrayList<PVector> locations;
void setup() {
  size(1200, 600);
  frameRate(120);
  
  plane = new Plane();
  
  plane.size = new PVector(20, 10);
  plane.location = new PVector(10, height / 2);
  plane.velocity = new PVector(0, 0);
  plane.acceleration = new PVector(0, 0);
  plane.strokeColor = color(0);
  plane.maxAcceleration = 1;
  plane.limitVelocity = 5;
  plane.mass = plane.MASS_UNIT * plane.size.x * plane.size.y;
  plane.liftCoefficient = .15;
  plane.dragCoefficient = .5;
  
  gravity = new PVector(0, .098);
  thrust = new PVector(1, 0);
  
  locations = new ArrayList<PVector>();
  
  
}

void draw() {
  background(255);
  plane.applyForce(gravity);
  plane.applyForce(thrust);
  print("(" + plane.velocity.x + ", " + plane.velocity.y + ")\t");
  print("(" + plane.getDragForce().x + ", " + plane.getDragForce().y + ")\t");
  println("(" + plane.getLiftForce().x + ", " + plane.getLiftForce().y + ")");
  plane.stepAll();
  plane.checkBoundsSwap(0, 0, 1200, 600);
  plane.sketch();
  locations.add(new PVector(plane.location.x, plane.location.y));
  for(int index = 0; index < locations.size(); index++) {
    rect(locations.get(index).x, locations.get(index).y, 2, 2);
  }
}