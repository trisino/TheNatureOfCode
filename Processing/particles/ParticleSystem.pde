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
      if (r < 0.5){
        particles.add(new Particle(location));
      } else {
        particles.add(new SquareParticle(location));
      }
    } else {
      particles.add(new Particle());
    }
  }

  void applyForce(PVector force){
    for (Particle p : particles){
      p.applyForce(force);
    }
  }

  void run() {
    for (int i = particles.size()-1; i >=0 ; i--){
      Particle p = particles.get(i);
      if (p.isDead()){
        particles.remove(i);
      } else {
        p.update();
        p.show();
      }
    }
  }
}
