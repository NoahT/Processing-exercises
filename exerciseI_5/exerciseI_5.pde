import java.util.Random;
int x,
y,
stepX,
stepY,
sd,
size;
Random random;
float speedX,
speedY;

void setup() {
  size(500, 500);
  sd = 5;
  size = 1;
  x = (width / 2) - (size / 2);
  y = (height / 2) - (size / 2);
  random = new Random();
  background(255);
}

void draw() {
  frameRate(30);
  //background(255);
  speedX = (float) random.nextGaussian();
  speedY = (float) random.nextGaussian();
  stepX = (int) (speedX * sd);
  stepY = (int) (speedY * sd);
  x += stepX;
  y += stepY;
  noStroke();
  fill(0);
  rect(x, y, size, size);
  
}