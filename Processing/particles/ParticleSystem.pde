class ParticleSystem {
  ArrayList<Particle> particles;

  ParticleSystem() {
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle());
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
