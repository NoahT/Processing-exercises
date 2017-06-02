import java.util.Random;
float r,
g,
b,
xOff,
yOff,
xStep,
inc;
void setup() {
  size(500, 500);
  background(255);
  frameRate(30);
  inc = .01;
  xStep = 1;
}

void draw() {
  loadPixels();
  xOff = xStep;
  for(int x = 0; x < width; x++) {
    yOff = 0;
    for(int y = 0; y < height; y++) {
      float brightness = map(noise(xOff, yOff), 0, 1, 0, 255);
      pixels[x * width + y] = color(brightness);
      yOff += inc;
    }
    xOff += inc;
  }
  updatePixels();
  xStep += .5;
}