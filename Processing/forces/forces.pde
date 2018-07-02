// Global variables
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
