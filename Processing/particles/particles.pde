ArrayList<Particle> particles;

void setup(){
  size(600,400);
  particles = new ArrayList<Particle>();
}

void draw(){
  background(255);
  particles.add(new Particle());

  if (particles.size() > 200){
    particles.remove(0);
  }

  // Create gravitational force
  PVector gravity = new PVector(0 ,0.07);

  for (int i = particles.size()-1; i >=0 ; i--){
    Particle p = particles.get(i);
    if (p.isDead()){
      particles.remove(i);
    } else {
      p.applyForce(gravity);
      p.update();
      p.show();
    }
  }
}
