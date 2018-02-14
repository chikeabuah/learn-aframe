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
places = [
  'default', 'contact', 'egypt', 'checkerboard', 'forest',
  'goaland', 'yavapai', 'goldmine', 'threetowers', 'poison', 'arches',
  'tron', 'japan', 'dream', 'volcano', 'starry', 'osiris'
]
skyTypes = ['color', 'gradient', 'atmosphere']
entityEl.setAttribute('environment', {
  preset: places[Math.floor(Math.random() * places.length)],
  skyType: skyTypes[Math.floor(Math.random() * skyTypes.length)],
  skyColor: getRandomColor(),
  horizonColor: getRandomColor(),
  shadow: true,
  flatShading: true,
  groundColor: getRandomColor() 
});
sceneEl.appendChild(entityEl);