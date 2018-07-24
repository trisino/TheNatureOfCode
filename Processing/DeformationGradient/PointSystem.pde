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
    PVector xOffset = new PVector(30, 0);
    PVector yOffset = new PVector(0, 10);
    particles = new ArrayList<Particle>();
    location = theLocation.copy();
    velocity = theVelocity.copy();
    for (int m=0; m<4; m++){
      for (int n=0; n<10; n++){
        PVector horzOffset = PVector.mult(xOffset, n);
        PVector vertOffset = PVector.mult(yOffset, m);
        PVector offset = PVector.add(horzOffset, vertOffset);
        PVector newLoc = PVector.add(location, offset);
        addParticle(newLoc, velocity);
      }
    }
  }

  void addParticle() {
    particles.add(new RoundParticle(location, velocity));
  }

  void addParticle(PVector loc, PVector vel) {
    particles.add(new RoundParticle(loc, vel));
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
