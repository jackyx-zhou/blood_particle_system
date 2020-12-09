ControlFrame cf;

float lat, lon;
float eyex, eyey, eyez;
float centerx, centery, centerz;
// float upx, upy, upz;
final float RUN_SPEED = 10.0;
final float TURN_ANGLE = 10.0;

float iVelocity;
int pLifespan = 500;
ColorPicker particleColor;
float gravityVal = 0.15;
float windAngle, windMag;

ParticleSystem ps;
Floor floor;

void settings() {
  size(1280,720, P3D);
  cf = new ControlFrame(this, 400, 800, "Controls");
}

void setup() {
  // background(254, 237, 220);
  background(255);
  frameRate(120);
  initCamera();

  ps = new ParticleSystem();
  floor = new Floor();
}
 
void draw() {
  calculate_lookpoint();
  camera(eyex, eyey, eyez, centerx, centery, centerz, 0, 1, 0);
  // cp5.show();
  background(255);
  floor.display();

  ps.addParticle(particleColor.getColorValue());
  PVector gravity = new PVector(0, gravityVal, 0);
  PVector wind = new PVector(-sin(radians(windAngle)), 0, cos(radians(windAngle))).mult(windMag);
  ps.applyForce(gravity);
  ps.applyForce(wind);

  ps.run(floor);

  noOfParticles.setText("No. of Particles: " + ps.getSize());
  fps.setText("FPS: " + frameRate);
}

void initCamera() {
  eyex = width/2.0;
  eyey = height/2.0;
  eyez = (height/2.0) / tan(PI*30.0 / 180.0);
  centerx = width/2.0;
  centery = height/2.0;
  centerz = 0;
  lat = 0.0;
  lon = 0.0;
}

void calculate_lookpoint() { /* Given an eyepoint and latitude and longitude angles, will
     compute a look point one unit away */
  centerx= eyex + 200 * cos(radians(lat)) * sin(radians(lon));
  centery= eyey + 200 * sin(radians(lat));
  centerz= eyez - 200 * cos(radians(lat)) * cos(radians(lon));

} // calculate_lookpoint()

void keyPressed() {
  if (key == CODED) {
    switch (keyCode) {

      case LEFT: lon-= TURN_ANGLE; break;
      case RIGHT: lon+= TURN_ANGLE; break;

      case UP:
        eyex += sin(radians(lon)) * RUN_SPEED;
        eyez -= cos(radians(lon)) * RUN_SPEED;
      break;
      case DOWN:
        eyex -= sin(radians(lon)) * RUN_SPEED;
        eyez += cos(radians(lon)) * RUN_SPEED;
      break;

    }

  } else {
    switch (key) {
      // Strafing
      case ',':
        eyex += cos(radians(lon)) * RUN_SPEED;
        eyez += sin(radians(lon)) * RUN_SPEED;
      break;
      case '.':
        eyex -= cos(radians(lon)) * RUN_SPEED;
        eyez -= sin(radians(lon)) * RUN_SPEED;
      break;
      case'q':
        eyey += RUN_SPEED;
        break;
      case 'a':
        eyey -= RUN_SPEED;
        break;

      case 'w':
        if (lat+TURN_ANGLE <= 90.0) lat-= TURN_ANGLE; break;
      case 's':
        if (lat-TURN_ANGLE >= -90.0) lat+= TURN_ANGLE; break;
      case 'e': lat= 0.0; break;
      
      // Jumping
      case 32:
        println("Space pressed");
        ps = new ParticleSystem();
      break;

      case 27: exit(); break;  /* Escape key */

    }
  }
  
}
