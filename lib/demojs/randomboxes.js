var sceneEl = document.querySelector('a-scene');
function random () {
  return Math.random()
}
function getRandomColor() {
  var letters = '0123456789ABCDEF';
  var color = '#';
  for (var i = 0; i < 6; i++) {
    color += letters[Math.floor(Math.random() * 16)];
  }
  return color;
}
for (var i = 0; i < 1000; i++) {
  var boxEl = document.createElement('a-box');
  boxEl.setAttribute('material', {color: getRandomColor()});
  var position = {
    x: random() * 20 - 10,
    y: random() * 20 - 10, 
    z: random() * 20 - 10
  }
  boxEl.setAttribute('position', position);
  var scale = {
    x: random() / 2, 
    y: random() / 2, 
    z: random() / 2
  }
  boxEl.setAttribute('scale', scale);
  sceneEl.appendChild(boxEl);
}