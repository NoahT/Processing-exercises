PVector v,
u,
w;

void setup() {
  v = new PVector(1, 5);
  u = v.mult(2);
  w = v.sub(u);
  PVector.div(w, 3);
  
}