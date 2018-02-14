$("#scene").empty()
$("#scene").append("<a-scene></a-scene>")
function getRandomColor() {
  var letters = '0123456789ABCDEF';
  var color = '#';
  for (var i = 0; i < 6; i++) {
    color += letters[Math.floor(Math.random() * 16)];
  }
  return color;
}
var sceneEl = document.querySelector('a-scene');
var entityEl = document.createElement('a-entity');
presets = ['stars', 'dust', 'rain', 'snow']
entityEl.setAttribute('particle-system', {
  preset: presets[Math.floor(Math.random() * presets.length)],
  color: getRandomColor()
});
sceneEl.appendChild(entityEl);