
function drawMap(data) {
  const infoWindow = new google.maps.InfoWindow;

  const rows = data['rows'];
  for (var i in rows) {
    if (rows[i][0] != 'Antarctica') {
      var newCoordinates = [];
      const geometries = rows[i][1]['geometries'];
      if (geometries) {
        for (var j in geometries) {
          newCoordinates.push(constructNewCoordinates(geometries[j]));
        }
      } else {
        newCoordinates = constructNewCoordinates(rows[i][1]['geometry']);
      }
      const country = new google.maps.Polygon({
        paths: newCoordinates,
        strokeColor: '#ff9900',
        strokeOpacity: 1,
        strokeWeight: 0.3,
        fillColor: '#ffff66',
        fillOpacity: 0,
        name: rows[i][0]
      });

      google.maps.event.addListener(country, 'mouseover', function() {
        this.setOptions({fillOpacity: 0.4});
      });
      google.maps.event.addListener(country, 'mouseout', function() {
        this.setOptions({fillOpacity: 0});
      });
      google.maps.event.addListener(country, 'click', function( event ) {

        const polygonBounds = this.getPath();
        const coordinates = [];

        for ( var i = 0; i < polygonBounds.length; i++ ) {
          coordinates.push(polygonBounds.getAt(i).lat(), polygonBounds.getAt(i).lng());
        }

        // TODO: Is there a way to filter into 2 arrays concurrently
        const latitudes = coordinates.filter( function ( coordinate, index ) {
          if ( index % 2 === 0 ) {
            return coordinate;
          }
        });

        const northmostLatitude = Math.max( ...latitudes );

        const longitudes = coordinates.filter( function ( coordinate, index ) {
          if ( index % 2 !== 0 ) {
            return coordinate;
          }
        });

        const eastmostLongitude = Math.max( ...longitudes );

        const northwestBound = new google.maps.LatLng( northmostLatitude, eastmostLongitude );

        const clickedCountry = this.name;
        var content = `<h3>${ clickedCountry }</h3>`;

        // TODO: don't display more than 5 languages
        if ( countries[ clickedCountry ] ) {
          const clickedCountryInfo = countries[ clickedCountry ];
          const clickedCountryLanguages = clickedCountryInfo.map( function (language) {
            return { language: language['name'], id: language['id'] };
          });
          console.log( clickedCountryInfo );

          console.log( clickedCountryLanguages );
          for ( var i in clickedCountryLanguages ) {
            const language = clickedCountryLanguages[i]['language'];
            const id = clickedCountryLanguages[i]['id'];
            content += `<a class="map language" href="/languages/${ id }">` + language + '</a>';
          }
        }
        else {
          if ( currentUserPresent ) {
            content += `<a class="map language" href="/languages/new">Add language</a>`;
          } else {
            content += `<p>Request this country's language to be added to the database</p>`;
          }
        }

        // Set the info window's content and position.
        infoWindow.setContent(content);
        infoWindow.setPosition( northwestBound );
        infoWindow.open(map);
      });

      country.setMap(map);
    }
  }
}

function constructNewCoordinates(polygon) {
  var newCoordinates = [];
  const coordinates = polygon['coordinates'][0];
  for (var i in coordinates) {
    newCoordinates.push(
        new google.maps.LatLng(coordinates[i][1], coordinates[i][0]));
  }
  return newCoordinates;
}
