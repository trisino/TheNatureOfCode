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

class Attractor {
  PVector location;
  float mass;
  float G;
  PVector dragOffset;

  Attractor(){
    location = new PVector(width/2, height/2);
    mass = 20;
    G = 1;
    dragOffset = new PVector(0.0, 0.0);
  } // constructor

  PVector attract (Mover m){
    PVector force = PVector.sub(location, m.location);
    float d = force.mag();
    d = constrain(d,5,25);
    force.normalize();

    float strength = G *mass * m.mass / (d * d);

    force.mult(strength);

    return force;
  } // attract()

  void show(){
    fill(0,100);
    stroke(0);
    strokeWeight(2);
    ellipse(location.x, location.y, 50, 50);
 }

} // class Attractor


// Global variable
Mover[] balls;
Attractor a;

void setup(){
  size(600,400);
  balls = new Mover[25];
  for (int i=0; i< balls.length; i++){
   balls[i] = new Mover();
  }
  a = new Attractor();

} // setup()

void draw(){
  background(255);
  a.show();

  for (Mover ball : balls) {
    // PVector gravity = new PVector(0,0.3);
    PVector gravity = a.attract(ball);
    // gravity.mult(ball.mass);
    ball.applyForce(gravity);

    //if (mousePressed) {
    // PVector wind = new PVector(0.2 ,0);
    //  ball.applyForce(wind);
    //}

    if (mousePressed) {
     PVector mouse = new PVector(mouseX, mouseY);
      a.location = mouse;
    }

    // Friction
    //PVector friction = ball.velocity.get();
    //friction.normalize();
    //float mu = -0.01;
    //friction.mult(mu);

    //ball.applyForce(friction);

    //ball.edges();
    ball.update();
    ball.show();
  } // for
} // draw()
