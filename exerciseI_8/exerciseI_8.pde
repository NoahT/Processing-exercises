import java.util.Random;
float r,
g,
b,
xOff,
yOff,
falloff,
inc;
void setup() {
  size(500, 500);
  background(255);
  frameRate(1);
  inc = .05;
  falloff = 0;
}

void draw() {
  falloff += inc;
  loadPixels();
  xOff = 0;
  noiseDetail(20, falloff);
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
}