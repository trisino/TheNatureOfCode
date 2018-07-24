ArrayList<PointSystem> systems;

void setup(){
  size(600,400);
  systems = new ArrayList<PointSystem>();
}

void draw(){
  background(0);

  PVector gravity = new PVector(0.0, 0.0);
  PVector wind = new PVector(cos(frameCount/200*PI)*0.0,0);

  for (PointSystem ps : systems){
    ps.run();
    //ps.addParticle();
    ps.applyForce(gravity);
    ps.applyForce(wind);
  }
  if (mousePressed){
    PVector mousePos = new PVector(mouseX, mouseY);
    PVector speed = new PVector(0,0);
    systems.add(new PointSystem(mousePos, speed));
  }
}
