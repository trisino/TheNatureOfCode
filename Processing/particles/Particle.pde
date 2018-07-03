class Particle extends Mover{

  int lifespan = 250;
  int lifespan = 300;

  Particle(){
    super();
    location = new PVector(width/2, 100);
    velocity = new PVector(random(-0.5,0.5), random(0,-1));
  }

  void update(){
   velocity.add(acceleration);
   location.add(velocity);
   acceleration.mult(0);
   lifespan -= 2;
  } // update() method

  void show(){
   fill(127, lifespan);
   stroke(0, lifespan);
   strokeWeight(2);
   ellipse(location.x, location.y, 20, 20);
  } // show() method
}
