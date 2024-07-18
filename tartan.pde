import processing.pdf.*;

//Tile tile = new Tile(0,0,200);
Tile tile;

int divider=4;
float sc=0.2;


int grid=100;
//PVector joints []= new PVector[4*(divider-1)];



void setup(){
	size(600,600,P3D);

	//rect(0,0,200,200);

	background(255);
	
	noStroke();


}

void draw(){
	beginRaw(PDF, "output.pdf");

	// stroke(0,200,230,25);
	// strokeWeight(12);
	fill(255, 150, 0,55);
	for(int i=grid;i<width-grid;i+=grid){
		for (int j=grid;j<height-grid;j+=grid){
			Tile tile = new Tile(i,j,grid);
			tile.innit();
			tile.drawShape();

		}
	}
		fill(255, 235, 0,55);
	for(int i=grid/2;i<width-grid/2;i+=grid){
		for (int j=grid/2;j<height-grid/2;j+=grid){
			Tile tile = new Tile(i,j,grid);
			tile.innit();
			tile.drawShape();

		}
	}
	sc=-0.25;
	fill(22, 173, 9,55);
	for(int i=grid/2;i<width-grid/2;i+=grid){
		for (int j=grid;j<height-grid;j+=grid){
			Tile tile = new Tile(i,j,grid);
			tile.innit();
			tile.drawShape();

		}
	}
sc=-0.25;
fill(0, 203, 234,55);
	for(int i=grid;i<width-grid;i+=grid){
		for (int j=grid/2;j<height-grid/2;j+=grid){
			Tile tile = new Tile(i,j,grid);
			tile.innit();
			tile.drawShape();

		}
	}


	
	endRaw();
	noLoop();
}

void mousePressed(){


	loop();
	background(0);
	tile.innit();

}