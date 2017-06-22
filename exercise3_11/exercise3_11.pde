Wave wave,
counterWave;

void setup() {
  fullScreen();
  frameRate(120);
  
  wave = new Wave();
  wave.size = 5;
  wave.amplitude = 100;
  wave.angleVel = radians(2);
  wave.xIncrement = 2;
  wave.points.add(new PVector(0, (height / 2) - (5)));
  
  counterWave = new Wave();
  counterWave.size = 5;
  counterWave.amplitude = 200;
  counterWave.angleVel = radians(10);
  counterWave.xIncrement = 2;
  //counterWave.points.add(new PVector(0, (height / 2) - (5)));
  
  //background(255);
}

void draw() {
  background(255);
  wave.sketch();
  if(wave.points.size() >= (width / (wave.xIncrement * 2))) {
    wave.amplitude = (wave.amplitude < counterWave.amplitude ? wave.amplitude + 1 : counterWave.amplitude);
    wave.angleVel = (wave.angleVel < counterWave.angleVel ? wave.angleVel + radians(.2) : counterWave.angleVel);
  }
  wave.addWavePoint();
  wave.sketch();
}