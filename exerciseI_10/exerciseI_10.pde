import java.util.Random;

float x,
y,
incPerlin,
sizeX,
yMin,
yMax,
yOff;

void setup() {
  size(800, 400);
  incPerlin = .05;
  sizeX = 10;
  x = 0;
  y = height;
  yMin = 20;
  yMax = 200;
  frameRate(30);
  background(255);
}

void draw() {
  if(x < width) {
    stroke(0);
    fill(0);
    y = map(noise(yOff), 0, 1, height - yMin, height - yMax); 
    rect(x, y, sizeX, height - y);
    x += sizeX;
    yOff += incPerlin;
  }
}