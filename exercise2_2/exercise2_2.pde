void applyForce(PVector force, PVector acceleration, float mass) {
  PVector f = PVector.div(force, mass);
  acceleration.add(f);
}