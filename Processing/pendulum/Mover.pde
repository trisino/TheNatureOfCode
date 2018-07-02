class Mover {
 PVector location;
 PVector velocity;
 PVector acceleration;
 float mass;

 Mover(){
   mass = random(1,3);
   location = new PVector(random(width),random(height));
   velocity = new PVector(0.1,0);
   acceleration = new PVector(0,0);
 }

 void update(){
  velocity.add(acceleration);
  location.add(velocity);
  acceleration.mult(0);
 }

 void applyForce(PVector f){
  PVector force = PVector.div(f, mass);
  acceleration.add(force);
 }

 void show(){
  fill(127,100);
  stroke(0);
  strokeWeight(2);
  ellipse(location.x, location.y, mass*20, mass*20);
 }

 void edges(){
  if (location.x+20 > width) {
    velocity.x *= -1;
    location.x = width-20;
  }
  if (location.x-20 < 0) {
    velocity.x *= -1;
    location.x = 20;
  }
  if (location.y+20 > height) {
    velocity.y *= -1;
    location.y = height-20;
  }
  if (location.y-20 < 0) {
    velocity.y *= -1;
    location.y = 20;
  }

 }

} // class Mover
