$(document).ready( function() {
  var numberFields = $(".validity-number");

  numberFields.keyup(function (element) {
    numberInput = element.target
    if (numberInput.validity.rangeUnderflow) {
      numberInput.setCustomValidity("Ingrese un valor mayor");
    } else {
      numberInput.setCustomValidity("");
    }
  });
});
