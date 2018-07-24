class RoundParticle extends Particle{
  PVector velocity;

  RoundParticle(PVector location){
    super(location);
  }

  RoundParticle(PVector location, PVector theVelocity){
    super(location, theVelocity);
  }

  void show(){
   fill(255,255,255, lifespan);
   noStroke();
   ellipse(location.x, location.y, 10, 10);
  } // show() method
}
