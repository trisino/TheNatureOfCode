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

  for (Particle p : particles){
    p.applyForce(gravity);
    p.update();
    // p.edges();

    p.show();
  }
}
