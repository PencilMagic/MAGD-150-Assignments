PImage back, 
  bottom, 
  front, 
  left, 
  right, 
  top, 
  txtr;
float x, y, z, 
  scale, xRotation, yRotation,
  u, v, uOffset, vOffset;
boolean showDiagnosticImages = true;

void setup() {
  surface.setResizable(true);
  surface.setTitle("Texturing");
  pixelDensity(displayDensity());
  size(640, 420, P3D);
  background(64);
  noStroke();
  colorMode(RGB, 255, 255, 255);

  // Translation, rotation and scale of the cube.
  x = width / 2.0;
  y = height / 2.0;
  z = -500;
  scale = min(width, height) / 2.0;
  xRotation = 0;
  yRotation = 0;

  // The coordinates which map a 2-dimensional image
  // to the face of a 3 dimensional object are known
  // as u (the x-axis of the 2D image) and v (the
  // y-axis of the 2D image).

  u = 1;
  v = 1;

  // Since an image of one size and aspect could be
  // mapped to a 3D surface of an entirely different
  // size and aspect - for example, a square image of
  // 400 x 600 pixels could be mapped to a triangle -
  // it is easier to to think of the texture's dimensions
  // as 1:1. This is done with textureMode(NORMAL);

  textureMode(NORMAL);

  // What happens when the u v coordinates exceed 1:1?
  // If the texture is clamped, the excess space will
  // be a streak, but setting textureWrap(REPEAT) will
  // let us tile and pattern a texture.

  textureWrap(REPEAT);

  // Just as u and v cordinates are designed for scaling,
  // they can also be offset. Texture offsetting can be
  // used to simulate scrolling.

  uOffset = 0;
  vOffset = 0;

  // Load the images which will be fed into the texture(s).
  front = loadImage("front.png");
  right = loadImage("right.png");
  back = loadImage("back.png");
  left = loadImage("left.png");
  bottom = loadImage("bottom.png");
  top = loadImage("top.png");
  txtr = loadImage("txtr2.png");
}

void draw() {
  background(32);
  lights();

  // If the right mouse button is pressed, then scale
  // the UV map. Otherwise, rotate the cube based on
  // the mouse's location.
  
  if (mousePressed) {
    if (mouseButton == RIGHT
      && mouseX > 0 && mouseY > 0
      && mouseX < width && mouseY < height) {
      u = map(mouseX, 0, width, 0.5, 10);
      v = map(mouseY, 0, height, 0.5, 10);
    }
  } else {
    xRotation = map(mouseY, -height * 0.5, height * 0.5, 0, TWO_PI);
    yRotation = map(mouseX, -width  * 0.5, width  * 0.5, 0, TWO_PI);
  }

  // Use the arrow keys to offset the texture.
  // Press the space bar to reset to default.

  if (keyPressed) {
    if (key == CODED) {
      if (keyCode == LEFT) {
        uOffset -= 0.01;
      } else if (keyCode == RIGHT) {
        uOffset += 0.01;
      } else if (keyCode == UP) {
        vOffset += 0.01;
      } else if (keyCode == DOWN) {
        vOffset -= 0.01;
      }
    } else if (key == ' ') {
      u = 1;
      v = 1;
      uOffset = 0;
      vOffset = 0;
    }
  }

  // Translate, rotate and scale.
  pushMatrix();
  translate(x, y, z);
  rotateY(yRotation);
  rotateX(xRotation);
  scale(scale);

  beginShape();

  // The ternary operator is a shortcut for if-else
  // statements. If show diagnostic images is true,
  // then this texture will be the front image;
  // otherwise, it will be the texture.

  texture(showDiagnosticImages ? front : txtr);
  vertex(-1, -1, 1, uOffset, vOffset);
  vertex(1, -1, 1, uOffset + u, vOffset);
  vertex(1, 1, 1, uOffset + u, vOffset + v);
  vertex(-1, 1, 1, uOffset, vOffset + v);
  endShape(CLOSE);

  beginShape();
  texture(showDiagnosticImages ? right : txtr);
  vertex(1, -1, 1, uOffset, vOffset);
  vertex(1, -1, -1, uOffset + u, vOffset);
  vertex(1, 1, -1, uOffset + u, vOffset + v);
  vertex(1, 1, 1, uOffset, vOffset + v);
  endShape(CLOSE);

  beginShape();
  texture(showDiagnosticImages ? back : txtr);
  vertex(1, -1, -1, uOffset, vOffset);
  vertex(-1, -1, -1, uOffset + u, vOffset);
  vertex(-1, 1, -1, uOffset + u, vOffset + v); 
  vertex(1, 1, -1, uOffset, vOffset + v);
  endShape(CLOSE);

  beginShape();
  texture(showDiagnosticImages ? left : txtr);
  vertex(-1, -1, -1, uOffset, vOffset);
  vertex(-1, -1, 1, uOffset + u, vOffset);
  vertex(-1, 1, 1, uOffset + u, vOffset + v);
  vertex(-1, 1, -1, uOffset, vOffset + v);
  endShape(CLOSE);

  beginShape();
  texture(showDiagnosticImages ? bottom : txtr);
  vertex(-1, 1, 1, uOffset, vOffset);
  vertex(1, 1, 1, uOffset + u, vOffset);
  vertex(1, 1, -1, uOffset + u, vOffset + v);
  vertex(-1, 1, -1, uOffset, vOffset + v);
  endShape(CLOSE);

  beginShape();
  texture(showDiagnosticImages ? top : txtr);
  vertex(-1, -1, -1, uOffset, vOffset);
  vertex(1, -1, -1, uOffset + u, vOffset);
  vertex(1, -1, 1, uOffset + u, vOffset + v);
  vertex(-1, -1, 1, uOffset, vOffset + v);
  endShape(CLOSE);  
  popMatrix();
}

void mouseReleased() {
  if (mouseButton == LEFT) {
    showDiagnosticImages = !showDiagnosticImages;
  }
}