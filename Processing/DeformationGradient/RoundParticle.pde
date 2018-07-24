class RoundParticle extends Particle{

  RoundParticle(PVector location){
    super(location);
  }

  void show(){
   fill(255,255,255, lifespan);
   noStroke();
   ellipse(location.x, location.y, 10, 10);
  } // show() method
}
