Mover m;

void setup(){
  size(600,400);
  m = new Mover(width/2, height/2);
}

void draw(){
  background(255);
  m.update();
  m.edges();
  m.show();
}
