class Mover {
 PVector location;
 PVector velocity;
 PVector acceleration;

 float mass;

 Mover(){ // Default constructor
  mass = random(1,3);
  location = new PVector(random(width),random(height));
  velocity = new PVector(0,0);
  acceleration = new PVector(0,0);
 } // Default constructor

 Mover(float xpos, float ypos){ // alternative constructor
  mass = random(1,3);
  location = new PVector(xpos,ypos);
  velocity = new PVector(0,0);
  acceleration = new PVector(0,0);
 } // overloaded constructor

 void update(){
  velocity.add(acceleration);
  location.add(velocity);
  acceleration.mult(0);
 } // update() method

 void applyForce(PVector f){
  PVector force = PVector.div(f, mass);
  acceleration.add(force);
 } //applyForce() method

 void show(){
  fill(127);
  stroke(0);
  strokeWeight(2);
  ellipse(location.x, location.y, mass*20, mass*20);
 } // show() method

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
 } // edges() method

} // class Mover
