var sceneEl = document.querySelector('a-scene');
for (var i = 0; i < 50; i++) {
  var boxEl = document.createElement('a-box');
  boxEl.setAttribute('material', {color: '#EF2D5E'});
  boxEl.setAttribute('position', {x: Math.random() * 20 - 10, y: Math.random() * 20 - 10, z: Math.random() * 20 - 10});
  boxEl.setAttribute('scale', {x: Math.random() / 2, y: Math.random() / 2, z: Math.random() / 2});
  sceneEl.appendChild(boxEl);
}