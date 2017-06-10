ArrayList<Oscillator> oscillators;

void setup() {
  fullScreen();
  frameRate(60);
  
  oscillators = new ArrayList<Oscillator>();
  
  for(int index = 0; index < 1; index++) {
    Oscillator oscillator = new Oscillator();
    oscillators.add(oscillator);
  }
  background(0);
}

void draw() {
  //background(0);
  for(int index = 0; index < oscillators.size(); index++) {
    oscillators.get(index).oscillate();
    oscillators.get(index).sketch();
  }
}