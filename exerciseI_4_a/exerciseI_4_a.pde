import java.util.Random;
Random generator;
int midX,
midY,
sd;
void setup () {
  size(500, 500);
  generator = new Random();
  midX = width / 2;
  midY = height / 2;
  sd = 50;
  background(255);
}

void draw() {
  float g1 = (float) generator.nextGaussian();
  float g2 = (float) generator.nextGaussian();
  float x = midX + sd * g1;
  float y = midY + sd * g2;
  noStroke();
  fill(0, 10);
  ellipse(x, y, 20, 20);
  
}