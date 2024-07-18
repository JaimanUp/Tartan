class Tile {





	PVector position ;
	float tileSize ;
	PVector joints []= new PVector[4*(divider-1)];
	IntList order=new IntList();


	Tile(float tx, float ty, int s){
		position= new PVector(tx,ty);
		tileSize= (s);


	}

	void innit(){
		populateJoints();

	}
	void populateJoints(){
		int num=0; 
		for (float i=1; i<(divider);i++){
			joints[num]=new PVector(position.x+i*tileSize/divider,position.y);
			num++;
		}
		for (int i=1; i<(divider);i++){
			joints[num]=new PVector(position.x+tileSize,position.y+i*tileSize/divider);
			num++;

		}
		for (int i=(divider-1); i>0;i--){
			joints[num]=new PVector(position.x+i*tileSize/divider,position.y+tileSize);
			num++;
		}
		for (int i=(divider-1); i>0;i--){
			joints[num]=new PVector(position.x,position.y+i*tileSize/divider);
			num++;
		}
	}

	


	void drawShape(){
		int i=joints.length/8;
		int j=3*joints.length/8;
		int k=5*joints.length/8;
		int l=7*joints.length/8;

		PVector Anch1=joints[i];
		PVector Cntrl1 = PVector.add(Anch1,  controlPoint(i));
		PVector Anch2=joints[j];
		PVector Cntrl2 = PVector.add(Anch2,  controlPoint(j));
		PVector Anch3=joints[k];
		PVector Cntrl3 = PVector.add(Anch3,  controlPoint(k));
		PVector Anch4=joints[l];
		PVector Cntrl4 = PVector.add(Anch4,  controlPoint(l));

		beginShape();
		vertex(Anch1.x,Anch1.y);
		bezierVertex(Cntrl1.x,Cntrl1.y,Cntrl2.x,Cntrl2.y,Anch2.x,Anch2.y);
		bezierVertex(Cntrl2.x,Cntrl2.y,Cntrl3.x,Cntrl3.y,Anch3.x,Anch3.y);
		bezierVertex(Cntrl3.x,Cntrl3.y,Cntrl4.x,Cntrl4.y,Anch4.x,Anch4.y);
		bezierVertex(Cntrl4.x,Cntrl4.y,Cntrl1.x,Cntrl1.y,Anch1.x,Anch1.y);


		endShape();

		
	}




		PVector controlPoint(int i){
			PVector result= new PVector(0,0);
			switch(int(i/(divider-1))){
				case 0:
				result=new PVector(sc*random(-1*tileSize/2,tileSize/2),sc*random(tileSize));
				break;
				case 1:
				result=new PVector(sc*random(-1*tileSize),sc*random(-1*tileSize/2,tileSize/2));
				break;
				case 2:
				result=new PVector(sc*random(-1*tileSize/2,tileSize/2),sc*random(-1*tileSize));
				break;
				case 3:
				result=new PVector(sc*random(1*tileSize),sc*random(-1*tileSize/2,tileSize/2));
				break;}

				return(result);	

			}		



		}

