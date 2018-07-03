class Particle extends Mover{

  int lifespan = 100;

  Particle(){
    super();
    location = new PVector(width/2, 100);
    velocity = new PVector(random(-0.8,0.8), random(-1,0));
  }

  Particle(PVector theLocation){
    super();
    location = theLocation.get();
    velocity = new PVector(random(-0.8,0.8), random(-1,0));
  }

  boolean isDead(){
    if (lifespan <= 0){
      return true;
    } else {
      return false;
    }
  }

  void update(){
   velocity.add(acceleration);
   location.add(velocity);
   acceleration.mult(0);
   lifespan -= 1;
  } // update() method

  void show(){
   fill(255,0,255, lifespan);
   stroke(0, lifespan);
   strokeWeight(2);
   ellipse(location.x, location.y, 10, 10);
  } // show() method
}
