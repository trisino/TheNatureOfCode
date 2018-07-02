Mover m;

void setup(){
  size(600,400);
  m = new Mover(width/2, height/2);
}

void draw(){
  background(255);

  // Create gravitational force
  PVector gravity = new PVector(0 ,0.01);
  m.applyForce(gravity);
  m.update();
  m.edges();

  if (mousePressed) {
   PVector wind = new PVector(0.1, 0);
    m.applyForce(wind);
  }

  m.show();
}
