function setup() {
  initScene();
}

function draw() {
  for (var i = 0; i < 1000; i++) {
    moveTo(random()*20-10,random()*20-10,random()*20-10);
    scale(random()/2,random()/2,random()/2);
    rotation(random()*360,random()*360,random()*360);
    box();
  }
}

setup();
draw();