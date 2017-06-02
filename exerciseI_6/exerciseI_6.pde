import java.util.Random;
//import java.lang.Math;
int x,
y,
step,
size;
Random random;
void setup() {
  size(700, 700);
  step = 50;
  size = 5;
  x = (width / 2) - (size / 2);
  y = (height / 2) - (size / 2);
  random = new Random();
  background(255);
}

void draw() {
  frameRate(30);
  x += getMonte() * step * (random(1) < .5 ? -1 : 1);
  y += getMonte() * step * (random(1) < .5 ? -1 : 1);
  
  noStroke();
  fill(0);
  rect(x, y, size, size);
  
}

float getMonte() {
  while(true) {
    float num = (float) Math.pow(random(1), 2),
    probability = random(1);
    
    if(probability > num)
      return num;
  }
}