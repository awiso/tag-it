function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var wallAddress = document.getElementById('wall_address');

    if (wallAddress) {
      var autocomplete = new google.maps.places.Autocomplete(wallAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(wallAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };