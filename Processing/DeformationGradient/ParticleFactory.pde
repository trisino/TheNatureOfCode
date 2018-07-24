// The ParticleFactory keeps track of all possible particles currently
// available, and picks one at random when requested.
//
// To contribute, push the particle object function onto the this.maps array,
// as below.

Particle ParticleFactory(PVector location) {

  ArrayList<Particle> particles = new ArrayList<Particle>();
  particles.add(new Particle(location)); // Vanilla particle
  particles.add(new StarParticle(location)); // Star particle
  particles.add(new SquareParticle(location)); // Square particle

  int selected = floor(random(particles.size()));
  return particles.get(selected);
}
