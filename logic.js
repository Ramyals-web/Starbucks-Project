var map = null;
var zoomLevel = 3;
var paris = new L.LatLng(48.874652, 2.3200449);

function showMap() {
  initMap();
  loadCSVData();
}

function initMap() {
  var tileLayer = createTileLayer();
  var mapOptions = {
    center: paris,
    zoom: zoomLevel,
    layers: [tileLayer]
  };
  map = new L.Map('map', mapOptions);
 }

function createTileLayer() {
  var tileSourceURL = 'http://{s}.tile.osm.org/{z}/{x}/{y}.png';
  var tileSourceOptions = {
   attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
  };
  return new L.TileLayer(tileSourceURL, tileSourceOptions);
}

function loadCSVData() {
  d3.csv("directory.csv", function(data) {
    for (var i in data) {
        var row = data[i];
  
        var marker = L.marker([row.Latitude, row.Longitude], {
          opacity: 1
        }).bindPopup(row.Store_Name);
        
        marker.addTo(map);
      }
  });
}

// function addMarker(landmark) {
//   L.marker([landmark.Latitude, landmark.Longitude])
//     .bindPopup(landmark.Store_Name)
//     .addTo(map);
// }