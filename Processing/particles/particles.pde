ArrayList<ParticleSystem> systems;

void setup(){
  size(600,400);
  systems = new ArrayList<ParticleSystem>();
}

void draw(){
  background(0);

  PVector gravity = new PVector(0.0, 0.07);
  PVector wind = new PVector(cos(frameCount/200*PI)*0.05,0);

  for (ParticleSystem ps : systems){
    ps.run();
    ps.addParticle();
    ps.applyForce(gravity);
    ps.applyForce(wind);
  }
  if (mousePressed){
    PVector mousePos = new PVector(mouseX, mouseY);
    systems.add(new ParticleSystem(mousePos));
  }
}
