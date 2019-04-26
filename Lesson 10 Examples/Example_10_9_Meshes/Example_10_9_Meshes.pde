float x, y, z, scale, xRotation, yRotation;

void setup() {
  surface.setResizable(true);
  surface.setTitle("Meshes");
  pixelDensity(displayDensity());
  size(640, 420, P3D);
  background(64);
  noStroke();
  colorMode(RGB, 1, 1, 1);

  x = width / 2.0;
  y = height / 2.0;
  z = -500;
  scale = min(width, height) / 2.0;
}

void draw() {
  background(0.125);
  directionalLight(1, 0.95, 0.84, -0.5, 0.5, -0.5);
  pointLight(0.5, 0.25, 0, x, height, 0);

  xRotation = map(mouseY, -height / 2.0, height / 2.0, 0, TWO_PI);
  yRotation = map(mouseX, -width / 2.0, width / 2.0, 0, TWO_PI);

  pushMatrix();

  // Translate, scale and rotate the shape.
  translate(x, y, z);
  rotateY(yRotation);
  rotateX(xRotation);
  
  // To keep the calculations for the square's shape simple,
  // they have been kept to the range 0-1. The scale function
  // has been used to create the appropriate size.
  scale(scale);

  // Front
  beginShape();
  // Each vertex can receive its own fill color, meaning
  // gradients can be easily created.
  fill(1, 0, 0);
  vertex(-1, -1, 1);
  vertex(1, -1, 1);
  fill(1, 0.5, 0);
  vertex(1, 1, 1);
  vertex(-1, 1, 1);  

  beginContour();
  vertex(-0.5, 0.5, 1);
  vertex(0.5, 0.5, 1);
  vertex(0.5, -0.5, 1);
  vertex(-0.5, -0.5, 1);
  endContour();
  endShape(CLOSE);

  // Right
  beginShape(QUADS);
  fill(0, 1, 0);
  vertex(1, -1, 1);
  vertex(1, -1, -1);
  fill(0, 1, 0.5);
  vertex(1, 1, -1);
  vertex(1, 1, 1);
  endShape();

  // Back
  beginShape();
  fill(0, 0, 1);
  vertex(1, -1, -1);
  vertex(-1, -1, -1);
  fill(0.5, 0, 1);
  vertex(-1, 1, -1); 
  vertex(1, 1, -1);
  endShape(CLOSE);

  // Left
  beginShape();
  fill(1, 1, 0);
  vertex(-1, -1, -1);
  vertex(-1, -1, 1);
  fill(0.75, 0.75, 0.25);
  vertex(-1, 1, 1);
  vertex(-1, 1, -1);
  endShape(CLOSE);

  // Bottom
  beginShape();
  fill(0, 1, 1);
  vertex(-1, 1, 1);
  vertex(1, 1, 1);
  fill(0.25, 0.75, 0.75);
  vertex(1, 1, -1);
  vertex(-1, 1, -1);
  endShape(CLOSE);

  // Top
  beginShape();
  fill(1, 0, 1);
  vertex(-1, -1, -1);
  vertex(1, -1, -1);
  fill(0.75, 0.25, 0.75);
  vertex(1, -1, 1);
  vertex(-1, -1, 1);
  endShape(CLOSE);  
  popMatrix();
}