import java.util.Random;
Random generator;
int midX,
midY,
size,
sd;
void setup () {
  size(500, 500);
  generator = new Random();
  midX = width / 2;
  midY = height / 2;
  size = 20;
  sd = 50;
  background(255);
}

void draw() {
  float g1 = (float) generator.nextGaussian();
  
  float x = midX + sd * g1;
  float y = midY;
  noStroke();
  fill(128 + (sd * g1), 0, 0, 10);
  rect(x, y, size, size);
  fill(0, 128 + (sd * g1), 0, 10);
  rect(x, y + size, size, size);
  fill(0, 0, 128 + (sd * g1), 10);
  rect(x, y + (size * 2), size, size);
  
}