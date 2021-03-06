window.Canaco = window.Canaco || {};

window.Canaco.Signup = {
  init: function() {
    $('#zip_code').blur(fillData);
  }
}

var fillData = function(){
  var zipCode = $('#zip_code').val().trim();
  console.log('before debugger')
  debugger
  console.log("zipcode: "+zipCode)

  if (zipCode) {
    $.ajax({
      url: 'https://api-sepomex.hckdrk.mx/query/info_cp/' + zipCode,
      type: 'GET', 
      cors: true ,
      contentType:'application/json',
      secure: true,
      headers: {
        'Access-Control-Allow-Origin': '*',
      },
      success: function(response){
        var response = body[0].response;
        var municipio = response.municipio;
        var estado = response.estado;
        var city = document.getElementById('city');
        var state = document.getElementById('state');
        city.value = municipio;
        state.value = estado;
        body.forEach(function (value) {
          var colonia = value.response.asentamiento;
          $('#neighborhood').append('<option value="'+ colonia +'">' + colonia + '</option>');
        });
      }
    });
  }
}
