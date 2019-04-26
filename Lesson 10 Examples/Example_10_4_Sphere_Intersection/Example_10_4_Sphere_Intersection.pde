float r1, r2, sphereDist;
color fill1, fill2;
PVector s1, s2;

void setup() {
  surface.setResizable(true);
  surface.setTitle("Sphere Intersection");
  pixelDensity(displayDensity());
  size(420, 420, P3D);
  background(64);
  noStroke();

  // Sphere 1
  r1 = random(width / 8.0, width / 5.0);
  s1 = new PVector(random(r1, width - r1), 
    random(r1, height - r1), 
    random(-10, 10));
  fill1 = color(255, 0, 0, 127);

  // Sphere 2
  r2 = random(width / 10.0, width / 8.0);
  s2 = new PVector(random(r2, width - r2), 
    random(r2, height - r2), 
    random(-10, 10));
  fill2 = color(0, 0, 255, 127);
}

void draw() {
  background(32);
  lights();

  s2.set(mouseX, mouseY, s2.z);

  //sphereDist = dist(x1, y1, z1, x2, y2, z2);
  sphereDist = PVector.dist(s1, s2);

  if (sphereDist < r1 + r2) {
    fill1 = color(255, 127, 0);
    fill2 = color(0, 127, 255);
  } else {
    fill1 = color(255, 0, 0);
    fill2 = color(0, 0, 255);
  }

  // Sphere 1
  pushMatrix();
  translate(s1.x, s1.y, s1.z);
  fill(fill1);
  sphere(r1);
  popMatrix();

  // Sphere 2
  pushMatrix();
  translate(s2.x, s2.y, s2.z);
  fill(fill2);
  sphere(r2);
  popMatrix();
}