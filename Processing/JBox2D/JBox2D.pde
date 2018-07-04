ArrayList<Particle> stuff;

void setup(){
  size(800,600);
  background(0);
  stuff = new ArrayList<Particle>();
}


void draw(){
  if (mousePressed){
    PVector location = new PVector(mouseX, mouseY);
    stuff.add(new Particle(location));
  }

  for (Particle object : stuff){
    object.show();
  }
}
