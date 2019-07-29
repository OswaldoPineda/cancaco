$(document).ready(function () {
  var cardsDescriptions = document.getElementsByClassName('clampjs');
  $.each(cardsDescriptions, (index ,description) => {
    $clamp(description, {clamp: 3})
  })
});
