PImage[] txtrs;
int current;

// The PShape object can contain either custom-built shapes,
// standard primitives (like box and sphere), or meshes built
// in other programs that are exported as .obj files.
PShape box, sphere, torus, cylinder, octahedron, cat;

void setup() {
  surface.setResizable(true);
  pixelDensity(displayDensity());
  size(840, 420, P3D);
  background(64);
  
  // Load 7 textures.
  txtrs = new PImage[7];
  for(int i = 0; i < 7; ++i) {
    txtrs[i] = loadImage("txtr" + i + ".png");
  }
  
  // Choose a random starting texture.
  current = (int)random(7);

  // Load shapes.
  box = loadShape("cube.obj");
  box.setStroke(false);
  box.scale(70, 80, 90);
  box.setTexture(txtrs[current]);
  
  sphere = loadShape("sphere.obj");
  sphere.setStroke(false);
  sphere.scale(75, 75, 100);
  sphere.setTexture(txtrs[current]);

  torus = loadShape("torus.obj");
  torus.setStroke(false);
  torus.scale(50, 50, 50);
  torus.setTexture(txtrs[current]);

  cylinder = loadShape("cylinder.obj");
  cylinder.setStroke(false);
  cylinder.scale(50, 50, 50);
  cylinder.setTexture(txtrs[current]);

  octahedron = loadShape("octahedron.obj");
  octahedron.setStroke(false);
  octahedron.scale(50, 50, 50);
  octahedron.setTexture(txtrs[current]);
  
  cat = loadShape("cat.obj");
  cat.setStroke(false);
  cat.scale(.25,.25,.25);
  cat.setTexture(txtrs[current]);
}

void draw() {
  background(32);

  directionalLight(255, 255, 255, 0, 0.5, -1);
  pointLight(127, 0, 0, width, height, 0);
  pointLight(0, 0, 127, 0, height, 0);
  
  // Rotate shapes. Gimbal lock is not an issue.
  box.rotateZ(0.03);
  box.rotateY(0.01);
  box.rotateX(0.02);

  sphere.rotateY(0.01);
  sphere.rotateX(0.02);
  sphere.rotateZ(0.03);

  torus.rotateY(0.03);
  torus.rotateZ(0.02);
  torus.rotateX(0.01);

  cylinder.rotateX(0.02);
  cylinder.rotateY(0.02);
  cylinder.rotateZ(0.02);

  octahedron.rotateX(0.03);
  octahedron.rotateZ(0.03);
  octahedron.rotateY(0.03);
  
  cat.rotateX(0.02);
  cat.rotateZ(0.02);
  cat.rotateY(0.02);

  // Display shapes.
  shape(octahedron, width * 0.1, height * 0.5);
  shape(torus, width * 0.271, height * 0.5);
  shape(box, width * 0.441, height * 0.5);
  shape(cylinder, width * 0.585, height * 0.5);
  shape(sphere, width * 0.725, height * 0.5);
  shape(cat, width * .850, height * 0.5);
}

void mousePressed() {
  current = (current + 1) % 7;
  box.setTexture(txtrs[current]);
  sphere.setTexture(txtrs[current]);
  torus.setTexture(txtrs[current]);
  cylinder.setTexture(txtrs[current]);
  octahedron.setTexture(txtrs[current]);
  cat.setTexture(txtrs[current]);
}