ArrayList<ParticleSystem> systems;

void setup(){
  size(600,400);
  systems = new ArrayList<ParticleSystem>();
}

void draw(){
  background(255);
  for (ParticleSystem ps : systems){
    ps.run();
    ps.addParticle();
  }
  if (mousePressed){
    PVector mousePos = new PVector(mouseX, mouseY);
    systems.add(new ParticleSystem(mousePos));
  }
}
