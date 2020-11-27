window.Canaco = window.Canaco || {};

window.Canaco.addresses = {

  init: function() {
    var elements = [], options = []

		$('.zip_code_edit').blur(function(element){
			elementId = element.target.id.split('_')
			id = elementId[elementId.length - 1]
			fillDataEdit(id, element.target.value)
		})

		$(document).ready(function() {
			$('.zip_code_edit').each(function(index, element){
				elementId = element.id.split('_')
				id = elementId[elementId.length - 1]
				var zipCode = element.value.trim();
				if (zipCode.length > 0) {
					fillDataEdit(id, zipCode);
				}
			});
		});

    $('.modal-edit').on('shown.bs.modal', function(e){
      $(e.target).find('input.form-control').each(function(index, element){
				elements.push(element.value)
			});

			$(e.target).find('select.form-control').each(function(index, element){
				options.push(element.value)
			});
    });

    $('.modal-edit').on('hide.bs.modal', function(e){
      $(e.target).find('input.form-control').each(function(index, element){
				element.value = elements[index]
			});

			$(e.target).find('select.form-control option').each(function(index, element){
				element.remove();
			});

			$(e.target).find('select.form-control').append(new Option(options[0], options[0]));

      options = [], elements = []
    })
  }
}

var fillDataEdit = function(id, zip_code){
  $.ajax({
    url: 'https://api-sepomex.hckdrk.mx/query/info_cp/' + zip_code,
    type: 'GET',
    success: function(response){
      const response = body[0].response;
      const municipio = response.municipio;
      const estado = response.estado;
      const city = document.getElementById('city_edit_' + id);
      const state = document.getElementById('state_edit_' + id);
      const neighborhoodSelect = document.getElementById('neighborhood_edit_' + id);
      neighborhoodSelect.innerHTML = '';
      city.value = municipio;
      state.value = estado;
      body.forEach(function (value){
        const colonia = value.response.asentamiento;
        $(`#neighborhood_edit_${id}`).append('<option value="'+ colonia +'">' + colonia + '</option>');
      });
    }
  });
}
