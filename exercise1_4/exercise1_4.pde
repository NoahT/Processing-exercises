class Vector3D {
  float x,
  y,
  z;
  
  Vector3D(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  void limit(float max) {
    if(this.mag() > max) {
      this.normalize();
      this.mult(max);
    }
  }
  
  float mag() {
    return (float) Math.sqrt((this.x * this.x) + (this.y * this.y) + (this.z * this.z));
  }
  
  Vector3D normalize() {
    return new Vector3D(this.x / this.mag(), this.y / this.mag(), this.z / this.mag());
  }
  
  void mult(float multiplier) {
    this.x *= multiplier;
    this.y *= multiplier;
    this.z *= multiplier;
  }
}

void draw() {
  
}