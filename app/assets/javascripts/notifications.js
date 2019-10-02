// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
function mark(source) {
  checkboxes = document.getElementsByClassName('check');
  for (i=0; i<checkboxes.length; i++) {
		if (checkboxes[i].type === 'checkbox') {
			checkboxes[i].checked = source.checked;
		}
	}
}
