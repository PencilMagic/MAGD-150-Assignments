int x, y;
void setup(){
   size(200,200);
x=width/2;
y=height/2;
}

void draw(){
  translate(x, y);
  background (mouseX, mouseY, (mouseX+mouseY)%256);
  ellipse(0,0, 50,50);

x++;

if (x-50 > width){
  
  x = -50;
}

}

void mouseClicked(){

save("circle.tif");
}
