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
  fetch(`https://api-sepomex.hckdrk.mx/query/info_cp/${zip_code}`)
    .then((resp) => resp.json())
    .then((body) => {
      const { estado, municipio } = body[0].response;
      const city = document.getElementById(`city_edit_${id}`);
      const state = document.getElementById(`state_edit_${id}`);
      const neighborhoodSelect = document.getElementById(`neighborhood_edit_${id}`);
      neighborhoodSelect.innerHTML = '';
      city.value = municipio;
      state.value = estado;
      body.forEach((value) => {
        const colonia = value.response.asentamiento;
        $(`#neighborhood_edit_${id}`).append('<option value="'+ colonia +'">' + colonia + '</option>');
      });
    })
    .catch((err) => {
      console.error(err);
    });
  // $.ajax({
  //   url: 'https://api-codigos-postales.herokuapp.com/v2/codigo_postal/' + zip_code,
  //   type: 'GET',
  //   success: function(response){
  //     $('#city_edit_' + id).val(response.municipio);
  //     $('#state_edit_' + id).val(response.estado);
  //     $('#neighborhood_edit_' + id).empty();
  //     $.each(response.colonias, function(key, value){
  //       $('#neighborhood_edit_' + id).append('<option value="'+ value +'">' + value + '</option>');
  //     });
  //   }
  // });
}
