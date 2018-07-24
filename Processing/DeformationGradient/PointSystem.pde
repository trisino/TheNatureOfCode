class PointSystem {
  ArrayList<Particle> particles;
  PVector location;
  PVector velocity;

  PointSystem() {
    particles = new ArrayList<Particle>();
  }

  PointSystem(PVector theLocation) {
    particles = new ArrayList<Particle>();
    location = theLocation.copy();
  }

  PointSystem(PVector theLocation, PVector theVelocity) {
    particles = new ArrayList<Particle>();
    location = theLocation.copy();
    velocity = theVelocity.copy();
  }

  void addParticle() {
    particles.add(new RoundParticle(location, velocity));
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
