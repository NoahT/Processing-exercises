Plane plane;
PVector gravity,
thrust;
ArrayList<PVector> locations;
int trailLength;
float thrustMagnitude;
void setup() {
  fullScreen();
  frameRate(30);
  
  plane = new Plane();
  
  plane.size = new PVector(30, 15);
  plane.location = new PVector(50, height / 2);
  plane.velocity = new PVector(.5, 0);
  plane.acceleration = new PVector(0, 0);
  plane.strokeColor = color(255);
  plane.maxAcceleration = 100;
  plane.limitVelocity = 1000;
  plane.mass = plane.MASS_UNIT * plane.size.x * plane.size.y;
  plane.liftCoefficient = .5;
  plane.dragCoefficient = .9;
  
  gravity = new PVector(0, 9.8);
  //thrust = new PVector(50, 0);
  thrustMagnitude = 10;
  
  locations = new ArrayList<PVector>();
  
  trailLength = 25;
  
  
}

void draw() {
  background(0);
  plane.applyForce(gravity);
  if(keyPressed)
    if(key == ' ') {//plane.applyForce(thrust);
      plane.applyForce(plane.getPlaneThrust(thrustMagnitude));
      println("pressed");
    }
  plane.stepAll();
  plane.checkBoundsSwap(0, 0, width, height);
  locations.add(new PVector(plane.location.x, plane.location.y));
  
  plane.sketch();
  
  cleanList(locations, trailLength);
  for(int index = locations.size() - 1,
  endIndex = (locations.size() - trailLength < 0 ? 0: locations.size() - trailLength); index >= endIndex; index--) {
    rectMode(CENTER);
    rect(locations.get(index).x, locations.get(index).y, 2, 2);
  }
  
}


void cleanList(ArrayList<PVector> list, int cap) { //there's a better way, I know
  if(list.size() >= cap) {
    for(int index = 0; index < list.size(); index++) {
      if(index >= cap)
        list.remove((list.size() - (1 + index)));
    }
  }
}