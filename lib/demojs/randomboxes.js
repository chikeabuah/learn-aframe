var sceneEl = document.querySelector('a-scene');
function random () {
  return Math.random()
}
for (var i = 0; i < 500; i++) {
  var boxEl = document.createElement('a-box');
  boxEl.setAttribute('material', {color: '#EF2D5E'});
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