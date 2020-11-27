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
  $.ajax({
    url: 'https://api-sepomex.hckdrk.mx/query/info_cp/' + zip_code,
    type: 'GET',
    success: function(response){
      const response = body[0].response;
      const municipio = response.municipio;
      const estado = response.estado;
      const city = document.getElementById('city');
      const state = document.getElementById('state');
      city.value = municipio;
      state.value = estado;
      body.forEach(function (value) {
        const colonia = value.response.asentamiento;
        $('#neighborhood').append('<option value="'+ colonia +'">' + colonia + '</option>');
      });
    }
  });
}
