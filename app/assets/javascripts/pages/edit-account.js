$(document).ready(function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function(e) {
        $('#img-upload').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $('.img-input').change(function(){
    readURL(this);
  });

  $('[type=file]').on('change', function(){
    var file = this.files[0].name;
    var dflt = $(this).attr('placeholder');
    if($(this).val()!==''){
      $(this).next().text(file);
    } else {
      $(this).next().text(dflt);
    }
  });
});
