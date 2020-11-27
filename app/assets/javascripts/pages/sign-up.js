window.Canaco = window.Canaco || {};

window.Canaco.Signup = {
  init: function() {
    $('#zip_code').blur(fillData);

    $(document).ready(function() {
      var zipCode = $('#zip_code').val().trim();
      if (zipCode.length > 0) {
        fillData();
      }
    });
  }
}

var fillData = function(e){
  fetch('https://api-sepomex.hckdrk.mx/query/info_cp/' + $('#zip_code').val());
    .then((resp) => resp.json())
    .then((body) => {
      const response = body[0].response;
      const municipio = response.municipio;
      const estado = response.estado;
      const city = document.getElementById('city');
      const state = document.getElementById('state');
      city.value = municipio;
      state.value = estado;
      body.forEach(funtion (value) {
        const colonia = value.response.asentamiento;
        $('#neighborhood').append('<option value="'+ colonia +'">' + colonia + '</option>');
      });
    })
    .catch(function(err) {
      console.error(err);
    });
}
