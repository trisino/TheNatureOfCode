class StarParticle extends Particle{

  StarParticle(PVector location){
    super(location);
  }

  void show(){
   fill(204,204,0, lifespan);
   stroke(204,204,0, lifespan);
   strokeWeight(2);
   pushMatrix();
   translate(location.x, location.y);
   triangle(-5, 0, 0, -10, 5, 0);
   triangle(-5, -6, 0, 4, 5, -6);
   popMatrix();
  } // show() method
}
