ParticleSystem ps;

void setup(){
  size(600,400);
  ps = new ParticleSystem();
}

void draw(){
  background(255);
  ps.addParticle();
  ps.run();
}
