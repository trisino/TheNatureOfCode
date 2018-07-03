class ParticleSystem {
  ArrayList<Particle> particles;
  PVector location;

  ParticleSystem() {
    particles = new ArrayList<Particle>();
  }

  ParticleSystem(PVector theLocation) {
    particles = new ArrayList<Particle>();
    location = theLocation.copy();
  }

  void addParticle() {
    float r = random(1);
    if (location.mag()>=0){
      if (r < 0.4){
        particles.add(new Particle(location));
      } else {
        particles.add(new SquareParticle(location));
      }
    } else {
      particles.add(new Particle());
    }
  }

  void run() {
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
}
