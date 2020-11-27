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
  fetch(`https://api-sepomex.hckdrk.mx/query/info_cp/${$('#zip_code').val()}`)
    .then((resp) => resp.json())
    .then((body) => {
      const { estado, municipio } = body[0].response;
      const city = document.getElementById('city');
      const state = document.getElementById('state');
      city.value = municipio;
      state.value = estado;
      body.forEach((value) => {
        const colonia = value.response.asentamiento;
        $('#neighborhood').append('<option value="'+ colonia +'">' + colonia + '</option>');
      });
    })
    .catch((err) => {
      console.error(err);
    });
}
