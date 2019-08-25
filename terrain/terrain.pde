

int cols, rows;
int scl = 20;
int w = 1500;
int h = 1000;

int background_shade = 10;
int terrain_variation = 150;
float noise_offset = 0.1;

float flying = 0;
float flying_offset = 0.05;

float[][] terrain;

void setup() {
  fullScreen(P3D);
  noFill(); 
  cols = w/scl;
  rows = h/scl;
  terrain = new float[cols][rows];
}


void draw() {

  flying -= flying_offset;
  float yoff = flying;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -1*terrain_variation, terrain_variation);
      xoff += noise_offset;
    }
    yoff += noise_offset;
  }

  //colorMode(RGB, 100);
  background(background_shade, 80);
  stroke(43, 240, 69, 80);
  noFill(); 

  translate(width/2, height/2+50);
  rotateX(PI/3);
  translate(-w/2, -h/2);
  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
      //rect(x*scl, y*scl, scl, scl);
    }
    endShape();
  }
}
