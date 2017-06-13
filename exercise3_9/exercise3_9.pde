float time,
timeInc,
widthInc;

void setup() {
  fullScreen();
  frameRate(60);
  
  this.time = 0;
  this.timeInc = .01;
  this.widthInc = 10;
  
}

void draw() {
  float currentTime = time; //nested declarations from now on for limit scope use; promote readability
  
  background(255);
  
  for(int index = 0; index <= width; index += this.widthInc) {
    float y = map(noise(currentTime), 0, 1, 0, height);
    stroke(0);
    fill(0);
    rect(index, y, 10, 10);
    currentTime += this.timeInc;
    
    this.time = (currentTime) - ((this.width / this.widthInc) * this.timeInc); //(current time in perlin) - ((number of increments of perlin in scope) * (increment size))
  }
  
}