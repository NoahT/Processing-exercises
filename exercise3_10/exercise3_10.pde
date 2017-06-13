Wave wave,
counterWave;

void setup() {
  fullScreen();
  frameRate(60);
  
  wave = new Wave();
  wave.size = 2;
  wave.amplitude = 50;
  wave.angleVel = radians(2);
  wave.xIncrement = 2;
  wave.points.add(new PVector(0, (height / 2) - (5)));
  
  counterWave = new Wave();
  counterWave.size = 2;
  counterWave.amplitude = 50;
  counterWave.angleVel = radians(-2);
  counterWave.xIncrement = 2;
  counterWave.points.add(new PVector(0, (height / 2) - (5)));
  
}

void draw() {
  background(255);
  wave.addWavePoint();
  counterWave.addWavePoint();
  wave.sketch();
  counterWave.sketch();
}