window.Canaco = window.Canaco || {};

window.Canaco.Signup = {
  init: function() {
    $("#zip_code").blur(function(e) {
      $.ajax({
          url: 'https://api-codigos-postales.herokuapp.com/v2/codigo_postal/'+$("#zip_code").val(), 
          type: 'GET',
          success: function(response){
            $("#city").val(response.municipio);
            $("#state").val(response.estado);
            $('#neighborhood').empty();
            $.each(response.colonias, function(key, value){
              $('#neighborhood').append('<option value=' + key + '>' + value + '</option>');
            });
          }
      });
    });
  }
}