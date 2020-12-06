import controlP5.*;

ControlP5 cp5;
ColorPicker particleColor;
Textlabel noOfParticles;
float iVelocity;
float gravityVal = 0.15;

ParticleSystem ps;
Floor floor;
void setup() {
  size(1280,720, P3D);
  // background(254, 237, 220);
  background(255);
  ps = new ParticleSystem();
  floor = new Floor();

  cp5 = new ControlP5(this);
  GUI(cp5);
}
 
void draw() {
  background(255);
  floor.display();
  ps.addParticle(particleColor.getColorValue());
  PVector gravity = new PVector(0, gravityVal, 0);
  ps.applyForce(gravity);
  ps.run(floor);
  noOfParticles.setText("No. of Particles: " + ps.getSize());
}

void keyPressed() {
  if (key == ' ') {
    println("Space pressed");
    ps = new ParticleSystem();
  }
}

void GUI(ControlP5 cp5) {
  Group g1 = cp5.addGroup("Particle colour")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(100)
                ;
  particleColor = cp5.addColorPicker("particleColorPicker")
          .setPosition(5, 5)
          .setColorValue(color(240, 0, 0, 255))
          .moveTo(g1)
          ;

  Group g2 = cp5.addGroup("Gravity")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(30)
                ;
  cp5.addSlider("gravityVal")
     .setPosition(5,5)
     .setRange(0, 0.5)
     .moveTo(g2);

  Accordion accordion = cp5.addAccordion("acc")
                 .setPosition(5,5)
                 .setWidth(300)
                 .addItem(g1)
                 .addItem(g2)
                 ;
  
  accordion.open(0);
  accordion.setCollapseMode(Accordion.MULTI);

  noOfParticles = cp5.addTextlabel("noOfParticlesLabel")
                    .setColorValue(0)
                    .setPosition(5, height - 20);
  
}