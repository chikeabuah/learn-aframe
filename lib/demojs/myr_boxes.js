function setup() {
  initScene();
}

function draw() {
  for (var i = 0; i < 1000; i++) {
    box(random()/2,random()/2,random()/2);
  }
}

setup();
draw();