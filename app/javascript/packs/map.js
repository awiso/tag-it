import GMaps from 'gmaps/gmaps.js';
import { autocomplete } from '../components/autocomplete';


// Generating the map //
const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
  const markers = JSON.parse(mapElement.dataset.markers);
  // Here we store map markers in an array BEFORE adding them to the map
  const mapMarkers = [];
  markers.forEach((marker) => {
    const mapMarker = map.createMarker(marker);
    mapMarkers.push(mapMarker);
    map.addMarker(mapMarker);
  });

  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }

  // Map marker animation
  // Select all cards
  const cards = document.querySelectorAll('.card');
  cards.forEach((card, index) => {
    // Put a microphone on each card listenning for a hover event
    card.addEventListener('mouseenter', () => {
      // Here we trigger the display of the corresponding marker infoWindow as it is the default behavior of a click on a  marker
      google.maps.event.trigger(mapMarkers[index], 'click');
    });
  });
}
autocomplete();


// Adding style to the map//

