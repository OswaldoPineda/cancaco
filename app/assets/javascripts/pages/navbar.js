$(document).ready(function() {
  $('#openSearchBar').click(function() {
    $('#searchBar').animate({ width: '100%' }, 300)
  });

  $('#closeSearchBar').click(function() {
    $('#searchBar').animate({ width: '0' }, 300)
  });
});
