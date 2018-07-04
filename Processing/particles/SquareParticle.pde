class SquareParticle extends Particle{

  SquareParticle(PVector location){
    super(location);
  }

  void show(){
   fill(0,255,0, lifespan);
   stroke(0,255,0, lifespan);
   strokeWeight(2);
   rect(location.x, location.y, 10, 10);
  } // show() method
}
