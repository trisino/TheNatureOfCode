ArrayList<ParticleSystem> systems;

void setup(){
  size(600,400);
  systems = new ArrayList<ParticleSystem>();
}

void draw(){
  background(255);

  PVector gravity = new PVector(0.0, 0.07);

  for (ParticleSystem ps : systems){
    ps.run();
    ps.addParticle();
    ps.applyForce(gravity);
  }
  if (mousePressed){
    PVector mousePos = new PVector(mouseX, mouseY);
    systems.add(new ParticleSystem(mousePos));
  }
}
