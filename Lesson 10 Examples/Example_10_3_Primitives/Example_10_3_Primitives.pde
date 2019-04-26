PVector spherePos,
  boxPos,
  boxScale;
  
float sphereRadius;

void setup() {
  surface.setResizable(true);
  surface.setTitle("Primitives");
  pixelDensity(displayDensity());
  
  // Adding P3D as an argument to the size function
  // switches Processing's rendering mode to 3D.
  size(640, 420, P3D);
  background(64);
  
  // Set sphere variables.
  spherePos = new PVector(width * 0.25, height * 0.5, 0);
  sphereRadius = 75;
  
  // Set box variables.
  boxPos = new PVector(width * 0.75, height * 0.5, 0);
  boxScale = new PVector(50, 100, 200);
}

void draw() {
  background(32);
  
  // Lighting will add a sense of volume to the scene.
  lights();

  strokeWeight(1.5);
  stroke(255);
  
  fill(0, 127, 255);
  pushMatrix();
  translate(spherePos.x, spherePos.y, spherePos.z);
  rotateX(frameCount / 120.0);
  sphere(sphereRadius);
  popMatrix();

  fill(255, 127, 0);
  pushMatrix();
  translate(boxPos.x, boxPos.y, boxPos.z);
  rotateY(frameCount / 90.0);
  box(boxScale.x, boxScale.y, boxScale.z);
  popMatrix();

  // Change the z or depth of the objects based on the mouse.
  boxPos.z = map(mouseX, 0, width, -75, 75);
  spherePos.z = map(mouseX, 0, width, 75, -75);
}