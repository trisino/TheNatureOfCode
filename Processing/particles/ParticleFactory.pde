// The ParticleFactory keeps track of all possible particles currently
// available, and picks one at random when requested.
//
// To contribute, push the particle object function onto the this.maps array,
// as below.

function ParticleFactory() {
  this.availableparticles = [];
  this.availableparticles.push(Particle); // Vanilla particle
  this.availableparticles.push(StarParticle); // Star particle
  this.availableparticles.push(SquareParticle); // Square particle

  this.getParticle = function() {
    if (this.availableparticles.length == 0) return undefined;

    var selected = floor(random(this.availableparticles.length);
    return new this.availableparticles[selected];
  }
}
