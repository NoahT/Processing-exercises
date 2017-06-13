Wave wave,
counterWave;

void setup() {
  fullScreen();
  frameRate(60);
  
  wave = new Wave();
  wave.size = 5;
  wave.amplitude = 10;
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
  //background(255);
  wave.addWavePoint();
  wave.sketch();
  if(wave.points.size() >= (width / (wave.xIncrement * 4))) {
    wave.startingVector = wave.points.get(wave.points.size() - 1);
    wave.points.clear();
    wave.angle = 0;
    wave.setAmplitude(wave.getAmplitude() + 50); //wavelength
  }
}