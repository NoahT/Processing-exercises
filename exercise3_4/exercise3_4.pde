float r,
theta,
x,
y,
red,
green,
blue,
incR,
incG,
incB;
void setup() {
  size(500, 500);
  background(255);
  frameRate(120);
  
  r = 1;
  theta = 0;
  red = floor(random(255));
  green = floor(random(255));
  blue = floor(random(255));
  incR = 1;
  incG = 1;
  incB = 1;
}

void draw() {
  x = r * cos(theta);
  y = r * sin(theta);
  
  noStroke();
  fill(red, green, blue, 150);
  
  if(red >= (255 * .9) || red <= (255 * .1))
    incR *= -1;
  if(green >= (255 * .9) || green <= (255 * .1))
    incG *= -1;
  if(blue >= (255 * .9) || blue <= (255 * .1))
    incB *= -1;
  
  println(red + "\t" + green + "\t" + blue);
  red += incR;
  green += incG;
  blue += incB;
  
  ellipse(x + width / 2, y + height / 2, 2 + (r * .1), 2 + (r * .1));
  r += .1;
  theta += .1;
  //redX += .01;
}