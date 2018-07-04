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
    particles.add(ParticleFactory(location));
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
