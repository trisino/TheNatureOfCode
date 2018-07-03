Mover m;
Spring s;

void setup(){
  size(600,400);
  m = new Mover(width/2+50, height/2);
  s = new Spring();
}

void draw(){
  background(255);
  s.connect(m);
  // // Create gravitational force
  // PVector gravity = new PVector(0 ,0.05);
  // m.applyForce(gravity);

  if (mousePressed) {
   PVector wind = new PVector(0.1, 0);
    m.applyForce(wind);
  }

  m.update();
  m.edges();

  s.show();
  m.show();
}
